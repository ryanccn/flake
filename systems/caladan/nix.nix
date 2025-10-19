# SPDX-FileCopyrightText: 2025 Ryan Cao <hello@ryanccn.dev>
#
# SPDX-License-Identifier: Apache-2.0

{ pkgs, lib, ... }:
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
    hostPlatform = "aarch64-darwin";
    # config.allowUnfree = true;
    config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [ ];
  };

  environment.variables = {
    NIX_INSTALLER_DIAGNOSTIC_ENDPOINT = "";
  };
}
