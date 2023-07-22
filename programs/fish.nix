{lib, ...}: let
  aliases = import ./aliases.nix;
  shellAbbrs = builtins.mapAttrs (_: a: a.command) (lib.filterAttrs (_: b: !(b.fishAlias or false)) aliases);
  shellAliases = builtins.mapAttrs (_: a: a.command) (lib.filterAttrs (_: b: builtins.hasAttr "fishAlias" b && b.fishAlias) aliases);
in {
  programs.fish = {
    enable = true;
    inherit shellAbbrs shellAliases;
    functions = {
      take = ''
        set dir $argv[1]
        if [ -z "$dir" ]
            echo "QHAR?!?!?!"
            return 1
        end
        mkdir "$dir"
        cd "$dir"
      '';
    };
  };

  home.file.".config/fish/conf.d" = {
    source = ./fish/conf.d;
    recursive = true;
  };
}
