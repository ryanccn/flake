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

# deno
export PATH="$HOME/.deno/bin:$PATH"

# pnpm
export PNPM_HOME="${HOME}/Library/pnpm"

# disable telemetry
export NEXT_TELEMETRY_DISABLED=1    # Next.js
export CHECKPOINT_DISABLE=1         # Prisma
export DISABLE_TELEMETRY=YES        # diffusers

# direnv
export DIRENV_LOG_FORMAT=""

# docker
export PATH="$HOME/.docker/bin:$PATH"

# local bin
export PATH="$HOME/.local/bin:$PATH"

# nish
export PATH="$HOME/dev/nish/bin:$PATH"
