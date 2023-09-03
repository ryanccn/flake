{
  config,
  ctpModule,
  discord-applemusic-rich-presence,
  ...
}: {
  home.stateVersion = "23.05";

  imports = [
    ctpModule
    discord-applemusic-rich-presence

    ./programs/variables.nix
    ./programs/fonts.nix

    ./programs/vscode.nix

    ./programs/zsh.nix
    ./programs/fish.nix
    ./programs/starship.nix

    ./programs/git.nix
    ./programs/bat.nix
    ./programs/helix.nix
    ./programs/go.nix
    ./programs/exa.nix
    ./programs/rust.nix
  ];

  programs.home-manager.enable = true;

  services.discord-applemusic-rich-presence = {
    enable = true;
    logFile = "${config.home.homeDirectory}/Library/Logs/discord-applemusic-rich-presence.log";
  };

  catppuccin.flavour = "frappe";
}
