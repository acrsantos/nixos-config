-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "c", "cpp", "php", "*" },
  callback = function()
    vim.b.autoformat = false
  end,
})

local group = vim.api.nvim_create_augroup("TermBufNoLineNumbers", { clear = true })
vim.api.nvim_create_autocmd("TermOpen", {
  group = group,
  pattern = "*",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})

vim.api.nvim_create_autocmd({ "BufLeave", "WinLeave" }, {
  pattern = "*",
  callback = function()
    vim.opt_local.cursorline = false
  end,
})

-- Show cursor and cursorline when buffer gains focus
vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
  pattern = "*",
  callback = function()
    vim.opt_local.cursorline = true
  end,
})

-- vim.api.nvim_create_autocmd("LspAttach", {
--   callback = function(args)
--     vim.lsp.document_color.enable(true, args.buf, { style = "virtual" })
--   end,
-- })

-- vim.api.nvim_create_autocmd("CursorHold", {
--     callback = function()
--         vim.diagnostic.open_float(nil, { focusable = false, source = "if_many" })
--     end,
-- })

-- vim.api.nvim_create_autocmd({ "TermOpen", "BufEnter" }, {
--     pattern = { "*" },
--     callback = function()
--         if vim.opt.buftype:get() == "terminal" then
--             vim.cmd(":startinsert")
--         end
--     end
-- })

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  callback = function()
    vim.diagnostic.config({ virtual_text = false })
  end,
})

-- Hide cmd line
-- vim.api.nvim_create_autocmd('CmdlineEnter', {
--     group = vim.api.nvim_create_augroup(
--         'cmdheight_1_on_cmdlineenter',
--         { clear = true }
--     ),
--     desc = 'Don\'t hide the status line when typing a command',
--     command = ':set cmdheight=1',
-- })
--
-- vim.api.nvim_create_autocmd('CmdlineLeave', {
--     group = vim.api.nvim_create_augroup(
--         'cmdheight_0_on_cmdlineleave',
--         { clear = true }
--     ),
--     desc = 'Hide cmdline when not typing a command',
--     command = ':set cmdheight=0',
-- })
--
-- vim.api.nvim_create_autocmd('BufWritePost', {
--     group = vim.api.nvim_create_augroup(
--         'hide_message_after_write',
--         { clear = true }
--     ),
--     desc = 'Get rid of message after writing a file',
--     pattern = { '*' },
--     command = 'redrawstatus',
-- })
