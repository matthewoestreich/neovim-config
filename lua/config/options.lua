-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Prefer treesitter over semantic_tokens
vim.highlight.priorities.semantic_tokens = 50 -- Default is often 100
vim.keymap.set("i", "jj", "<ESC>", { noremap = true, silent = true })
