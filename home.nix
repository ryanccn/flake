{
  pkgs,
  config,
  agenixModule,
  ctpModule,
  discord-applemusic-rich-presence,
  ...
}: {
  home.stateVersion = "23.05";
  imports = [
    agenixModule
    ctpModule
    discord-applemusic-rich-presence
    ./programs/zsh.nix
    ./programs/fish.nix
    ./programs/starship.nix
    ./programs/git.nix
    ./programs/bat.nix
    ./programs/helix.nix
    ./programs/go.nix
    ./programs/exa.nix
  ];

  programs.home-manager.enable = true;
  home.packages = with pkgs; [
    ryan-mono-bin
    ryan-term-bin
  ];

  services.discord-applemusic-rich-presence = {
    enable = true;
  };

  catppuccin.flavour = "frappe";

  age.secrets."attic.toml" = {
    file = ./secrets/attic.toml.age;
    path = "${config.home.homeDirectory}/.config/attic/config.toml";
  };
}
