{
  self,
  pkgs,
  inputs,
  config,
  ...
}: {
  services.nix-daemon.enable = true;
  nix.package = pkgs.nixVersions.latest;

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
    use-xdg-base-directories = true;

    extra-substituters = [
      "https://cache.lix.systems"
    ];

    extra-trusted-public-keys = [
      "cache.lix.systems:aBnZUw8zA7H35Cz2RyKFVs3H4PlGTLawyY5KRbvJR8o="
    ];

    nix-path = config.nix.nixPath;
  };

  nixpkgs = {
    overlays = [
      inputs.rust-overlay.overlays.default
      inputs.am.overlays.default
      inputs.nish.overlays.default
      inputs.nrr.overlays.default
      inputs.choirpack.overlays.default
      inputs.nyoom.overlays.default
      self.overlays.ryan-mono-bin
      self.overlays.ibm-plex
    ];

    config.allowUnfree = true;
    hostPlatform = "aarch64-darwin";
  };
}
