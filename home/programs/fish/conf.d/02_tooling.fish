# 1Password SSH
set -x SSH_AUTH_SOCK "$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"

# Homebrew shell
/opt/homebrew/bin/brew shellenv | source

# fnm shell env
fnm env --use-on-cd | source

# cargo
fish_add_path "$HOME/.cargo/bin"
# deno
fish_add_path "$HOME/.deno/bin"

# pnpm
set -x PNPM_HOME "$HOME/Library/pnpm"

# direnv
set -x DIRENV_LOG_FORMAT ""

# docker
fish_add_path "$HOME/.docker/bin"
# local bin
fish_add_path "$HOME/.local/bin"

# fish
set fish_greeting
