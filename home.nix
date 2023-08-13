{
  pkgs,
  config,
  ctpModule,
  discord-applemusic-rich-presence,
  ...
}: let
  inherit (pkgs) lib stdenv;
in {
  home.stateVersion = "23.05";
  imports =
    [
      ctpModule
      ./programs/zsh.nix
      ./programs/fish.nix
      ./programs/starship.nix
      ./programs/git.nix
      ./programs/bat.nix
      ./programs/helix.nix
      ./programs/go.nix
      ./programs/exa.nix
    ]
    ++ lib.optional stdenv.isDarwin [
      discord-applemusic-rich-presence.overlays.default
    ];

  programs.home-manager.enable = true;
  home.packages = with pkgs; [
    ryan-mono-bin
    ryan-term-bin
  ];

  services.discord-applemusic-rich-presence = lib.optionalAttrs stdenv.isDarwin {
    enable = true;
    logFile = "${config.home.homeDirectory}/Library/Logs/discord-applemusic-rich-presence.log";
  };

  catppuccin.flavour = "frappe";
}
