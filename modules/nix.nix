{
  pkgs,
  inputs,
  config,
  ...
}: let
  flakeOverlays = import ../overlays;
in {
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  nix.registry = {
    n.flake = inputs.nixpkgs;
  };

  nix.nixPath = [
    "nixpkgs=${inputs.nixpkgs.outPath}"
  ];

  nix.settings = {
    experimental-features = "nix-command flakes";
    build-users-group = "nixbld";
    trusted-users = ["ryanccn"];
    auto-optimise-store = true;
    extra-platforms = ["x86_64-darwin" "aarch64-darwin"];

    extra-substituters = [
      "https://nix-community.cachix.org"
      "https://crane.cachix.org"
      "https://cache.garnix.io"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "crane.cachix.org-1:8Scfpmn9w+hGdXH/Q9tTLiYAE/2dnJYRJP7kl80GuRk="
      "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
    ];

    nix-path = config.nix.nixPath;
  };

  nixpkgs = {
    overlays = [
      inputs.fenix.overlays.default
      inputs.am.overlays.default
      inputs.nish.overlays.default
      inputs.nrr.overlays.default
      inputs.choirpack.overlays.default
      inputs.nyoom.overlays.default
      inputs.fh.overlays.default
      flakeOverlays.ryan-mono-bin
      flakeOverlays.ibm-plex
    ];

    config.allowUnfree = true;
    hostPlatform = "aarch64-darwin";
  };
}
