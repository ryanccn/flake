# 1Password SSH
export SSH_AUTH_SOCK="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# fnm shell env
eval "$(fnm env --use-on-cd)"

# cargo
export PATH="$CARGO_HOME/bin:$PATH"
# go
export PATH="$GOPATH/bin:$PATH"

# deno
export PATH="$HOME/.deno/bin:$PATH"

# pnpm
export PNPM_HOME="${HOME}/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# local bin
export PATH="$HOME/.local/bin:$PATH"
