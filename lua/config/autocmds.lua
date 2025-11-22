-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- ~/.config/nvim/lua/config/autocmds.lua

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------------
-- Set floating windows background to black
-----------------------------------------------------------------------------------------------------------------------
local function set_float_black()
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000", fg = "#ffffff" })
  vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#000000", fg = "#888888" })
end
-- apply immediately (for current colorscheme)
set_float_black()
-- re-apply whenever colorscheme changes
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = set_float_black,
})
-----------------------------------------------------------------------------------------------------------------------
-- END - Set floating windows background to black
-----------------------------------------------------------------------------------------------------------------------

-- Disable annoying markdown LSP diagnostics
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.diagnostic.enable(false)
  end,
})
