-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-------------------------------------------------------------------------------------------------------------------------------

-- Jump to Nvim-Tree window
vim.api.nvim_set_keymap("n", "<Leader>t", "<C-w>h", { noremap = true, silent = true })

-- jump to the currently active buffer from Neo-tree
vim.api.nvim_set_keymap(
  "n",
  "<leader>o", -- or whatever key you like
  "<cmd>Neotree reveal<CR>",
  { noremap = true, silent = true }
)

--Delete without cutting (does not add deleted text to buffer).
vim.keymap.set("n", "<S-d>", '"_dd', { desc = "Delete line without affecting registers" })
vim.keymap.set("v", "<S-d>", '"_d', { desc = "Delete selection without affecting registers" })

-- Map Ctrl+Z to exit terminal mode
vim.keymap.set("t", "<C-z>", [[<C-\><C-n>]], { noremap = true, silent = true })
