#!/bin/bash

# Download the prebuilt Onyx control-panel TUI (Bubble Tea). This powers the
# `onyx` command after install. If the download fails or the arch is
# unsupported, `bin/onyx` transparently falls back to the legacy bash menu.

ARCH=$(dpkg --print-architecture)

case "$ARCH" in
amd64 | arm64) ;;
*)
	echo "Onyx TUI: unsupported architecture '$ARCH' — the 'onyx' command will use the bash menu."
	return 0 2>/dev/null || exit 0
	;;
esac

DEST="$HOME/.local/share/onyx/bin/onyx-tui"
URL="https://github.com/Vicjocaso/onyx-setup/releases/latest/download/onyx-tui_linux_${ARCH}"

mkdir -p "$(dirname "$DEST")"
if wget -qO "$DEST.tmp" "$URL"; then
	chmod +x "$DEST.tmp"
	mv "$DEST.tmp" "$DEST"
else
	echo "Onyx TUI: download failed — the 'onyx' command will use the bash menu fallback."
	rm -f "$DEST.tmp"
fi
