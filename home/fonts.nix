{pkgs, ...}: {
  home.packages = with pkgs; [
    inter
    public-sans
    ibm-plex

    ryan-mono-bin
    ryan-term-bin
    (nerdfonts.override {
      fonts = [
        "CascadiaCode"
        "NerdFontsSymbolsOnly"
      ];
    })
  ];
}
