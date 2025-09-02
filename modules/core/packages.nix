{ pkgs, inputs, ... }: 
{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = [
    pkgs.fastfetch
    pkgs.firefox
    pkgs.fzf
    pkgs.git
    pkgs.hardinfo2 
    pkgs.iw
    pkgs.ripgrep
    pkgs.kdePackages.isoimagewriter 
    pkgs.kdePackages.kcalc 
    pkgs.kdePackages.kcharselect 
    pkgs.kdePackages.kcolorchooser 
    pkgs.kdePackages.kolourpaint 
    pkgs.kdePackages.ksystemlog 
    pkgs.kdePackages.partitionmanager 
    pkgs.kdePackages.sddm-kcm 
    pkgs.kdiff3 
    pkgs.lshw
    pkgs.mpv
    pkgs.os-prober
    pkgs.pciutils
    pkgs.qbittorrent
    pkgs.wayland-utils 
    pkgs.wl-clipboard 
    inputs.neovim-nightly-overlay.packages.${pkgs.system}.default
    pkgs.oh-my-zsh
    pkgs.zsh

    pkgs.cmake
    pkgs.gnumake
    pkgs.gcc
    pkgs.libtool
    pkgs.clang
    pkgs.lazygit
    pkgs.btop

    pkgs.obsidian

    # archives
    pkgs.zip
    pkgs.xz
    pkgs.unzip
    pkgs.p7zip
    pkgs.clang-tools
  ];
}
