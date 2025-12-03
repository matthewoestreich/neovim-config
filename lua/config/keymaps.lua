-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-------------------------------------------------------------------------------------------------------------------------------

-- Press `jj` to go back to Normal mode.
vim.keymap.set("i", "jj", "<ESC>", { noremap = true, silent = true })
vim.keymap.set("v", "<leader>jj", "<ESC>", { noremap = true, silent = true })
-- Map keymap to exit terminal mode
vim.keymap.set("t", "<leader>jj", [[<C-\><C-n>]], { noremap = true, silent = true })

-- Jump to Nvim-Tree window
vim.api.nvim_set_keymap("n", "<Leader>t", "<C-w>h", { noremap = true, silent = true })

--Delete without cutting (does not add deleted text to buffer).
vim.keymap.set(
  "n",
  "<S-d>",
  '"_dd',
  { desc = "Delete line without affecting registers", noremap = true, silent = true }
)
vim.keymap.set(
  "v",
  "<S-d>",
  '"_d',
  { desc = "Delete selection without affecting registers", noremap = true, silent = true }
)

-- Map H (go to start of line) and L (go to end of line)
vim.keymap.set("n", "<S-h>", "^", { desc = "Go to start of line", noremap = true, silent = true })
vim.keymap.set("n", "<S-l>", "$", { desc = "Go to end of line", noremap = true, silent = true })
vim.keymap.set("v", "<S-h>", "^", { desc = "Go to start of line", noremap = true, silent = true })
vim.keymap.set("v", "<S-l>", "$", { desc = "Go to end of line", noremap = true, silent = true })
