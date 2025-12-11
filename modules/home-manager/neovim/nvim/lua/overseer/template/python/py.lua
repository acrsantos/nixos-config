return {
  name = "python: run file",
  builder = function()
    return {
      name = "python: run file",
      cmd = { "python" },
      args = {
        vim.fn.expand("%"),
      },
    }
  end,
  condition = {
    filetype = { "python" },
  },
}
