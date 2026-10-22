return {
  "nemanjamalesija/ts-expand-hover.nvim",
  ft = { "typescript", "typescriptreact" },
  opts = {
    keymaps = {
      -- LazyVim overrides default 'K' with noice.nvim / native bindings.
      -- Assigning a dedicated keymap like <leader>th prevents conflicts.
      hover = "<leader>th",
      expand = "+", -- Inside float: expands fields 1 level deeper
      collapse = "-", -- Inside float: collapses fields 1 level shallower
      close = { "q", "<Esc>" },
    },
    float = {
      border = "rounded",
      max_width = 80,
      max_height = 30,
    },
  },
}
