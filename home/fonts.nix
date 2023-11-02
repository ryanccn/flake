{pkgs, ...}: {
  home.packages = with pkgs; [
    inter
    public-sans
    inriafonts
    ibm-plex

    ryan-mono-bin
    ryan-term-bin
    commit-mono
    (nerdfonts.override {
      fonts = [
        "CascadiaCode"
        "NerdFontsSymbolsOnly"
      ];
    })
  ];
}
