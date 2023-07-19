{...}: {
  programs.fish = {
    enable = true;
    shellAbbrs = {
      "vim" = "hx";
      "ls" = "exa --all --icons";
      "dig" = "doggo";

      "glol" = "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'";
      "ghrvw" = "gh repo view --web";

      "opr" = "op run --env-file=.env.1password --";
      "dr" = "doppler run --";

      "dequarantine" = "xattr -d com.apple.quarantine";

      "bcpa" = "brew cleanup --prune=all";
      "puil" = "pnpm update --interactive --latest";
      "pip-upgrade-all" = "pip --disable-pip-version-check list --outdated --format=json | python -c \"import json, sys; print('\n'.join([x['name'] for x in json.load(sys.stdin)]))\" | xargs -n1 pip install -U";
    };
  };

  home.file.".config/fish/conf.d" = {
    source = ./fish/conf.d;
    recursive = true;
  };
}
