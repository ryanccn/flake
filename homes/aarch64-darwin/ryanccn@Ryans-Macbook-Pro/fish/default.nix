{lib, ...}: let
  aliases = import ../aliases;
  shellAbbrs = builtins.mapAttrs (_: a: a.command) (lib.filterAttrs (_: b: !(b.fishAlias or false)) aliases);
  shellAliases = builtins.mapAttrs (_: a: a.command) (lib.filterAttrs (_: b: builtins.hasAttr "fishAlias" b && b.fishAlias) aliases);
in {
  programs.fish = {
    enable = true;
    inherit shellAbbrs shellAliases;

    functions = {
      take = ''
        set dir $argv[1]
        if test -z "$dir"
            return 1
        end

        mkdir -p "$dir"
        cd "$dir"
      '';

      code = ''
        if test -d "$argv[1]" -o -f "$argv[1]"
            open -a "Visual Studio Code" "$argv[1]"
        else
            command code $argv
        end
      '';
    };
  };

  home.file.".config/fish/conf.d" = {
    source = ./conf.d;
    recursive = true;
  };
}
