{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./modules/nix.nix
    ./modules/packages.nix
    ./modules/homebrew.nix
  ];

  system.activationScripts.extraActivation = {
    text = ''
      set -eo pipefail
      HOME="/var/root" ${pkgs.lib.getExe' pkgs.nvd "nvd"} --nix-bin-dir=${pkgs.nix}/bin diff /run/current-system "$systemConfig"
    '';
  };

  security.pam.enableSudoTouchIdAuth = true;

  environment.customIcons = {
    enable = true;
    icons = [
      {
        path = "/Applications/Notion.app";
        icon = ./icons/notion.icns;
      }
    ];
  };

  programs.fish.enable = true;
  programs.zsh.enable = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = {
      ctpModule = inputs.catppuccin.homeManagerModules.catppuccin;
      discordAppleMusicModule = inputs.discord-applemusic-rich-presence.homeManagerModules.default;
    };

    users.ryanccn = import ./home;
  };

  users.users.ryanccn = {
    home = "/Users/ryanccn";
  };

  system.stateVersion = 4;
}
