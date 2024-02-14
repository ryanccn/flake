# ls/exa/eza
set -x LS_COLORS (vivid generate catppuccin-frappe)

# 1Password SSH
set -x SSH_AUTH_SOCK "$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"

# Homebrew
/opt/homebrew/bin/brew shellenv | source

# Nix
fish_add_path -Pm /etc/profiles/per-user/$USER/bin /run/current-system/sw/bin

# fnm shell env
fnm env --use-on-cd | source

# cargo
fish_add_path -P "$HOME/.cargo/bin"
# deno
fish_add_path -P "$HOME/.deno/bin"

# pnpm
set -x PNPM_HOME "$HOME/Library/pnpm"

# docker
fish_add_path -P "$HOME/.docker/bin"
# local bin
fish_add_path -P "$HOME/.local/bin"

# suppress greeting
set fish_greeting
