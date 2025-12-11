return {
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    dependencies = {
      "folke/snacks.nvim",
    },
    keys = {
      {
        "<leader>-",
        mode = { "n", "v" },
        "<cmd>Yazi<cr>",
        desc = "Open yazi at the current file",
      },
      {
        -- Open in the current working directory
        "<leader>cw",
        "<cmd>Yazi cwd<cr>",
        desc = "Open the file manager in nvim's working directory",
      },
      -- {
      --   "<leader>e",
      --   "<cmd>Yazi toggle<cr>",
      --   desc = "Resume the last yazi session",
      -- },
    },
    opts = {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = true,
      floating_window_scaling_factor = 1.0,
      yazi_floating_window_border = "none",
      keymaps = {
        show_help = "<f1>",
      },
    },
  },
}
