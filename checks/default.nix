# SPDX-FileCopyrightText: 2025 Ryan Cao <hello@ryanccn.dev>
#
# SPDX-License-Identifier: Apache-2.0

{ self, ... }:
{
  perSystem =
    { pkgs, ... }:
    let
      mkFlakeCheck =
        args:
        pkgs.stdenv.mkDerivation (
          {
            name = "check-${args.name}";
            src = self;

            buildPhase = ''
              ${args.command}
              touch "$out"
            '';

            doCheck = false;
            dontInstall = true;
            dontFixup = true;
          }
          // (removeAttrs args [
            "name"
            "command"
          ])
        );
    in
    {
      checks = {
        nixfmt = mkFlakeCheck {
          name = "nixfmt";
          command = "find . -name '*.nix' -exec nixfmt --check {} +";

          nativeBuildInputs = with pkgs; [ nixfmt-rfc-style ];
        };

        reuse = mkFlakeCheck {
          name = "reuse";
          command = "reuse lint";

          nativeBuildInputs = with pkgs; [ reuse ];
        };
      };
    };
}
