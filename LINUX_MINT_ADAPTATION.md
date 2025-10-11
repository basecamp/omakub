# Linux Mint Adaptation Guide for Omakub

This document outlines all the changes needed to adapt Omakub for Linux Mint compatibility while maintaining Ubuntu support.

## Overview

Omakub is currently designed specifically for Ubuntu 24.04+ with GNOME desktop environment. To support Linux Mint, we need to address OS detection, desktop environment differences, and repository compatibility issues.

## Required Changes

### 1. OS Version Detection

**File:** `install/check-version.sh`

**Current Issue:** Script only accepts Ubuntu 24.04+
**Required Change:** Add Linux Mint support

```bash
# Current code (lines 11-18):
if [ "$ID" != "ubuntu" ] || [ $(echo "$VERSION_ID >= 24.04" | bc) != 1 ]; then
  echo "$(tput setaf 1)Error: OS requirement not met"
  echo "You are currently running: $ID $VERSION_ID"
  echo "OS required: Ubuntu 24.04 or higher"
  echo "Installation stopped."
  exit 1
fi

# Proposed change:
if [ "$ID" != "ubuntu" ] && [ "$ID" != "linuxmint" ]; then
  echo "$(tput setaf 1)Error: OS requirement not met"
  echo "You are currently running: $ID $VERSION_ID"
  echo "OS required: Ubuntu 24.04+ or Linux Mint 21+"
  echo "Installation stopped."
  exit 1
elif [ "$ID" = "ubuntu" ] && [ $(echo "$VERSION_ID >= 24.04" | bc) != 1 ]; then
  echo "$(tput setaf 1)Error: Ubuntu version requirement not met"
  echo "You are currently running: Ubuntu $VERSION_ID"
  echo "Ubuntu version required: 24.04 or higher"
  echo "Installation stopped."
  exit 1
elif [ "$ID" = "linuxmint" ] && [ $(echo "$VERSION_ID >= 21" | bc) != 1 ]; then
  echo "$(tput setaf 1)Error: Linux Mint version requirement not met"
  echo "You are currently running: Linux Mint $VERSION_ID"
  echo "Linux Mint version required: 21 or higher"
  echo "Installation stopped."
  exit 1
fi
```

### 2. Desktop Environment Detection

**File:** `install.sh`

**Current Issue:** Only checks for GNOME
**Required Change:** Add support for Cinnamon, MATE, and Xfce

```bash
# Current code (lines 19-31):
if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
  # Desktop installation code
else
  echo "Only installing terminal tools..."
  source ~/.local/share/omakub/install/terminal.sh
fi

# Proposed change:
if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
  echo "Installing terminal and desktop tools for GNOME..."
  source ~/.local/share/omakub/install/terminal.sh
  source ~/.local/share/omakub/install/desktop.sh
elif [[ "$XDG_CURRENT_DESKTOP" == *"Cinnamon"* ]] || [[ "$XDG_CURRENT_DESKTOP" == *"X-Cinnamon"* ]]; then
  echo "Installing terminal and desktop tools for Cinnamon..."
  source ~/.local/share/omakub/install/terminal.sh
  source ~/.local/share/omakub/install/desktop-cinnamon.sh
elif [[ "$XDG_CURRENT_DESKTOP" == *"MATE"* ]]; then
  echo "Installing terminal and desktop tools for MATE..."
  source ~/.local/share/omakub/install/terminal.sh
  source ~/.local/share/omakub/install/desktop-mate.sh
elif [[ "$XDG_CURRENT_DESKTOP" == *"XFCE"* ]]; then
  echo "Installing terminal and desktop tools for XFCE..."
  source ~/.local/share/omakub/install/terminal.sh
  source ~/.local/share/omakub/install/desktop-xfce.sh
else
  echo "Desktop environment not recognized. Only installing terminal tools..."
  source ~/.local/share/omakub/install/terminal.sh
fi
```

### 3. Ubuntu-Specific GNOME Extensions

**File:** `install/desktop/set-gnome-extensions.sh`

**Current Issue:** Tries to disable Ubuntu-specific extensions that don't exist on Mint
**Required Change:** Make Ubuntu extension disabling conditional

```bash
# Current code (lines 7-10):
gnome-extensions disable tiling-assistant@ubuntu.com
gnome-extensions disable ubuntu-appindicators@ubuntu.com
gnome-extensions disable ubuntu-dock@ubuntu.com
gnome-extensions disable ding@rastersoft.com

# Proposed change:
# Only disable Ubuntu-specific extensions if running on Ubuntu
if [ "$ID" = "ubuntu" ]; then
  gnome-extensions disable tiling-assistant@ubuntu.com
  gnome-extensions disable ubuntu-appindicators@ubuntu.com
  gnome-extensions disable ubuntu-dock@ubuntu.com
  gnome-extensions disable ding@rastersoft.com
fi
```

### 4. Repository URLs for Docker

**File:** `install/terminal/docker.sh`

**Current Issue:** Uses Ubuntu-specific repository URL
**Required Change:** Use appropriate repository for Linux Mint

```bash
# Current code (line 7):
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Proposed change:
if [ "$ID" = "ubuntu" ]; then
  DOCKER_DISTRO="ubuntu"
  DOCKER_CODENAME=$(. /etc/os-release && echo "$VERSION_CODENAME")
elif [ "$ID" = "linuxmint" ]; then
  DOCKER_DISTRO="ubuntu"
  # Map Linux Mint versions to Ubuntu codenames
  case "$VERSION_ID" in
    "21.*") DOCKER_CODENAME="focal" ;;
    "22.*") DOCKER_CODENAME="jammy" ;;
    *) DOCKER_CODENAME="jammy" ;;  # Default to jammy for newer versions
  esac
else
  DOCKER_DISTRO="ubuntu"
  DOCKER_CODENAME="jammy"
fi

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/$DOCKER_DISTRO $DOCKER_CODENAME stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

### 5. ULauncher PPA

**File:** `install/desktop/ulauncher.sh`

**Current Issue:** Uses Ubuntu-specific PPA URL
**Required Change:** Verify PPA compatibility or provide alternative

```bash
# Current code (line 5):
echo "deb [signed-by=/usr/share/keyrings/ulauncher-archive-keyring.gpg] http://ppa.launchpad.net/agornostal/ulauncher/ubuntu noble main" | sudo tee /etc/apt/sources.list.d/ulauncher-noble.list

# Proposed change:
if [ "$ID" = "ubuntu" ]; then
  UBUNTU_CODENAME=$(. /etc/os-release && echo "$VERSION_CODENAME")
elif [ "$ID" = "linuxmint" ]; then
  # Map Linux Mint to Ubuntu codename for PPA compatibility
  case "$VERSION_ID" in
    "21.*") UBUNTU_CODENAME="focal" ;;
    "22.*") UBUNTU_CODENAME="jammy" ;;
    *) UBUNTU_CODENAME="noble" ;;
  esac
else
  UBUNTU_CODENAME="noble"
fi

echo "deb [signed-by=/usr/share/keyrings/ulauncher-archive-keyring.gpg] http://ppa.launchpad.net/agornostal/ulauncher/ubuntu $UBUNTU_CODENAME main" | sudo tee /etc/apt/sources.list.d/ulauncher-${UBUNTU_CODENAME}.list
```

## New Files to Create

### 1. Desktop Environment Specific Installers

**File:** `install/desktop-cinnamon.sh`
```bash
#!/bin/bash

# Run common desktop installers that work with Cinnamon
source ~/.local/share/omakub/install/desktop/a-flatpak.sh
source ~/.local/share/omakub/install/desktop/fonts.sh
source ~/.local/share/omakub/install/desktop/applications.sh

# Skip GNOME-specific configurations
# source ~/.local/share/omakub/install/desktop/set-gnome-extensions.sh
# source ~/.local/share/omakub/install/desktop/set-gnome-settings.sh
# source ~/.local/share/omakub/install/desktop/set-gnome-hotkeys.sh

# Run Cinnamon-compatible configurations
source ~/.local/share/omakub/install/desktop/set-cinnamon-settings.sh

# Install applications
for installer in ~/.local/share/omakub/install/desktop/app-*.sh; do
  # Skip GNOME-specific apps
  if [[ ! "$installer" =~ gnome ]]; then
    source "$installer"
  fi
done

# Optional applications
source ~/.local/share/omakub/install/desktop/select-optional-apps.sh

# Logout to pickup changes
gum confirm "Ready to reboot for all settings to take effect?" && sudo reboot
```

**File:** `install/desktop/set-cinnamon-settings.sh`
```bash
#!/bin/bash

# Cinnamon-specific settings using gsettings or dconf
# These would need to be researched and implemented based on Cinnamon's schema

# Example settings (need to verify actual Cinnamon schemas):
# gsettings set org.cinnamon.desktop.interface monospace-font-name 'CaskaydiaMono Nerd Font 10'
# gsettings set org.cinnamon.desktop.screensaver lock-enabled false

echo "Cinnamon settings configuration is not yet implemented."
echo "Please configure your desktop environment manually or contribute Cinnamon-specific settings."
```

### 2. MATE Desktop Support

**File:** `install/desktop-mate.sh`
```bash
#!/bin/bash

# Similar structure to Cinnamon but for MATE
source ~/.local/share/omakub/install/desktop/a-flatpak.sh
source ~/.local/share/omakub/install/desktop/fonts.sh
source ~/.local/share/omakub/install/desktop/applications.sh

# MATE-specific settings
source ~/.local/share/omakub/install/desktop/set-mate-settings.sh

# Install applications (skip GNOME-specific ones)
for installer in ~/.local/share/omakub/install/desktop/app-*.sh; do
  if [[ ! "$installer" =~ gnome ]]; then
    source "$installer"
  fi
done

source ~/.local/share/omakub/install/desktop/select-optional-apps.sh
gum confirm "Ready to reboot for all settings to take effect?" && sudo reboot
```

### 3. Boot Script Update

**File:** `boot.sh`

**Current Issue:** References Ubuntu only
**Required Change:** Update messaging

```bash
# Current code (line 13):
echo "=> Omakub is for fresh Ubuntu 24.04+ installations only!"

# Proposed change:
echo "=> Omakub is for fresh Ubuntu 24.04+ or Linux Mint 21+ installations!"
```

## Testing Strategy

### Phase 1: Terminal Tools Only
1. Test on Linux Mint with terminal installation only
2. Verify all terminal applications install correctly
3. Check for any Ubuntu-specific repository issues

### Phase 2: Desktop Environment Integration
1. Test GNOME desktop features on Linux Mint (if available)
2. Implement and test Cinnamon-specific configurations
3. Test MATE and Xfce installations

### Phase 3: Full Integration
1. Test complete installation process
2. Verify all applications launch correctly
3. Test theme and customization features

## Repository Structure Changes

```
install/
├── desktop.sh              # Existing GNOME installer
├── desktop-cinnamon.sh      # New: Cinnamon installer
├── desktop-mate.sh          # New: MATE installer  
├── desktop-xfce.sh          # New: XFCE installer
└── desktop/
    ├── set-gnome-*.sh       # Existing GNOME settings
    ├── set-cinnamon-*.sh    # New: Cinnamon settings
    ├── set-mate-*.sh        # New: MATE settings
    └── set-xfce-*.sh        # New: XFCE settings
```

## Compatibility Matrix

| Component | Ubuntu GNOME | Mint Cinnamon | Mint MATE | Mint Xfce | Status |
|-----------|--------------|---------------|-----------|-----------|---------|
| Terminal Tools | ✅ | ✅ | ✅ | ✅ | Ready |
| Package Management | ✅ | ✅ | ✅ | ✅ | Ready |
| Flatpak | ✅ | ✅ | ✅ | ✅ | Ready |
| Desktop Settings | ✅ | ⚠️ | ⚠️ | ⚠️ | Needs Implementation |
| GNOME Extensions | ✅ | ❌ | ❌ | ❌ | N/A |
| Themes | ✅ | ⚠️ | ⚠️ | ⚠️ | Needs Testing |

## Priority Order

1. **High Priority** (Essential for basic functionality)
   - OS detection fix (`check-version.sh`)
   - Desktop environment detection (`install.sh`)
   - Ubuntu extension handling (`set-gnome-extensions.sh`)

2. **Medium Priority** (Important for full functionality)
   - Repository URL fixes (Docker, ULauncher)
   - Basic desktop environment installers
   - Boot script messaging

3. **Low Priority** (Nice to have)
   - Desktop environment specific settings
   - Advanced theming support
   - Complete feature parity across all DEs

## Notes

- Linux Mint is based on Ubuntu LTS releases, so most Ubuntu repositories should work
- Cinnamon, MATE, and Xfce have different configuration systems than GNOME
- Some GNOME-specific applications may not integrate well with other desktop environments
- Testing should be done on actual Linux Mint installations, not just in VMs

## Contributing

When implementing these changes:
1. Test each change thoroughly
2. Maintain backward compatibility with Ubuntu
3. Document any desktop environment specific requirements
4. Consider creating a separate branch for Mint support initially
5. Add appropriate error handling and user feedback