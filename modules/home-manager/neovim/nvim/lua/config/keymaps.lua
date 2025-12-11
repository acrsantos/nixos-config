-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

vim.api.nvim_set_keymap("t", "<esc><esc>", "<c-\\><c-n>", { noremap = true })

vim.api.nvim_set_keymap("t", "<C-w>h", "<c-\\><c-n><C-w>h", { noremap = true })
vim.api.nvim_set_keymap("t", "<C-w>j", "<c-\\><c-n><C-w>j", { noremap = true })
vim.api.nvim_set_keymap("t", "<C-w>k", "<c-\\><c-n><C-w>k", { noremap = true })
vim.api.nvim_set_keymap("t", "<C-w>l", "<c-\\><c-n><C-w>l", { noremap = true })
