{ inputs, ... }:

{
  programs.quickshell = {
    enable = true;
  };
  programs.dankMaterialShell = {
    enable = true;
    systemd.enable = true;
  };
}
