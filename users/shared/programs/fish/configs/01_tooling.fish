# SPDX-FileCopyrightText: 2025 Ryan Cao <hello@ryanccn.dev>
#
# SPDX-License-Identifier: Apache-2.0

if test -d "$HOME/Library/Group Containers/2BUA8C4S2C.com.1password"
    set -gx SSH_AUTH_SOCK "$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
end

if command -q fnm
    fnm env --use-on-cd | source
end

fish_add_path -P "$CARGO_HOME/bin"
fish_add_path -P "$GOPATH/bin"
fish_add_path -P "$HOME/.local/bin"

set fish_greeting
