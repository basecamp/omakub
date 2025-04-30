#!/bin/bash

gsettings reset org.gnome.desktop.wm.keybindings close
gsettings reset org.gnome.desktop.wm.keybindings maximize
gsettings reset org.gnome.desktop.wm.keybindings begin-resize
gsettings reset org.gnome.settings-daemon.plugins.media-keys next
gsettings reset org.gnome.desktop.wm.keybindings toggle-fullscreen
gsettings reset org.gnome.mutter dynamic-workspaces
gsettings reset org.gnome.desktop.wm.preferences num-workspaces

for i in {1..9}; do
    gsettings reset org.gnome.shell.keybindings "switch-to-application-$i"
done

for i in {1..6}; do
    gsettings reset org.gnome.desktop.wm.keybindings "switch-to-workspace-$i"
done

gsettings reset org.gnome.settings-daemon.plugins.media-keys custom-keybindings

gsettings reset org.gnome.desktop.wm.keybindings switch-input-source

cat > ~/.config/alacritty/alacritty.toml << EOF
[env]
TERM = "xterm-256color"

[window]
decorations = "Full"
opacity = 1.0

[keyboard]
bindings = []
EOF

cat > ~/.config/zellij/config.kdl << EOF
theme "default"
default_layout "default"
on_force_close "quit"

default_mode "locked"
keybinds clear-defaults=false {
    locked {
        bind "Ctrl g" { SwitchToMode "normal"; }
    }
}
EOF

cat > ~/.inputrc << EOF
set completion-ignore-case on
set show-all-if-ambiguous on
set show-all-if-unmodified on
EOF

cat > ~/.XCompose << EOF
include "%L"
EOF

gnome-shell --replace &

echo "Keyboard settings have been reset to defaults. Please log out and log back in for all changes to take effect." 