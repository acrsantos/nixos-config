{ pkgs, inputs, config, ... }:
{
  systemd.services.set-regdom = {
    description = "Set Wi-Fi regulatory domain";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.iw}/bin/iw reg set US";  # Use full path for reliability
    };
  };
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services = {
    desktopManager.plasma6.enable = true;
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;

    keyd = {
      enable = true;
      keyboards = {
        default = {
          ids = [ "*" ];
          settings = {
            main = {
              capslock = "overload(control, esc)";
              esc = "capslock";
              rightalt = "layer(nav)";
            };
            nav = {
              h = "left";
              j = "down";
              k = "up";
              l = "right";
            };
          };
        };
      };
    };
  };
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  nixpkgs.overlays = [ inputs.emacs-overlay.overlay ];
  services.emacs.enable = true;

# Enable the OpenSSH daemon.
# openssh.enable = true;
}
