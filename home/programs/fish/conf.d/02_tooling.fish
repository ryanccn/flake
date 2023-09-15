# 1Password SSH
set -x SSH_AUTH_SOCK "$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"

# Homebrew shell
/opt/homebrew/bin/brew shellenv | source

# fnm shell env
fnm env --use-on-cd | source

# cargo
set -p PATH "$HOME/.cargo/bin"
# deno
set -p PATH "$HOME/.deno/bin"

# pnpm
set -x PNPM_HOME "$HOME/Library/pnpm"

# direnv
set -x DIRENV_LOG_FORMAT ""

# docker
set -p PATH "$HOME/.docker/bin"
# local bin
set -p PATH "$HOME/.local/bin"

# fish
set fish_greeting
