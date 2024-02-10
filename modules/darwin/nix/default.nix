{
  pkgs,
  inputs,
  config,
  ...
}: {
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
    auto-optimise-store = true;
    extra-platforms = ["x86_64-darwin" "aarch64-darwin"];

    build-users-group = "nixbld";
    trusted-users = ["ryanccn"];
    sandbox = true;

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
    ];

    config.allowUnfree = true;
    hostPlatform = "aarch64-darwin";
  };
}
