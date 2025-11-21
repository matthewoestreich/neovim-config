-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-------------------------------------------------------------------------------------------------------------------------------

-- Jump to Nvim-Tree window
vim.api.nvim_set_keymap('n', '<Leader>t', '<C-w>h', { noremap = true, silent = true })

-- jump to the currently active buffer from Neo-tree
vim.api.nvim_set_keymap(
  "n",
  "<leader>o", -- or whatever key you like
  "<cmd>Neotree reveal<CR>",
  { noremap = true, silent = true }
)