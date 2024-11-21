cat <<EOF >~/.local/share/applications/Wezterm.desktop
[Desktop Entry]
Name=WezTerm (Toolbox)
Comment=Wez's Terminal Emulator
Keywords=shell;prompt;command;commandline;cmd;
Icon=/home/$USER/.local/share/omakase-bluefin/applications/icons/wezterm.png
StartupWMClass=org.wezfurlong.wezterm
TryExec=wezterm
Exec=wezterm start --cwd . -- distrobox-enter omakase-toolbox -- fish -l
Type=Application
Categories=System;TerminalEmulator;Utility;
Terminal=false
EOF
