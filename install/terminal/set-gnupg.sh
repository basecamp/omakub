# Only attempt to set configuration if none is present
mkdir -p ~/.gnupg
if [ ! -f "$HOME/.gnupg/gpg.config" ]; then
  cp ~/.local/share/omakase-blue/configs/gnupg/gpg.conf ~/.gnupg/gpg.conf
fi
if [ ! -f "$HOME/.gnupg/gpg-agent.config" ]; then
  cp ~/.local/share/omakase-blue/configs/gnupg/gpg-agent.conf ~/.gnupg/gpg-agent.conf
fi
