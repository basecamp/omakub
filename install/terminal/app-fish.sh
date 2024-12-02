# Layer fish so we don't deal with $PATH issues for wezterm
if ! which fish > /dev/null; then
  rpm-ostree install fish
fi
