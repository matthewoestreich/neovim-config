return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}

      -- RUST
      opts.servers.rust_analyzer = {
        mason = false,
      }

      -- TYPESCRIPT
      opts.servers.vtsls = {
        cmd = { "vtsls", "--stdio" },
        filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
        root_dir = vim.uv.cwd(),
        settings = {
          vtsls = {
            autoUseWorkspaceTsdk = true,
          },
          typescript = {
            updateImportsOnFileMove = { enabled = "always" },
            suggest = { autoImports = true },
            inlayHints = {
              functionLikeReturnTypes = { enabled = true },
              parameterTypes = { enabled = true },
            },
          },
        },
      }

      opts.diagnostics = {
        enabled = true,
        virtual_text = false,
        severity_sort = true,
        signs = true,
      }

      opts.inlay_hints = {
        enabled = false,
      }
    end,
  },
}
