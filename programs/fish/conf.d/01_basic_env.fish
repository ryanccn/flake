# basic environment variables
set -x LANG en_US.UTF-8
set -x EDITOR hx
set -x PAGER less
set -x LESS -R
set -x LS_COLORS "$(vivid generate catppuccin-frappe)"

# nix path patches
fish_add_path /run/current-system/sw/bin
fish_add_path "/etc/profiles/per-user/$USER/bin"
