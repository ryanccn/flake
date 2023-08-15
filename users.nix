{
  catppuccin,
  discord-applemusic-rich-presence,
  ...
}: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = {
      ctpModule = catppuccin.homeManagerModules.catppuccin;
      discord-applemusic-rich-presence = discord-applemusic-rich-presence.homeManagerModules.default;
    };
    users.ryanccn = import ./home.nix;
  };

  users.users.ryanccn = {
    home = "/Users/ryanccn";
  };
}
