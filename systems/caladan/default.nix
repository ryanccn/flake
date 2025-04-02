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

  security.pam.services.sudo_local.touchIdAuth = true;

  programs.bash.enable = true;
  programs.zsh.enable = true;
  programs.fish.enable = true;

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

  system.stateVersion = 6;
}
