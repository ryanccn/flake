{
  pkgs,
  config,
  agenixModule,
  ctpModule,
  caarlosModule,
  ...
}: {
  home.stateVersion = "23.05";
  imports = [
    agenixModule
    ctpModule
    caarlosModule
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

  services = {
    discord-applemusic-rich-presence = {
      enable = true;
      package = pkgs.discord-applemusic-rich-presence;
    };
  };

  catppuccin.flavour = "frappe";

  age.secrets."attic.toml" = {
    file = ./secrets/attic.toml.age;
    path = "${config.home.homeDirectory}/.config/attic/config.toml";
  };
}
