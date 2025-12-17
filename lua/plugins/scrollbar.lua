return {
  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup({
        hide_if_all_visible = true,
        marks = {
          Cursor = {
            text = " ",
          },
        },
      })
    end,
  },
}
