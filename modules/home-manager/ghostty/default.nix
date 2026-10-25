{ config, ... }:

let 
  ghosttyConfigPath = "${config.home.homeDirectory}/nixos-config/modules/home-manager/ghostty";
in
{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;

  };
  home.file.".config/ghostty".source = config.lib.file.mkOutOfStoreSymlink ghosttyConfigPath;
}
