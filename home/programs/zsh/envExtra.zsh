# 1Password SSH
export SSH_AUTH_SOCK="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"

# Homebrew shell
eval "$(/opt/homebrew/bin/brew shellenv)"

# fnm shell env
eval "$(fnm env --use-on-cd)"

# deno
export PATH="$HOME/.deno/bin:$PATH"

# pnpm
export PNPM_HOME="${HOME}/Library/pnpm"

# direnv
export DIRENV_LOG_FORMAT=""

# docker
export PATH="$HOME/.docker/bin:$PATH"

# local bin
export PATH="$HOME/.local/bin:$PATH"

# nish
export PATH="$HOME/dev/nish/bin:$PATH"
