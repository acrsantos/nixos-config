{inputs, ...}:

{
  networking = {
    hostName = "nixos";
    networkmanager = { 
      enable = true;
      wifi = { 
        powersave = true;
        # backend = "iwd";
      };

    };
    # wireless.enable = true;
    # proxy = {
    #   default = "http://user:password@proxy:port/";
    #   noProxy = "127.0.0.1,localhost,internal.domain";
    # };
    # firewall = {
    #   allowedTCPPorts = [ ... ];
    #   allowedUDPPorts = [ ... ];
    #   enable = false;
    # };
  };
}
