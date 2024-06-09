force_color_prompt=yes
color_prompt=yes

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
PROMPT_CLEAN_SYMBOL="☀ "
PROMPT_DIRTY_SYMBOL="☂ "
PROMPT_VENV_SYMBOL="☁ "

case $(id -u) in
	0) USER_COLOR="$RED" ;;
	*) USER_COLOR="$GREEN" ;;
esac

PROMPT_LINE="\`if [ \$? = 0 ]; then echo \[\$CYAN\]; else echo \[\$RED\]; fi\`\$PROMPT_SYMBOL\[\$NOCOLOR\] "

PS1="\[\e]0;\w\a\]$PROMPT_LINE"
PS1="\[\e]0;\w\a\]$PS1"
