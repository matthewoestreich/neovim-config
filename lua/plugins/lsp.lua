return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = {
      virtual_text = false, -- Remove inline text
      signs = true, -- Keep gutter icons
      underline = true, -- Underline offending code
      severity_sort = true, -- Sort by severity
    },
    inlay_hints = { enabled = false },
  },
}
