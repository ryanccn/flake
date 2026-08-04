# SPDX-FileCopyrightText: 2025 Ryan Cao <hello@ryanccn.dev>
#
# SPDX-License-Identifier: Apache-2.0

{ inputs, ... }:
{
  programs.home-manager.enable = true;

  imports = [
    inputs.catppuccin.homeModules.catppuccin
    inputs.nix-index-database.homeModules.nix-index

    ../shared/variables.nix
    ../shared/catppuccin.nix

    ../shared/apps/vscode.nix
    ../shared/apps/ghostty.nix

    ../shared/programs/fish.nix
    ../shared/programs/zsh.nix
    ../shared/programs/starship.nix
    ../shared/programs/direnv.nix

    ../shared/programs/git.nix
    ../shared/programs/bat.nix
    ../shared/programs/helix.nix
    ../shared/programs/go.nix
    ../shared/programs/eza.nix
    ../shared/programs/rust.nix
    ../shared/programs/tealdeer.nix

    ./fonts.nix
  ];

  programs.bash.enable = true;
  xdg.enable = true;

  programs.nix-index.enable = true;
  programs.nix-index-database.comma.enable = true;

  home.stateVersion = "24.11";
}
