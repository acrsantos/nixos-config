{ pkgs, inputs, nur, ... }:
{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    fastfetch
    firefox
    nur.legacyPackages."x86_64-linux".repos.Ev357.helium
    fzf
    git
    hardinfo2
    iw
    ripgrep
    kdePackages.isoimagewriter
    kdePackages.kcalc
    kdePackages.kcharselect
    kdePackages.kcolorchooser
    kdePackages.kolourpaint
    kdePackages.ksystemlog
    kdePackages.partitionmanager
    kdePackages.sddm-kcm
    kdePackages.qt6ct
    adw-gtk3
    tela-icon-theme
    libreoffice-qt
    kdiff3
    lshw
    mpv
    os-prober
    pciutils
    qbittorrent
    wayland-utils
    wl-clipboard
    inputs.neovim-nightly-overlay.packages.${system}.default
    zed-editor
    oh-my-zsh
    zsh
    reaper
    wineWow64Packages.yabridge
    winetricks
    yabridge
    yabridgectl

    cmake
    gnumake
    gcc
    libtool
    clang
    lazygit
    btop
    tree-sitter


    rustc
    cargo

    statix

    obsidian
    ghostty

    # archives
    zip
    xz
    unzip
    p7zip
    clang-tools

    fd

    yazi
  ];
}
