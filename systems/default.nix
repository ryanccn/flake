# SPDX-FileCopyrightText: 2025 Ryan Cao <hello@ryanccn.dev>
#
# SPDX-License-Identifier: Apache-2.0

{
  inputs,
  withSystem,
  ...
}:
let
  specialArgsModule = (
    { pkgs, ... }:
    {
      _module.args = {
        inputs' = withSystem pkgs.stdenvNoCC.hostPlatform.system (builtins.getAttr "inputs'");
      };
    }
  );
in
{
  flake.darwinConfigurations = {
    caladan = inputs.nix-darwin.lib.darwinSystem {
      modules = [
        specialArgsModule
        ./caladan
      ];

      specialArgs = { inherit inputs; };
    };
  };
}
