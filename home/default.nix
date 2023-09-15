{
  config,
  inputs,
  ...
}: {
  home.stateVersion = "23.05";

  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin
    inputs.am.homeManagerModules.default

    ./variables.nix
    ./fonts.nix

    ./apps/vscode.nix

    ./programs/zsh.nix
    ./programs/fish.nix
    ./programs/starship.nix

    ./programs/git.nix
    ./programs/bat.nix
    ./programs/helix.nix
    ./programs/go.nix
    ./programs/eza.nix
    ./programs/rust.nix
    ./programs/glamour.nix
  ];

  programs.home-manager.enable = true;

  services.am-discord-rich-presence = {
    enable = true;
    logFile = "${config.home.homeDirectory}/Library/Logs/am-discord-rich-presence.log";
  };

  catppuccin.flavour = "frappe";
}
