# ls/exa/eza
set -x LS_COLORS (vivid generate catppuccin-frappe)

# 1Password SSH
set -x SSH_AUTH_SOCK "$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"

# Homebrew
/opt/homebrew/bin/brew shellenv | source

# fnm shell env
fnm env --use-on-cd | source

# cargo
fish_add_path -P "$CARGO_HOME/bin"
# go
fish_add_path -P "$GOPATH/bin"
# deno
fish_add_path -P "$HOME/.deno/bin"

# pnpm
set -x PNPM_HOME "$HOME/Library/pnpm"
fish_add_path -P "$PNPM_HOME"

# local bin
fish_add_path -P "$HOME/.local/bin"

function expose_app_to_path
    set -f app $argv[1]

    if test -d ~/"Applications/$app.app"
        fish_add_path -P ~/"Applications/$app.app/Contents/MacOS"
    end
    if test -d "/Applications/$app.app"
        fish_add_path -P "/Applications/$app.app/Contents/MacOS"
    end
end

expose_app_to_path Ghostty
expose_app_to_path WezTerm

# suppress greeting
set fish_greeting
