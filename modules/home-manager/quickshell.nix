{ inputs, ... }:

{
  programs.quickshell = {
    enable = true;
  };
  programs.dank-material-shell = {
    enable = true;
    systemd = {
      restartIfChanged = true;
    };

    enableSystemMonitoring = false;
    enableCalendarEvents = false;
  };
}
