# ============================================
# OMAKUB ZSH COMPLETIONS & KEY BINDINGS
# ============================================

autoload -Uz compinit && compinit

# ------------------------------------------
# Key Bindings (equivalent to bash inputrc)
# ------------------------------------------

# Arrow keys search history matching current input (like bash inputrc)
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search    # Up arrow
bindkey "^[[B" down-line-or-beginning-search  # Down arrow

# ------------------------------------------
# Completion Settings
# ------------------------------------------

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
