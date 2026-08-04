# SPDX-FileCopyrightText: 2026 Ryan Cao <hello@ryanccn.dev>
#
# SPDX-License-Identifier: Apache-2.0

{
  pkgs,
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
    auto-optimise-store = true;

    extra-substituters = [ ];
    extra-trusted-public-keys = [ ];
  };

  nix.gc = {
    automatic = true;
  };

  nixpkgs.overlays = [
    (_: prev: {
      comma = prev.comma.override { nix = config.nix.package; };
    })
  ];
}
