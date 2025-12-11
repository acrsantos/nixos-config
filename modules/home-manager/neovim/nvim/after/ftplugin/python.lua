vim.keymap.set("n", "<leader>cc", function()
  local file = vim.fn.expand("%")
  Snacks.terminal(
    "python " .. file,
    {
      cwd = LazyVim.root(),
      win = { style = "terminal", position = "bottom" },
      auto_close = false,
    }
  )
  -- vim.cmd("wincmd p")
  -- vim.cmd("stopinsert!")
end, { noremap = true, desc = "Execute the file" })
