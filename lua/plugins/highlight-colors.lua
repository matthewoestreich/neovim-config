return {
  "brenoprata10/nvim-highlight-colors",
  event = "VeryLazy",
  config = function()
    vim.opt.termguicolors = true
    require("nvim-highlight-colors").setup({
      enable_hex = true, -- highlight hex colors
      enable_short_hex = true, -- highlight short hex colors (#fff)
      enable_rgb = true, -- highlight rgb() colors
      enable_hsl = false, -- highlight hsl() colors
      render = "background", -- can be "background", "foreground", or "virtualtext"
    })
  end,
}
