{ ... }: {
  services.kanshi = {
    enable = true;
    profiles = {
      docked = {
        outputs = [
          {
            criteria = "eDP-1";
            status = "disable";
          }
          {
            criteria = "HDMI-A-1";
            status = "enable";
            mode = "1920x1080@60Hz";
            position = "0,0";
          }
        ];
      };
      undocked = {
        outputs = [
          {
            criteria = "eDP-1";
            status = "enable";
            position = "0,0";
            mode = "1920x1080@144Hz";
          }
        ];
      };
    };
  };
}
