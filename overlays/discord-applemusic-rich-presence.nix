(
  _: prev: let
    rev = "27ea39e67424003fcc79b9ae48c906d4b605b273";
    hash = "sha256-6+SI8fj7GCykcA2D3wtE3GILfbtJc/pwcWQKkc+Nni8=";
    vendorHash = "sha256-RFJTBfsfEyKn9OSvE2HLgjKiJC3Hs90+P9rm5GlIseo=";
  in {
    discord-applemusic-rich-presence = prev.callPackage ({
      buildGoModule,
      fetchFromGitHub,
      lib,
      stdenv,
      ...
    }:
      buildGoModule rec {
        pname = "discord-applemusic-rich-presence";
        version = "0.5.0-dev.${lib.substring 0 8 rev}";

        src = fetchFromGitHub {
          owner = "caarlos0";
          repo = "discord-applemusic-rich-presence";
          inherit rev;
          inherit hash;
        };

        inherit vendorHash;

        ldflags = ["-s" "-w" "-X=main.version=${version}" "-X=main.builtBy=nixpkgs"];

        meta = with lib; {
          description = "Discord's Rich Presence from Apple Music";
          homepage = "https://github.com/caarlos0/discord-applemusic-rich-presence";
          license = licenses.mit;
          platforms = platforms.darwin;
          broken = stdenv.isLinux;
        };
      }) {};
  }
)
