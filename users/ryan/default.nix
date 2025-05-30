# SPDX-FileCopyrightText: 2025 Ryan Cao <hello@ryanccn.dev>
#
# SPDX-License-Identifier: Apache-2.0

{
  inputs,
  ...
}:
{
  programs.home-manager.enable = true;

  imports = [
    inputs.catppuccin.homeModules.catppuccin
    inputs.nix-index-database.hmModules.nix-index

    ./variables.nix
    ./fonts.nix
    ./catppuccin.nix

    ./apps/vscode.nix
    ./apps/ghostty.nix

    ./programs/fish.nix
    ./programs/zsh.nix
    ./programs/starship.nix
    ./programs/direnv.nix

    ./programs/git.nix
    ./programs/bat.nix
    ./programs/helix.nix
    ./programs/go.nix
    ./programs/eza.nix
    ./programs/rust.nix
    ./programs/tealdeer.nix
  ];

  programs.bash.enable = true;
  xdg.enable = true;

  programs.nix-index.enable = true;
  programs.nix-index-database.comma.enable = true;

  home.stateVersion = "24.11";
}
