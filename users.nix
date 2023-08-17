{inputs, ...}: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = {
      ctpModule = inputs.catppuccin.homeManagerModules.catppuccin;
      discord-applemusic-rich-presence = inputs.discord-applemusic-rich-presence.homeManagerModules.default;
    };

    users.ryanccn = import ./home.nix;
  };

  users.users.ryanccn = {
    home = "/Users/ryanccn";
  };
}
