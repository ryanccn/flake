switch:
  morlana switch

build:
  morlana build

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
