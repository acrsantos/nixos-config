{ pkgs, inputs, username, ... } :

{
  imports = [ 
    inputs.home-manager.nixosModules.home-manager 
  ];
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    backupFileExtension = "backup";
    users.${username} = {
      imports = [ 
        ./../home-manager
        inputs.reaper-flake.homeModules.reaper
      ];
      home = {
        username = "${username}";
        homeDirectory = "/home/${username}";
        stateVersion = "25.05";
      };
    };
  };
  users.users.${username} = {
    isNormalUser = true;
    description = "Adrian";
    extraGroups = [ "networkmanager" "wheel" "audio" "libvirtd" ];
    packages = with pkgs; [];
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
  };
}
