{
  ibm-plex,
  python312Packages,
  families ? [ ],
}:
(ibm-plex.override { inherit families; }).overrideAttrs (_: {
  pname = "ibm-plex-compat";

  postInstall = ''
    set -eo pipefail
    PATH="${python312Packages.fonttools}/bin:$PATH"

    cd "$out/share/fonts/opentype"

    ansi_green="\033[32m"
    ansi_reset="\033[0m"

    for medium_font in $(find . -type f -name '*.otf' -and -name '*Medium*'); do
      echo -e "''${ansi_green}Patching''${ansi_reset} $medium_font (Medm -> Medium)"

      ttx_path="''${medium_font%.*}.ttx"

      ttx "$medium_font"
      substituteInPlace "$ttx_path" --replace-fail 'Medm' 'Medium'
      ttx -f "$ttx_path"
      rm "$ttx_path"
    done

    for semibold_font in $(find . -type f -name '*.otf' -and -name '*SemiBold*'); do
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
