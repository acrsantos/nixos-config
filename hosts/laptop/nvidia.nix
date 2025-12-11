{ config, inputs, ... }:

{
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;

    open = true;

    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.beta;
    prime = {
     reverseSync.enable = true;
     offload = { 
     	enable = true;
	enableOffloadCmd = true;
     };
     nvidiaBusId = "PCI:1:0:0";
     amdgpuBusId = "PCI:5:0:0";
    };
  };
  hardware.graphics.enable = true;
}
