{
  pkgs,
  inputs,
  config,
  ...
}:
{
  nix.package = pkgs.nixVersions.latest;
  services.nix-daemon.enable = true;

  nix.registry = {
    n.flake = inputs.nixpkgs;
  };

  nix.nixPath = [
    "nixpkgs=${inputs.nixpkgs.outPath}"
  ];

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];

    # https://github.com/NixOS/nix/issues/7273
    auto-optimise-store = !pkgs.stdenv.isDarwin;

    extra-platforms = [
      "x86_64-darwin"
      "aarch64-darwin"
    ];

    build-users-group = "nixbld";
    trusted-users = [ "ryanccn" ];
    sandbox = true;
    use-xdg-base-directories = true;

    extra-substituters = [ ];
    extra-trusted-public-keys = [ ];

    nix-path = config.nix.nixPath;
  };

  environment.profiles = [
    "\${XDG_STATE_HOME}/nix/profile"
    "$HOME/.local/state/nix/profile"
  ];

  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = "aarch64-darwin";
  };
}
