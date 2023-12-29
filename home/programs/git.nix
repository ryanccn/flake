{pkgs, ...}: {
  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;

    difftastic = {
      enable = true;
      display = "inline";
    };

    ignores = [
      ".DS_Store"
      ".direnv/"
    ];

    userName = "Ryan Cao";
    userEmail = "70191398+ryanccn@users.noreply.github.com";

    extraConfig = {
      user.signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM4VfgP5+HdCmM/VpTcW8jLKLyR8s0qqoIDXv7iTnWlR";
      init.defaultBranch = "main";

      commit.gpgsign = true;
      gpg.format = "ssh";
      "gpg \"ssh\"".program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";

      push.autoSetupRemote = true;
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
    # this is a TEMPORARY WORKAROUND for https://github.com/nix-community/home-manager/issues/4744
    settings.version = 1;
  };
}
