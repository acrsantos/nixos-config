-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

require("vim._extui").enable({
  box = "cmd",
})

vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

vim.opt.pumblend = 0
vim.opt.pumheight = 15
vim.opt.termguicolors = true
vim.opt.scrolloff = 10
vim.opt.termsync = false
vim.opt.fillchars = { eob = " " }
-- vim.opt.background = "light"
vim.opt.winborder = "single"
vim.opt.smartindent = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.linespace = 0

vim.o.exrc = true

-- vim.lsp.enable('qmlls')
-- vim.lsp.config('qmlls', {
--   cmd = {"qmlls6", "-E"},
--   filetypes = { 'qml', 'qmljs' },
--   root_markers = { '.git' },
-- })

vim.o.guifont = "Berkeley Mono:h12"
-- vim.diagnostic.config({
  -- virtual_lines = {
  --   current_line = true,
  -- }
  -- virtual_lines = true
-- })
-- Plugins
vim.g.snacks_animate = false

if vim.g.neovide then
  vim.keymap.set({ "n", "v" }, "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
  vim.keymap.set({ "n", "v" }, "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
  vim.keymap.set({ "n", "v" }, "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>")
end
