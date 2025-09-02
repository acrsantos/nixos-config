{ inputs, pkgs, ... }: {
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;
  };
  services.emacs = {
    enable = false;
  };
}
