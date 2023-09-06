{
  pkgs,
  inputs,
  ...
}: let
  flakeOverlays = import ../overlays;
in {
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  nix.settings = {
    experimental-features = "nix-command flakes";
    build-users-group = "nixbld";
    trusted-users = ["ryanccn"];
    auto-optimise-store = true;
    extra-platforms = ["x86_64-darwin" "aarch64-darwin"];

    extra-substituters = [
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  nixpkgs = {
    overlays = [
      inputs.attic.overlays.default
      inputs.discord-applemusic-rich-presence.overlays.default
      inputs.nyoom.overlays.default
      inputs.am.overlays.default
      flakeOverlays.ryan-mono-bin
      flakeOverlays.ibm-plex
    ];

    config.allowUnfree = true;
    hostPlatform = "aarch64-darwin";
  };
}
