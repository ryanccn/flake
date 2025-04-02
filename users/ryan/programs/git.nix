# SPDX-FileCopyrightText: 2025 Ryan Cao <hello@ryanccn.dev>
#
# SPDX-License-Identifier: Apache-2.0

{
  programs.git = {
    enable = true;
    # difftastic.enable = true;

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
      user.signingKey = "F605AB4AF937D5D0";

      column.ui = "auto";
      log.date = "iso";
      merge.conflictStyle = "zdiff3";

      diff.algorithm = "histogram";
      diff.colorMoved = "plain";
      diff.mnemonicPrefix = true;
      diff.renames = true;

      fetch.prune = true;
      fetch.pruneTags = true;
      fetch.all = true;

      transfer.fsckObjects = true;

      branch.sort = "-committerdate";
      tag.sort = "version:refname";

      push.autoSetupRemote = true;
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };
}
