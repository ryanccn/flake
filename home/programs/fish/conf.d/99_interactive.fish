if status is-interactive
    # nix-your-shell
    nix-your-shell fish | source

    string match -q "$TERM_PROGRAM" "iTerm.app"
    and source "$HOME/.iterm2_shell_integration.fish"

    string match -q "$TERM_PROGRAM" ghostty
    and source "/Applications/Ghostty.app/Contents/Resources/ghostty/shell-integration/fish/vendor_conf.d/ghostty-shell-integration.fish"
end
