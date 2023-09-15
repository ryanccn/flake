# ls
set -x LS_COLORS "$(vivid generate catppuccin-frappe)"

# nix path patches
set -p PATH /run/current-system/sw/bin
set -p PATH "/etc/profiles/per-user/$USER/bin"
