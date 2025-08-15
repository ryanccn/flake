# SPDX-FileCopyrightText: 2025 Ryan Cao <hello@ryanccn.dev>
#
# SPDX-License-Identifier: Apache-2.0

{
  pkgs,
  ...
}:
{
  nix.package = pkgs.nixVersions.latest;

  nix.registry = {
    n.to = {
      type = "indirect";
      id = "nixpkgs";
    };
  };

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];

    extra-platforms = [
      "aarch64-darwin"
      "x86_64-darwin"
    ];

    # Included in default config
    # build-users-group = "nixbld";

    trusted-users = [ "ryan" ];
    sandbox = true;
    use-xdg-base-directories = true;

    extra-substituters = [ ];
    extra-trusted-public-keys = [ ];
  };

  environment.profiles = [
    "\${XDG_STATE_HOME}/nix/profile"
    "$HOME/.local/state/nix/profile"
  ];

  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = "aarch64-darwin";
  };

  environment.variables = {
    NIX_INSTALLER_DIAGNOSTIC_ENDPOINT = "";
  };
}
