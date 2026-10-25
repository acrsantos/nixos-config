{
  pkgs,
  lib,
  ...
}:

let
  background-package = pkgs.stdenvNoCC.mkDerivation {
    name = "custom-wallpaper";
    src = ../../background2.jpg;
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

  environment.systemPackages = [
    (pkgs.writeTextDir "share/sddm/themes/breeze/theme.conf.user" ''
      [General]
      background = "${background-package}/background.jpg"
    '')
  ];

  environment.etc."xdg/kscreenlockerrc".text = ''
    [Greeter]
    WallpaperPlugin=org.kde.image

    [Greeter][Wallpaper][org.kde.image][General]
    Image=file://${background-package}/background.jpg
  '';

}
