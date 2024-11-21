cat <<EOF >~/.local/share/applications/WeztermHost.desktop
[Desktop Entry]
Name=WezTerm (Host)
Comment=Wez's Terminal Emulator
Keywords=shell;prompt;command;commandline;cmd;
Icon=/home/$USER/.local/share/omakase-bluefin/applications/icons/wezterm.png
StartupWMClass=org.wezfurlong.wezterm
TryExec=wezterm
Exec=wezterm start --cwd . -- fish -l
Type=Application
Categories=System;TerminalEmulator;Utility;
Terminal=false
EOF
