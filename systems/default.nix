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
  commonModule =
    { pkgs, ... }:
    {
      _module.args = {
        inputs' = withSystem pkgs.stdenvNoCC.hostPlatform.system (builtins.getAttr "inputs'");
      };

      system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;
    };
in
{
  flake.nixosConfigurations = {
    umiri = lib.nixosSystem {
      modules = [
        commonModule
        ./umiri
      ];

      specialArgs = { inherit inputs; };
    };
  };

  flake.darwinConfigurations = {
    tomori = inputs.nix-darwin.lib.darwinSystem {
      modules = [
        commonModule
        ./tomori
      ];

      specialArgs = { inherit inputs; };
    };
  };
}
