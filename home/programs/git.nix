_: {
  programs.git = {
    enable = true;
    difftastic.enable = true;

    ignores = [
      ".DS_Store"
      ".direnv/"
    ];

    userName = "Ryan Cao";
    userEmail = "70191398+ryanccn@users.noreply.github.com";

    extraConfig = {
      init.defaultBranch = "main";

      commit.gpgsign = true;
      gpg.format = "openpgp";
      user.signingkey = "48C96B2057D71CB1";

      log.date = "iso";
      merge.conflictstyle = "zdiff3";
      diff.algorithm = "histogram";

      transfer.fsckobjects = true;
      fetch.fsckobjects = true;
      receive.fsckObjects = true;

      push.autoSetupRemote = true;
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };
}
