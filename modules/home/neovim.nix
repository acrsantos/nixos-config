{
lib,
config,
pkgs,
inputs,
...
}:

{
  programs.neovim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
    vimAlias = true;
    viAlias = true;
    extraPackages = [
      pkgs.lua-language-server
      pkgs.stylua
      pkgs.ripgrep
      pkgs.clang
    ];
    plugins = [ 
      pkgs.vimPlugins.nvim-treesitter.withAllGrammars 
      pkgs.vimPlugins.lazy-nvim
      pkgs.vimPlugins.fzf-lua
    ];
  };
}

