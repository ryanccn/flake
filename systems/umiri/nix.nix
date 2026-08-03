# SPDX-FileCopyrightText: 2026 Ryan Cao <hello@ryanccn.dev>
#
# SPDX-License-Identifier: Apache-2.0

{
  pkgs,
  lib,
  config,
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

    sandbox = true;
    use-xdg-base-directories = true;

    extra-substituters = [ ];
    extra-trusted-public-keys = [ ];
  };

  nixpkgs = {
    config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [ ];

    overlays = [
      (_: prev: {
        comma = prev.comma.override { nix = config.nix.package; };
      })
    ];
  };
}
