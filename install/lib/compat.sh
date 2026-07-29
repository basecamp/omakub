#!/bin/bash

# Compatibility helpers for running Omakub across Ubuntu releases.
#
# Ubuntu renames, drops, and re-splits packages between releases, Yaru ships a
# different set of accent variants each cycle, and third-party repositories only
# publish for a codename some months after that release ships. Hardcoding names
# that were correct for one release is what breaks Omakub on the next one, so the
# installers ask these helpers what is actually available on the running system.

[ -n "${OMAKUB_COMPAT_LOADED:-}" ] && return 0
OMAKUB_COMPAT_LOADED=1

omakub_note() { echo "Omakub: $*"; }

omakub_os_release() {
	local key=$1
	(. /etc/os-release && printf '%s' "${!key}")
}

omakub_ubuntu_codename() { omakub_os_release UBUNTU_CODENAME; }
omakub_ubuntu_version() { omakub_os_release VERSION_ID; }

# Ubuntu codenames released before the running one, newest first. Lets a repo that
# has not published for this release yet fall back to the newest suite it does have.
omakub_older_codenames() {
	local csv=/usr/share/distro-info/ubuntu.csv
	[ -f "$csv" ] || return 0

	awk -F, -v current="$(omakub_ubuntu_version)" '
		NR > 1 {
			split($1, release, " ")
			if (release[1] + 0 < current + 0) print release[1] "," $3
		}
	' "$csv" | sort -t, -k1,1Vr | cut -d, -f2
}

# --- apt -------------------------------------------------------------------

# True when apt has an installation candidate for the package on this release.
apt_available() {
	[ -n "$(apt-cache policy -- "$1" 2>/dev/null | awk -F': ' '/Candidate:/ && $2 != "(none)" {print $2}')" ]
}

# Echo the first of several package names that this release actually ships.
apt_first_available() {
	local package
	for package in "$@"; do
		if apt_available "$package"; then
			printf '%s' "$package"
			return 0
		fi
	done
	return 1
}

# Install the first package name that exists here, so a rename between releases
# (libncurses5-dev -> libncurses-dev) does not abort the installer.
apt_install_first() {
	local package
	if package=$(apt_first_available "$@"); then
		sudo apt install -y "$package"
	else
		omakub_note "none of these packages exist on $(omakub_ubuntu_codename): $*" >&2
		return 1
	fi
}

# --- repositories ----------------------------------------------------------

# True when an apt repository publishes a Release file for the given suite.
repo_publishes_suite() {
	curl --silent --fail --location --max-time 15 --output /dev/null \
		"${1%/}/dists/$2/Release"
}

# Newest suite a codename-keyed repository publishes, starting at this release and
# walking back through older Ubuntu codenames. Docker in particular lags new releases.
repo_best_suite() {
	local base_url=$1 suite

	for suite in "$(omakub_ubuntu_codename)" $(omakub_older_codenames); do
		if repo_publishes_suite "$base_url" "$suite"; then
			printf '%s' "$suite"
			return 0
		fi
	done

	return 1
}

# True when a Launchpad PPA has a build of the package for this Ubuntu series.
# Launchpad serves an empty index for series a PPA never built for, so checking
# the Release file alone is not enough.
ppa_publishes_package() {
	local ppa=${1#ppa:} package=$2 series=${3:-$(omakub_ubuntu_codename)}

	curl --silent --fail --location --max-time 20 \
		"https://ppa.launchpadcontent.net/${ppa%%/*}/${ppa#*/}/ubuntu/dists/$series/main/binary-$(dpkg --print-architecture)/Packages.gz" |
		gunzip 2>/dev/null | grep -qx "Package: $package"
}

# Add a PPA only when it has a build for this release, so callers can fall back to
# the Ubuntu archive instead of leaving behind a source that 404s on every apt update.
add_ppa_if_published() {
	local ppa=$1 package=$2

	if ppa_publishes_package "$ppa" "$package"; then
		sudo add-apt-repository -y "$ppa"
		sudo apt update -y
		return 0
	fi

	omakub_note "$ppa has no $package build for $(omakub_ubuntu_codename)"
	return 1
}

# --- gnome -----------------------------------------------------------------

# gsettings exits non-zero on an unknown schema or key, which aborts the installer
# whenever Gnome renames one or an extension failed to install.
gsettings_set_if_available() {
	local schema=$1 key=$2 value=$3

	if gsettings list-keys "${schema%%:*}" 2>/dev/null | grep -qx -- "$key"; then
		gsettings set "$schema" "$key" "$value"
	else
		omakub_note "skipping unavailable setting ${schema%%:*} $key"
	fi

	return 0
}

# Yaru ships a different set of accent variants each cycle: 24.04 had "bark" and
# "viridian", 25.10 dropped both and added "wartybrown" and "yellow". Map onto a
# variant this release installs so GTK apps keep the theme's color.
yaru_variant_for() {
	local color=$1 candidate candidates

	case $color in
	bark) candidates="bark wartybrown olive" ;;
	viridian) candidates="viridian prussiangreen sage" ;;
	*) candidates="$color" ;;
	esac

	for candidate in $candidates; do
		if [ -d "/usr/share/themes/Yaru-$candidate-dark" ] && [ -d "/usr/share/icons/Yaru-$candidate" ]; then
			printf '%s' "$candidate"
			return 0
		fi
	done

	return 1
}

# Gnome 47+ exposes a fixed accent-color enum whose names do not all match Yaru's
# variants. Translate so every theme gets an accent, not just the ones whose name
# happens to appear in both lists.
gnome_accent_for() {
	local accent

	case $1 in
	magenta) accent=pink ;;
	sage) accent=green ;;
	bark) accent=brown ;;
	grey) accent=slate ;;
	*) accent=$1 ;;
	esac

	if gsettings range org.gnome.desktop.interface accent-color 2>/dev/null | grep -qx -- "'$accent'"; then
		printf '%s' "$accent"
		return 0
	fi

	return 1
}
