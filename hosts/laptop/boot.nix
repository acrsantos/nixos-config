{ inputs, ... }:
{
  boot = {
    kernelParams = [
      "pcie_aspm=off"
    ];

    extraModprobeConfig = ''
      options mt7921e disable_aspm=1
    '';

    loader = {
      efi = {
        canTouchEfiVariables = true;
      };
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        useOSProber = true;
        extraEntries = ''
          menuentry "Reboot" {
              reboot
          }
          menuentry "Poweroff" {
              halt
          }
          menuentry "BIOS" {
              fwsetup
          }
        '';
      };
    };
  };
}
