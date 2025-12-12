return {
  {
    "mg979/vim-visual-multi",
    branch = "master",
    init = function()
      -- disable all default bindings so they don't conflict
      vim.g.VM_default_mappings = 0

      -- Option + Shift + Up/Down (⌥+⇧)
      vim.keymap.set("n", "<M-S-Up>", "<Plug>(VM-Add-Cursor-Up)", { noremap = true, silent = true })
      vim.keymap.set("n", "<M-S-Down>", "<Plug>(VM-Add-Cursor-Down)", { noremap = true, silent = true })
    end,
  },
}
