{pkgs, ...}: {
  home.packages = with pkgs; [
    inter
    public-sans
    inriafonts
    ibm-plex
    ryan-mono-bin
    ryan-term-bin
    (nerdfonts.override {
      fonts = ["CascadiaCode"];
    })
  ];
}
