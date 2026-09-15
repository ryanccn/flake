# SPDX-FileCopyrightText: 2025 Ryan Cao <hello@ryanccn.dev>
#
# SPDX-License-Identifier: Apache-2.0

{
  inputs,
  inputs',
  ...
}:
{
  imports = [
    inputs.home-manager.darwinModules.home-manager

    ./nix.nix
    ./packages.nix
    ./homebrew.nix
  ];

  programs.fish.enable = true;

  security.pam.services.sudo_local = {
    enable = true;
    touchIdAuth = true;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = {
      inherit
        inputs
        inputs'
        ;
    };

    users.ryan = import "${inputs.self}/users/ryan";
  };

  users.users.ryan = {
    home = "/Users/ryan";
  };

  system.primaryUser = "ryan";
  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;
  system.stateVersion = 6;
}
