{
  config,
  ctpModule,
  discordAppleMusicModule,
  ...
}: {
  home.stateVersion = "23.05";

  imports = [
    ctpModule
    discordAppleMusicModule

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
  ];

  programs.home-manager.enable = true;

  services.discord-applemusic-rich-presence = {
    enable = true;
    logFile = "${config.home.homeDirectory}/Library/Logs/discord-applemusic-rich-presence.log";
  };

  catppuccin.flavour = "frappe";
}
