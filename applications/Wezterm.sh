cat <<EOF >~/.local/share/applications/Wezterm.desktop
[Desktop Entry]
Name=WezTerm (Toolbox)
Comment=Wez's Terminal Emulator
Keywords=shell;prompt;command;commandline;cmd;
Icon=/home/$USER/.local/share/omakase-blue/applications/icons/wezterm.png
StartupWMClass=org.wezfurlong.wezterm.toolbox
TryExec=wezterm
Exec=wezterm start --class org.wezfurlong.wezterm.toolbox --cwd . -- distrobox-enter omakase-toolbox
Type=Application
Categories=System;TerminalEmulator;Utility;
Terminal=false
EOF
