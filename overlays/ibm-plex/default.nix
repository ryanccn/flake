_: (_: prev: {
  ibm-plex = prev.ibm-plex.overrideAttrs (_: {
    postInstall = ''
      set -eo pipefail
      PATH="${prev.fd}/bin:${prev.python311Packages.fonttools}/bin:$PATH"

      cd "$out/share/fonts/opentype"

      ansi_dim="\033[2m"
      ansi_blue="\033[34m"
      ansi_green="\033[32m"
      ansi_reset="\033[0m"

      medium_fonts=$(fd --extension=otf Medium)

      for medium_font in $medium_fonts; do
        echo -e "''${ansi_blue}Patching''${ansi_reset} $medium_font (Medm -> Medium)"

        ttx_path="''${medium_font%.*}.ttx"

        ttx "$medium_font"
        sed -i 's/Medm/Medium/g' "$ttx_path"
        ttx -f "$ttx_path"
      done

      semibold_fonts=$(fd --extension=otf SemiBold)

      for semibold_font in $semibold_fonts; do
        echo -e "''${ansi_blue}Patching''${ansi_reset} $semibold_font (SmBld -> Semibold)"

        ttx_path="''${semibold_font%.*}.ttx"

        ttx "$semibold_font"
        sed -i 's/SmBld/Semibold/g' "$ttx_path"
        ttx -f "$ttx_path"
      done

      echo -e "''${ansi_green}Done!''${ansi_reset}"
    '';
  });
})
