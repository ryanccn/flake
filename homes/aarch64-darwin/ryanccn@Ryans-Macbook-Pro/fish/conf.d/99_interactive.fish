if status is-interactive
    # nix-your-shell
    nix-your-shell fish | source

    if test -e "$HOME/.iterm2_shell_integration.fish"
        source "$HOME/.iterm2_shell_integration.fish"
    end
end
