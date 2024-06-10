force_color_prompt=yes
color_prompt=yes

# Colors
RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
YELLOW="$(tput setaf 3)"
BLUE="$(tput setaf 4)"
MAGENTA="$(tput setaf 5)"
CYAN="$(tput setaf 6)"
WHITE="$(tput setaf 7)"
GRAY="$(tput setaf 8)"
BOLD="$(tput bold)"
UNDERLINE="$(tput sgr 0 1)"
INVERT="$(tput sgr 1 0)"
NOCOLOR="$(tput sgr0)"

# Symbols
PROMPT_SYMBOL="❯"

# If the last subprocess exited with an error, show red colored
PROMPT="\`if [ \$? = 0 ]; then echo \[\$BLUE\]; else echo \[\$RED\]; fi\`\$PROMPT_SYMBOL\[\$NOCOLOR\]"

# Support for Git
export GIT_PS1_SHOWDIRTYSTATE=1
PROMPT="\[\$YELLOW\]\$(__git_ps1)\[\$NOCOLOR\] $PROMPT"

# Include workspace
export PROMPT_DIRTRIM=2
PROMPT="\[\$CYAN\]\w\[\$NOCOLOR\]$PROMPT"

# Set PS1
PS1="$PROMPT "
PS1="\[\e]0;\u@\h\a\]$PS1"
