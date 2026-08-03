# SPDX-FileCopyrightText: 2025 Ryan Cao <hello@ryanccn.dev>
#
# SPDX-License-Identifier: Apache-2.0

{
  programs.fish = {
    enable = true;

    shellAbbrs = {
      g = "git";
      j = "just";

      nb = "nix build";
      nfu = "nix flake update";

      glol = "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'";
      ghrvw = "gh repo view --web";

      opr = "op run --env-file=.env.1password --";
      dr = "doppler run --";

      dequarantine = "xattr -d com.apple.quarantine";

      bcpa = "brew cleanup --prune=all";
      puil = "pnpm update --interactive --latest";
    };

    shellAliases = { };

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
  };

  programs.zoxide = {
    enable = true;
  };
}
