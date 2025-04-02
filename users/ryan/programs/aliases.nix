# SPDX-FileCopyrightText: 2025 Ryan Cao <hello@ryanccn.dev>
#
# SPDX-License-Identifier: Apache-2.0

{
  "g".command = "git";
  "j".command = "just";

  "nb".command = "nix build";
  "nfu".command = "nix flake update";

  "glol".command =
    "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'";
  "glol".fishAlias = true;

  "ghrvw".command = "gh repo view --web";

  "opr".command = "op run --env-file=.env.1password --";
  "dr".command = "doppler run --";

  "dequarantine".command = "xattr -d com.apple.quarantine";

  "bcpa".command = "brew cleanup --prune=all";
  "puil".command = "pnpm update --interactive --latest";
}
