# Install fzf with key-bindings ensured
sudo apt install -y fzf

if [[ ! -f /usr/share/doc/fzf/examples/key-bindings.bash ]]; then
  sudo curl https://raw.githubusercontent.com/junegunn/fzf/master/shell/key-bindings.bash -o /usr/share/doc/fzf/examples/key-bindings.bash
fi
