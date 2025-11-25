return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      rust_analyzer = {
        mason = false, -- Disable rust-analyzer via Mason
      },
    },
    diagnostics = {
      enabled = true,
      virtual_text = false,
      severity_sort = true,
      signs = true,
    },
    inlay_hints = { enabled = false },
  },
}
