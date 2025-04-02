# SPDX-FileCopyrightText: 2025 Ryan Cao <hello@ryanccn.dev>
#
# SPDX-License-Identifier: Apache-2.0

{
  perSystem =
    { pkgs, ... }:
    {
      packages = {
        helix-with-lsps = pkgs.callPackage ./helix-with-lsps.nix { };
        ibm-plex-compat = pkgs.callPackage ./ibm-plex-compat.nix { };
        ryan-mono-bin = pkgs.callPackage ./ryan-mono-bin.nix { };
      };
    };
}
