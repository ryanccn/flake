if status is-interactive
    # starship
    starship init fish | source
    # zoxide
    zoxide init fish | source
    # direnv
    direnv hook fish | source

    set -x FZF_DEFAULT_OPTS " \
--color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
--color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
--color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284"
end
