{
  pkgs,
  inputs,
  config,
  ...
}:
{
  systemd.services.set-regdom = {
    description = "Set Wi-Fi regulatory domain";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.iw}/bin/iw reg set US";
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

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true; # if not already enabled
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment the following
    jack.enable = true;
  };

  # services.jack = {
  #   jackd.enable = true;
  #   # support ALSA only programs via ALSA JACK PCM plugin
  #   alsa.enable = false;
  #   # support ALSA only programs via loopback device (supports programs like Steam)
  #   loopback = {
  #     enable = true;
  #     # buffering parameters for dmix device to work with ALSA only semi-professional sound programs
  #     #dmixConfig = ''
  #     #  period_size 2048
  #     #'';
  #   };
  # };

  musnix = {
    enable = true;
    alsaSeq.enable = true;
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
