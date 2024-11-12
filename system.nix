{
  inputs,
  inputs',
  flake',
  self,
  ...
}:
{
  imports = [
    ./modules/nix.nix
    ./modules/packages.nix
    ./modules/homebrew.nix
  ];

  security.pam.enableSudoTouchIdAuth = true;

  environment.customIcons = {
    enable = true;
    icons = [
      {
        path = "/Applications/Notion.app";
        icon = ./icons/notion.icns;
      }
      {
        path = "/Applications/Obsidian.app";
        icon = ./icons/obsidian.icns;
      }
    ];
  };

  programs.bash.enable = true;
  programs.fish.enable = true;
  programs.zsh.enable = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = {
      inherit
        self
        flake'
        inputs
        inputs'
        ;
    };

    users.ryanccn = import ./home;
  };

  users.users.ryanccn = {
    home = "/Users/ryanccn";
  };

  system.stateVersion = 5;
}
