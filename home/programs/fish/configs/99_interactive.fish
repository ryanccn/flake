if status is-interactive
    nix-your-shell fish | source

    set -l iterm2_shell_integration "$HOME/.iterm2_shell_integration.fish"

    string match -q "$TERM_PROGRAM" "iTerm.app"
    and test -f "$iterm2_shell_integration"
    and source "$iterm2_shell_integration"

    set -l ghostty_shell_integration "/Applications/Ghostty.app/Contents/Resources/ghostty/shell-integration/fish/vendor_conf.d/ghostty-shell-integration.fish"

    string match -q "$TERM_PROGRAM" ghostty
    and test -f "$ghostty_shell_integration"
    and source "$ghostty_shell_integration"
end
