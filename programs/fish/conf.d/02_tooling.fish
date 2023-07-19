# 1Password SSH
set -x SSH_AUTH_SOCK "$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"

# Homebrew shell
set -x HOMEBREW_NO_ANALYTICS 1
set -x HOMEBREW_CASK_OPTS "--require-sha"
set -x HOMEBREW_NO_INSECURE_REDIRECT 1
set -x HOMEBREW_NO_EMOJI 1
/opt/homebrew/bin/brew shellenv | source

# ccache
fish_add_path "$(brew --prefix ccache)/libexec"

# fnm shell env
fnm env --use-on-cd | source

# pyenv
set -x PYENV_ROOT "$HOME/.pyenv"
set -x PATH "$PYENV_ROOT/bin:$PATH"
pyenv init - | source
set -x PIPX_DEFAULT_PYTHON "$HOME/.pyenv/shims/python"

# cargo
fish_add_path "$HOME/.cargo/bin"
# deno
fish_add_path "$HOME/.deno/bin"

# pnpm
set -x PNPM_HOME "$HOME/Library/pnpm"

# disable telemetry
set -x NEXT_TELEMETRY_DISABLED 1    # Next.js
set -x CHECKPOINT_DISABLE 1         # Prisma
set -x DISABLE_TELEMETRY YES        # diffusers

# go
set -x GOPATH "$HOME/.go"
fish_add_path "$GOPATH/bin"

# direnv
set -x DIRENV_LOG_FORMAT ""

# docker
fish_add_path "$HOME/.docker/bin"
# local bin
fish_add_path "$HOME/.local/bin"
# nish
fish_add_path "$HOME/dev/nish/bin"

# fish
set fish_greeting
