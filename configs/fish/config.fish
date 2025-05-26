# Environment Variables
set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'
set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -gx BAT_THEME "Solarized (dark)"
set -gx EDITOR hx
set -gx COLORTERM 24bit
set -gx GRAB_HOME ~/repos
set -gx OMAKASEBLUE_PATH "/home/$USER/.local/share/omakase-blue"

# clear fish greeting
set -g fish_greeting

# Path updates
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.poetry/bin
fish_add_path $OMAKASEBLUE_PATH/bin
fish_add_path /home/linuxbrew/.linuxbrew/bin
fish_add_path /home/linuxbrew/.linuxbrew/sbin

# Configurations
if status --is-interactive
    set -x GPG_TTY (tty)
    set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
    gpgconf --launch gpg-agent

    fzf --fish | source
    starship init fish | source
    zoxide init --cmd cd fish | source
    mise activate fish | source

    set -gx ATUIN_NOBIND true
    atuin init fish | source

    # bind to ctrl-r in normal and insert mode, add any other bindings you want here too
    bind \cr _atuin_search
    bind -M insert \cr _atuin_search

    bind \cE edit_command_buffer
end

# Aliases
function ea
    hx ~/.config/fish/config.fish
    source ~/.config/fish/config.fish && echo "aliases sourced --ok."
end

function sc-pin
    set -l serial (gpg-connect-agent 'scd serialno' /bye | awk '{printf "%s",$3}')
    gpg-connect-agent "scd checkpin $serial" /bye
end

alias vim="nvim"
alias vi="nvim"
alias cat="bat"
alias df="df -h"
alias rg="rg -S"
alias ping="gping"
alias bcp="rsync -avzuhP"

alias ls="eza"
alias ll="ls -l --group-directories-first"
alias la="ll -a"
alias tree="ls -T"
