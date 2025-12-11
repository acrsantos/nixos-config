return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },
  {
    "mason-org/mason.nvim",
    enabled = false,
    opts = {
      ensure_installed = {
        "clang-format",
        "clangd",
        "codelldb",
        "eslint-lsp",
        "json-lsp",
        "lua-language-server",
        "rust-analyzer",
        "shfmt",
        "stylua",
        "tailwindcss-language-server",
        "typescript-language-server",
      },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    enabled = false
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "html",
        "javascript",
        "json",
        "json5",
        "jsonc",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "rust",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      },
      indent = {
        enable = false
      },

      -- highlight = {
      --   enable = false,
      --   disable = function(lang, buf)
      --     local max_filesize = 100 * 1024 -- 100 KB
      --     local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      --     if ok and stats and stats.size > max_filesize then
      --       return true
      --     end
      --   end,
      --   additional_vim_regex_highlighting = true,
      -- },
    },
  },
  -- Language Specific Tools
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        rust_analyzer = function()
          return true
        end,
      },
    },
  },
}
