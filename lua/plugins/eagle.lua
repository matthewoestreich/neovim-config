return {
  {
    "soulis-1256/eagle.nvim",
    config = function()
      require("eagle").setup({
        enabled = false,
        keyboard_mode = true,
        hover = { enabled = false },
        lsp = { override = false },
      })
      --vim.o.mousemoveevent = true
      --vim.keymap.set("n", "<Tab>", ":EagleWin<CR>", { noremap = true, silent = true })
    end,
  },
}
