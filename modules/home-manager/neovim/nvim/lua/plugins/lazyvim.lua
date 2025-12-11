return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      dashboard = {
        enabled = true,
        preset = {
          header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
        },
        sections = {
          { section = "header" },
          { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
          { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          { section = "startup" },
        },
      },
      bigfile = { enabled = true },
      quickfile = { enabled = true },
      indent = { enabled = false },
      -- picker = {
      --   layout = {
      --     preset = "default",
      --     layout = {
      --       backdrop = false,
      --     --   row = 1,
      --     --   width = 0.4,
      --     --   min_width = 80,
      --     --   height = 0.4,
      --     -- border = "none",
      --     --   box = "vertical",
      --     --   { win = "input", height = 1, border = "single", title = "{title} {live} {flags}", title_pos = "center" },
      --     --   { win = "list", border = "single" },
      --     --   -- { win = "preview", title = "{preview}", border = "rounded" },
      --     }
      --   },
      --   sources = {
      --     explorer = {
      --       -- focus = "input",
      --       auto_close = true;
      --     },
      --   }
      -- },
      terminal = {
        win = {
          wo = {
            winbar = "",
          },
        },
      },
      styles = {
        split = {
          height = 0.3,
          width = 0.4,
        },
      },
    },
  },
  {
    "sindrets/diffview.nvim",
    lazy = true,
  },
  {
    "folke/flash.nvim",
    opts = {
      modes = {
        search = {
          enabled = false,
        },
        char = {
          enabled = false,
        },
      },
    },
  },
  {
    "stevearc/overseer.nvim",
    opts = {
      strategy = "terminal",
      task_list = {
        direction = "right",
      },
      templates = { "builtin", "cpp.run", "cpp.compile", "python.py" },
      component_aliases = {
        -- Most tasks are initialized with the default components
        default = {
          { "display_duration", detail_level = 2 },
          "on_output_summarize",
          "on_exit_set_status",
          { "on_complete_dispose", require_view = {} },
        },
        -- Tasks from tasks.json use these components
        default_vscode = {
          "default",
        },
      },
    },
  },
  {
    "Saghen/blink.cmp",
    opts = {
      completion = {
      --   menu = {
      --     border = "single",
      --     auto_show = true,
      --   },
      --   documentation = { window = { border = "single" } },
      list = { selection = { preselect = false, auto_insert = true } },
      },
      signature = {
        enabled = true,
        window = { border = "single" },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        php = { "php" },
      },
      formatters = {
        php = {
          command = "php-cs-fixer",
          args = {
            "fix",
            "$FILENAME",
          },
          stdin = false,
        },
      },
    },
  },
}
