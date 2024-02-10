{...}: {
  security.pam.enableSudoTouchIdAuth = true;

  environment.customIcons = {
    enable = true;
    icons = [
      {
        path = "/Applications/Notion.app";
        icon = ../../icons/notion.icns;
      }
      {
        path = "/Applications/Things.app";
        icon = ../../icons/things.icns;
      }
      {
        path = "/Applications/Obsidian.app";
        icon = ../../icons/obsidian.icns;
      }
    ];
  };

  programs.fish.enable = true;
  programs.zsh.enable = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  system.stateVersion = 4;
}
