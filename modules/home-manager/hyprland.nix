{ inputs, pkgs, config, ... }:

{
  imports = [ inputs.dms.homeModules.dankMaterialShell.default];

  home.packages = with pkgs; [
      swww
      wl-clipboard
      hyprpolkitagent
      hyprland-qtutils
      rofi
  ];
  home.pointerCursor = {
    gtk.enable = true;
# x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };
  xdg.configFile."uwsm/env".source = "${config.home.sessionVariablesPackage}/etc/profile.d/hm-session-vars.sh"; 

  gtk = {
    enable = true;

    # theme = {
    #   package = pkgs.flat-remix-gtk;
    #   name = "Flat-Remix-GTK-Grey-Darkest";
    # };

    # iconTheme = {
    #   package = pkgs.adwaita-icon-theme;
    #   name = "Adwaita";
    # };

    font = {
      name = "Sans";
      size = 10;
    };
  };
  wayland.windowManager.hyprland = {
    enable = true;
    # package = pkgs.hyprland;
    systemd = {
      enable = true;
      enableXdgAutostart = true;
      variables = [ "--all" ];
    };
    xwayland = {
      enable = true;
    };
    settings = {
      "$terminal" = "kitty";
      "$fileManager" = "dolphin";

      # env = [
      #   "NIXOS_OZONE_WL, 1"
      #   "QT_QPA_PLATFORMTHEME, kde"
      #   "ELECTRON_OZONE_PLATFORM_HINT,wayland"
      #   "XDG_CURRENT_DESKTOP, Hyprland"
      #   "XDG_SESSION_TYPE, wayland"
      #   "XDG_SESSION_DESKTOP, Hyprland"
      #   "GDK_BACKEND, wayland, x11"
      #   "TERMINAL,kitty"
      #   "XDG_TERMINAL_EMULATOR,kitty"
      #   "GDK_SCALE,1"
      #   "QT_SCALE_FACTOR,1"
      #   "EDITOR,nvim"
      # ];
      input = {
        kb_layout = "us";
        repeat_delay = 200;
        repeat_rate = 50;
        follow_mouse = 1;
        sensitivity = 0.3;
        accel_profile = "flat";
        touchpad = {
          natural_scroll = true;
          middle_button_emulation = true;
          tap-and-drag = true;
        };
      };

      animations = {
        enabled = false;
        bezier = [
          "linear, 0, 0, 1, 1"
            "md3_standard, 0.2, 0, 0, 1"
            "md3_decel, 0.05, 0.7, 0.1, 1"
            "md3_accel, 0.3, 0, 0.8, 0.15"
            "overshot, 0.05, 0.9, 0.1, 1.1"
            "crazyshot, 0.1, 1.5, 0.76, 0.92 "
            "hyprnostretch, 0.05, 0.9, 0.1, 1.0"
            "menu_decel, 0.1, 1, 0, 1"
            "menu_accel, 0.38, 0.04, 1, 0.07"
            "easeInOutCirc, 0.85, 0, 0.15, 1"
            "easeOutCirc, 0, 0.55, 0.45, 1"
            "easeOutExpo, 0.16, 1, 0.3, 1"
            "softAcDecel, 0.26, 0.26, 0.15, 1"
            "md2, 0.4, 0, 0.2, 1 # use with .2s duration"
        ];
        animation = [
          "windows, 1, 3, md3_decel, popin 60%"
            "windowsIn, 1, 3, md3_decel, popin 60%"
            "windowsOut, 1, 3, md3_accel, popin 60%"
            "border, 1, 10, default"
            "fade, 1, 3, md3_decel"
            "layersIn, 1, 3, menu_decel, slide"
            "layersOut, 1, 1.6, menu_accel"
            "fadeLayersIn, 1, 2, menu_decel"
            "fadeLayersOut, 1, 4.5, menu_accel"
            "workspaces, 1, 7, menu_decel, slide"
        ];
      };

      general = {
        gaps_in = 3;
        gaps_out = 10;
        border_size = 1;
        "col.active_border" = "rgba(8FCEF3ff)";
        "col.inactive_border" = "rgba(595959aa)";
        resize_on_border = true;
        allow_tearing = false;
        layout = "master";
      };

      decoration = {
        rounding = 10;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        dim_inactive = false;
        dim_strength = 0.5;

        blur = {
          enabled = true;
          size = 10;
          passes = 2;
        };
        shadow = {
          enabled = true;
        };
      };

      master = {
        new_status = "master";
        new_on_top = true;
      };

      misc = {
        disable_hyprland_logo = true;
        force_default_wallpaper = 0;
        enable_swallow = true;
        middle_click_paste = false;
        swallow_regex = "^(com.mitchellh.ghostty)$";
      };

      ecosystem = {
        no_donation_nag = true;
        no_update_news = false;
      };

      "$modifier" = "SUPER";
      bind = [
        "$modifier, F, fullscreen, 1"

          "$modifier, Return, exec, $terminal"
          "$modifier, Q, killactive, "
          "$modifier, M, exit, "
          "$modifier, E, exec, $fileManager"
          # "$modifier, O, exec, ghostty -e zsh -ic \"y; zsh\""
          "$modifier, A, togglefloating"
          "$modifier, D, exec, rofi -show drun -config ~/.config/rofi/launchers/type-1/style-5.rasi"
          "$modifier, P, pseudo, # dwindle"
          "$modifier, S, togglesplit, # dwindle"
          "$modifier, I, exec, pkill hyprsunset || hyprsunset -t 3500"
          "$modifier, B, exec, pkill waybar || waybar"

          "$modifier, W, layoutmsg, swapwithmaster"
          "$modifier, H, movefocus, l"
          "$modifier, L, movefocus, r"
          "$modifier, J, layoutmsg, cyclenext"
          "$modifier, K, layoutmsg, cycleprev"
          "$modifier SHIFT, J, layoutmsg, swapnext"
          "$modifier SHIFT, K, layoutmsg, swapprev"

          ", XF86MonBrightnessUp, exec, brightnessctl set +10%"
          ", XF86MonBrightnessDown, exec, brightnessctl set 10-%"
          ", XF86AudioLowerVolume, exec, wp-volume.sh 0.02-"
          ", XF86AudioRaiseVolume, exec, wp-volume.sh 0.02+"
          ", XF86AudioMute, exec, pamixer --toggle-mute"
          ", Print,    exec, hyprshot -m region --clipboard-only"
          "SHIFT, Print,    exec, hyprshot -m output -o $HOME/Pictures/Screenshots/"

          "$modifier, 1, workspace, 1"
          "$modifier, 2, workspace, 2"
          "$modifier, 3, workspace, 3"
          "$modifier, 4, workspace, 4"
          "$modifier, 5, workspace, 5"
          "$modifier, 6, workspace, 6"
          "$modifier, 7, workspace, 7"
          "$modifier, 8, workspace, 8"
          "$modifier, 9, workspace, 9"
          "$modifier, 0, workspace, 10"

          "$modifier SHIFT, 1, movetoworkspace, 1"
          "$modifier SHIFT, 2, movetoworkspace, 2"
          "$modifier SHIFT, 3, movetoworkspace, 3"
          "$modifier SHIFT, 4, movetoworkspace, 4"
          "$modifier SHIFT, 5, movetoworkspace, 5"
          "$modifier SHIFT, 6, movetoworkspace, 6"
          "$modifier SHIFT, 7, movetoworkspace, 7"
          "$modifier SHIFT, 8, movetoworkspace, 8"
          "$modifier SHIFT, 9, movetoworkspace, 9"
          "$modifier SHIFT, 0, movetoworkspace, 10"


          "$modifier, S, togglespecialworkspace, magic"
          "$modifier SHIFT, S, movetoworkspace, special:magic"
          "$modifier Control, S, movetoworkspace, +0"

          "$modifier, mouse_down, workspace, e+1"
          "$modifier, mouse_up, workspace, e-1"
        ];
      bindm = [
        "$modifier, mouse:272, movewindow"
          "$modifier, mouse:273, resizewindow"
      ];
    };
    extraConfig = ''
      monitor=,preferred,auto,auto
      monitor=Virtual-1,1920x1080@60,auto,1

      workspace = w[tv1], gapsout:0, gapsin:0
      workspace = f[1], gapsout:0, gapsin:0
      windowrule = bordersize 0, floating:0, onworkspace:w[tv1]
      windowrule = rounding 0, floating:0, onworkspace:w[tv1]
      windowrule = bordersize 0, floating:0, onworkspace:f[1]
      windowrule = rounding 0, floating:0, onworkspace:f[1]
    '';
  };
}

