cat <<EOF >~/.local/share/applications/WeztermHost.desktop
[Desktop Entry]
Name=WezTerm (Host)
Comment=Wez's Terminal Emulator
Keywords=shell;prompt;command;commandline;cmd;
Icon=/home/$USER/.local/share/omakase-blue/applications/icons/wezterm.png
StartupWMClass=org.wezfurlong.wezterm.host
TryExec=wezterm
Exec=wezterm start --class org.wezfurlong.wezterm.host --cwd . -- fish -l
Type=Application
Categories=System;TerminalEmulator;Utility;
Terminal=false
EOF
