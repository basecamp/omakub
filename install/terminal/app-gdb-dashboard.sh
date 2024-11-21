if [ ! -d "$HOME/.gdbinit" ]; then
  curl --proto '=https' --tlsv1.2 -sSLf https://raw.githubusercontent.com/cyrus-and/gdb-dashboard/master/.gdbinit -o ~/.gdbinit
fi
