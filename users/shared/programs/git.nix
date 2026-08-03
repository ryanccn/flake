# SPDX-FileCopyrightText: 2025 Ryan Cao <hello@ryanccn.dev>
#
# SPDX-License-Identifier: Apache-2.0

{ pkgs, ... }:
let
  gitWrapped = pkgs.callPackage (
    {
      lib,
      symlinkJoin,
      makeBinaryWrapper,
      git,
    }:
    symlinkJoin {
      pname = "${git.pname}-wrapped";
      inherit (git) version meta;
      paths = [ git ];

      nativeBuildInputs = [ makeBinaryWrapper ];

      postBuild = ''
        wrapProgram $out/bin/${git.meta.mainProgram} \
          --set TZ UTC
      '';
    }
  ) { };
in
{
  programs.git = {
    enable = true;
    package = gitWrapped;

    ignores = [
      ".DS_Store"
      ".direnv/"
      ".vscode/"
      ".zed/"
      ".idea/"
    ];

    signing =
      if pkgs.stdenvNoCC.hostPlatform.isDarwin then
        {
          format = "ssh";
          key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM4VfgP5+HdCmM/VpTcW8jLKLyR8s0qqoIDXv7iTnWlR";
          signer = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
          signByDefault = true;
        }
      else
        { };

    settings = {
      user.name = "Ryan Cao";
      user.email = "hello@ryanccn.dev";

      init.defaultBranch = "main";

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

      branch.sort = "-committerdate";
      tag.sort = "version:refname";

      push.autoSetupRemote = true;
      transfer.fsckObjects = true;
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };
}
