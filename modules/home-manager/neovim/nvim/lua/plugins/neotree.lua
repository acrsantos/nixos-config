return {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = true,
  opts = {
    window = {
      position = "left",
      width = 35,
    },
    filesystem = {
      hijack_netrw_behavior = "open_current", -- open_default
      filtered_items = {
        visible = true, -- Setting this to true will only dimmed out all supposed hidden items.
        hide_dotfiles = true,
        hide_gitignored = true,
      },
    },
  },
}
