# SPDX-FileCopyrightText: 2025 Ryan Cao <hello@ryanccn.dev>
#
# SPDX-License-Identifier: Apache-2.0

set -gx SSH_AUTH_SOCK "$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"

/opt/homebrew/bin/brew shellenv | source

fnm env --use-on-cd | source

fish_add_path -P "$CARGO_HOME/bin"
fish_add_path -P "$GOPATH/bin"
fish_add_path -P "$HOME/.deno/bin"
fish_add_path -P "$HOME/.orbstack/bin"
fish_add_path -P "$HOME/.local/bin"

function expose_app_to_path
    set -f app $argv[1]

    if test -d "$HOME/Applications/$app.app"
        fish_add_path -P "$HOME/Applications/$app.app/Contents/MacOS"
    end
    if test -d "/Applications/$app.app"
        fish_add_path -P "/Applications/$app.app/Contents/MacOS"
    end
end

expose_app_to_path Ghostty
expose_app_to_path WezTerm

set fish_greeting
