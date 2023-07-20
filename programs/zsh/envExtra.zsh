# 1Password SSH
export SSH_AUTH_SOCK="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"

# Homebrew shell
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_CASK_OPTS=--require-sha
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_NO_EMOJI=1
eval "$(/opt/homebrew/bin/brew shellenv)"

# fnm shell env
eval "$(fnm env --use-on-cd)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv > /dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export PIPX_DEFAULT_PYTHON="$HOME/.pyenv/shims/python"

# cargo
source "$HOME/.cargo/env"

# deno
export PATH="$HOME/.deno/bin:$PATH"

# pnpm
export PNPM_HOME="''${HOME}/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# disable telemetry
export NEXT_TELEMETRY_DISABLED=1    # Next.js
export CHECKPOINT_DISABLE=1         # Prisma
export DISABLE_TELEMETRY=YES        # diffusers

# go
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH"

# direnv
export DIRENV_LOG_FORMAT=""

# docker
export PATH="$HOME/.docker/bin:$PATH"

# local bin
export PATH="$HOME/.local/bin:$PATH"

# nish
export PATH="$HOME/dev/nish/bin:$PATH"
