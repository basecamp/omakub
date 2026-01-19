# ============================================
# OMAKUB ZSH COMPLETIONS
# ============================================

autoload -Uz compinit && compinit

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Menu selection
zstyle ':completion:*' menu select

# Colored completions
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Group completions
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
zstyle ':completion:*:warnings' format '%F{red}-- no matches --%f'

# Cache completions for faster loading
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
