_: {
  programs.git = {
    enable = true;
    difftastic.enable = true;

    ignores = [
      ".DS_Store"
      ".direnv/"
      ".vscode/"
      ".zed/"
      ".idea/"
    ];

    userName = "Ryan Cao";
    userEmail = "70191398+ryanccn@users.noreply.github.com";

    extraConfig = {
      init.defaultBranch = "main";

      commit.gpgSign = true;
      gpg.format = "openpgp";
      user.signingKey = "48C96B2057D71CB1";

      log.date = "iso";
      merge.conflictStyle = "zdiff3";
      diff.algorithm = "histogram";

      transfer.fsckObjects = true;
      fetch.fsckObjects = true;
      receive.fsckObjects = true;

      blame.ignoreRevsFile = ".git-blame-ignore-revs";

      fetch.prune = true;
      fetch.pruneTags = true;

      branch.sort = "-committerdate";
      tag.sort = "taggerdate";

      push.autoSetupRemote = true;
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };
}
