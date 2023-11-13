switch:
  darwin-rebuild switch --flake . --verbose --show-trace
delete-old:
  sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations old && home-manager expire-generations now 
gc:
  nix store gc
