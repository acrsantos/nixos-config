{ lib, config, pkgs, inputs, ... }:

let
  nvimConfigPath = "${config.home.homeDirectory}/nixos-config/modules/home-manager/neovim/nvim";
in
{
  programs.neovim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;

    withNodeJs = true;
    withPython3 = true;
    vimAlias = true;
    viAlias = true;

    extraPackages = with pkgs; [
      tree-sitter

      lua-language-server
      stylua

      bash-language-server
      shfmt

      yaml-language-server
      yamlfmt

      typescript-language-server
      tailwindcss-language-server
      vscode-langservers-extracted

      clang
      vimPlugins.vim-clang-format

      ruff

      nil
      nixfmt-rfc-style
    ];
    plugins = with pkgs; [ 
      vimPlugins.nvim-treesitter.withAllGrammars 
      vimPlugins.fzf-lua
      vimPlugins.lazy-nvim
    ];
  };
  home.file.".config/nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink nvimConfigPath;
  };

  programs.neovide.enable = true;
}

