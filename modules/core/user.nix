{ pkgs, inputs, username, ... } :

{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    backupFileExtension = "backup";
    users.${username} = {
      imports = [ ./../home-manager ];
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
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
  };
  programs.steam = {
    enable = true;
  };
}
