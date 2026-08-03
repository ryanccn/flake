# SPDX-FileCopyrightText: 2025 Ryan Cao <hello@ryanccn.dev>
#
# SPDX-License-Identifier: Apache-2.0

{
  inputs,
  withSystem,
  lib,
  ...
}:
let
  specialArgsModule =
    { pkgs, ... }:
    {
      _module.args = {
        inputs' = withSystem pkgs.stdenvNoCC.hostPlatform.system (builtins.getAttr "inputs'");
      };
    };
in
{
  flake.nixosConfigurations = {
    umiri = lib.nixosSystem {
      modules = [
        specialArgsModule
        ./umiri
      ];

      specialArgs = { inherit inputs; };
    };
  };

  flake.darwinConfigurations = {
    tomori = inputs.nix-darwin.lib.darwinSystem {
      modules = [
        specialArgsModule
        ./tomori
      ];

      specialArgs = { inherit inputs; };
    };
  };
}
