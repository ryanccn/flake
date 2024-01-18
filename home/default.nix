{
  config,
  inputs,
  ...
}: {
  programs.home-manager.enable = true;

  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin
    inputs.am.homeManagerModules.default

    ./variables.nix
    ./fonts.nix

    ./apps/vscode.nix

    ./programs/zsh.nix
    ./programs/fish.nix
    ./programs/starship.nix
    ./programs/fzf.nix
    ./programs/zoxide.nix
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

  services.am-discord-rich-presence = {
    enable = false;
    logFile = "${config.home.homeDirectory}/Library/Logs/am-discord-rich-presence.log";
  };

  catppuccin.flavour = "frappe";

  home.stateVersion = "23.05";
}
