# SPDX-FileCopyrightText: 2025 Ryan Cao <hello@ryanccn.dev>
#
# SPDX-License-Identifier: Apache-2.0

switch *args:
  morlana switch -- {{args}}

build *args:
  morlana build -- {{args}}

wipe-history:
  sudo -H nix profile wipe-history --profile "/nix/var/nix/profiles/default"
  sudo -H nix profile wipe-history --profile "/nix/var/nix/profiles/system"
  sudo -H nix profile wipe-history --profile "/nix/var/nix/profiles/per-user/root/profile"
  nix profile wipe-history --profile "${XDG_STATE_HOME-$HOME/.local/state}/nix/profiles/profile"
  nix profile wipe-history --profile "${XDG_STATE_HOME-$HOME/.local/state}/nix/profiles/home-manager"

update:
  nix flake update

gc:
  nix store gc
