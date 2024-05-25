# Setup history
shopt -s histappend
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

force_color_prompt=yes
color_prompt=yes

PS1=$'\uf0a9 '
PS1="\[\e]0;\w\a\]$PS1"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

export PATH="./bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin"
export EDITOR="nvim"
set +h

alias ls='eza -lh --group-directories-first --icons'
alias lt='eza --tree --level=2 --long --icons --git'
alias ff="fzf --preview 'batcat --style=numbers --color=always {}'"
alias spfy='spotify --force-device-scale-factor=1.5'
alias r='./bin/rails'
alias n='nvim'
alias g='git'
alias d='docker'
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gcad='git commit -a --amend'
alias load-dconf='cat ~/.config/gnome-settings.ini | dconf load /'

export KAMAL_REGISTRY_PASSWORD="dckr_pat_1-VLgNpkPxENCjLuZSS6AM-zfD4"
export HAYSTACK_GLOBAL_DATABASE_VERSION=8

eval "$(/usr/bin/rbenv init - bash)"
eval "$(nodenv init -)"
eval "$(zoxide init bash)"

export PATH=$PATH:/home/dhh/.spicetify
