{ lib, ... }:
let
  aliases = import ./aliases.nix;

  shellAbbrs = builtins.mapAttrs (lib.const (builtins.getAttr "command")) (
    lib.filterAttrs (_: a: !(lib.maybeAttr "fishAlias" false a)) aliases
  );
  shellAliases = builtins.mapAttrs (lib.const (builtins.getAttr "command")) (
    lib.filterAttrs (_: a: lib.maybeAttr "fishAlias" false a) aliases
  );
in
{
  programs.fish = {
    enable = true;
    catppuccin.enable = true;

    inherit shellAbbrs shellAliases;

    shellInit = ''
      for config in ${./fish/configs}/*.fish
        source "$config"
      end
    '';

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

  programs.fzf = {
    enable = true;
    defaultOptions = [
      "--height 40%"
      "--layout reverse"
      "--border"
    ];
    catppuccin.enable = true;
  };

  programs.zoxide = {
    enable = true;
  };
}
