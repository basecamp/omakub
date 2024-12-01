cd /tmp
curl -LO https://github.com/wez/wezterm/releases/download/20240203-110809-5046fc22/WezTerm-20240203-110809-5046fc22-Ubuntu20.04.AppImage
chmod +x WezTerm-20240203-110809-5046fc22-Ubuntu20.04.AppImage
mv WezTerm-20240203-110809-5046fc22-Ubuntu20.04.AppImage ~/.local/bin/wezterm
if [ ! -d "$HOME/.config/wezterm/wezterm.lua" ]; then
  mkdir -p ~/.config/wezterm
  cp ~/.local/share/omakase-blue/configs/wezterm.lua ~/.config/wezterm/wezterm.lua
fi
if [ ! -d "$HOME/.config/wezterm/colors" ]; then
  mkdir -p ~/.config/wezterm/colors
  cp ~/.local/share/omakase-blue/themes/selenized-dark/wezterm.toml ~/.config/wezterm/colors/selenized-dark.toml
fi
cd -
