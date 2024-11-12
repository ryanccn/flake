{
  ibm-plex,
  fd,
  python312Packages,
}:
ibm-plex.overrideAttrs (_: {
  pname = "ibm-plex-compat";

  postInstall = ''
    set -eo pipefail
    PATH="${fd}/bin:${python312Packages.fonttools}/bin:$PATH"

    cd "$out/share/fonts/opentype"

    ansi_green="\033[32m"
    ansi_reset="\033[0m"

    medium_fonts=$(fd --extension=otf Medium)

    for medium_font in $medium_fonts; do
      echo -e "''${ansi_green}Patching''${ansi_reset} $medium_font (Medm -> Medium)"

      ttx_path="''${medium_font%.*}.ttx"

      ttx "$medium_font"
      substituteInPlace "$ttx_path" --replace-fail 'Medm' 'Medium'
      ttx -f "$ttx_path"
      rm "$ttx_path"
    done

    semibold_fonts=$(fd --extension=otf SemiBold)

    for semibold_font in $semibold_fonts; do
      echo -e "''${ansi_green}Patching''${ansi_reset} $semibold_font (SmBld -> Semibold)"

      ttx_path="''${semibold_font%.*}.ttx"

      ttx "$semibold_font"
      substituteInPlace "$ttx_path" --replace-fail 'SmBld' 'Semibold'
      ttx -f "$ttx_path"
      rm "$ttx_path"
    done

    echo -e "''${ansi_green}Done!''${ansi_reset}"
  '';
})
