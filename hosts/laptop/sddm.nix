{ pkgs, lib, config, ... }:

let
  background-package = pkgs.stdenvNoCC.mkDerivation {
    name = "custom-wallpaper";
    src = ../../background.jpg;
      dontUnpack = true;
    installPhase = ''
      mkdir -p $out
      cp $src $out/background.jpg
    '';

  };
in
{
  services = {
    displayManager.sddm = {
      enable = lib.mkDefault true;
      theme = "breeze";
      wayland.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    (pkgs.writeTextDir "share/sddm/themes/breeze/theme.conf.user" ''
     [General]
     background = "${background-package}/background.jpg"
     '')
  ];

}
