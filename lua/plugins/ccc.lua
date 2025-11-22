--- If your cursor is on a color (like "#ff0000" for example) you can type <leader>ccc and it will open a color picker.
--- Also, notice how the text is the actual color of the hex? That is another feature of this plugin.
return {
  "uga-rosa/ccc.nvim",
  config = function()
    local ccc = require("ccc")

    ccc.setup({
      highlighter = {
        auto_enable = true, -- automatically highlight color codes in buffer
        lsp = true,
        parse_css_colors = true, -- supports hex (#RRGGBB/#RGB), rgb(), hsl()
      },
      picker = {
        enabled = true, -- enable the color picker
        keymap = {
          accept = "<CR>",
          toggle = "t",
          next = "<Tab>",
          prev = "<S-Tab>",
          quit = "q",
        },
      },
    })

    vim.keymap.set("n", "<leader>ccc", ":CccPick<CR>", { desc = "Open ccc.nvim color picker" })
  end,
}
