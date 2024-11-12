{ config, inputs, ... }:
{
  programs.home-manager.enable = true;

  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin
    inputs.am.homeManagerModules.default

    ./variables.nix
    ./fonts.nix

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
    ./programs/glamour.nix
    ./programs/tealdeer.nix
  ];

  programs.bash.enable = true;
  xdg.enable = true;

  services.am-discord-rich-presence = {
    enable = false;
    logFile = "${config.home.homeDirectory}/Library/Logs/am-discord-rich-presence.log";
  };

  catppuccin.flavor = "frappe";
  catppuccin.accent = "sapphire";

  home.stateVersion = "24.11";
}
