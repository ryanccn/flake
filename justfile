switch:
  darwin-rebuild switch --flake . --show-trace
delete-old:
  sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations old
gc:
  nix store gc
