return {
  -- RUSTACEANVIM
  {
    "mrcjkb/rustaceanvim",
    version = "^6",
    lazy = false,
    init = function()
      vim.g.rustaceanvim = {
        tools = {
          check = { command = "clippy" },
          hover_actions = { replace_builtin_hover = true },
          code_action = { ui_select_fallback = true },
          enable_codelens = true,
        },
        server = {
          on_attach = function(_, bufnr)
            vim.keymap.set("n", "<leader>rrd", function()
              vim.cmd.RustLsp({ "renderDiagnostic", "current" })
            end, { silent = true, buffer = bufnr, desc = "RustLsp renderDiagnostic current" })

            vim.keymap.set("n", "K", function()
              vim.cmd.RustLsp({ "hover", "actions" })
            end, { silent = true, buffer = bufnr, desc = "RustLsp hover actions" })

            vim.defer_fn(function()
              vim.lsp.codelens.refresh({ bufnr = bufnr })
            end, 200)

            vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
              buffer = bufnr,
              callback = function()
                pcall(vim.lsp.codelens.refresh, { bufnr = bufnr })
              end,
            })
          end,
          settings = {
            ["rust-analyzer"] = {
              check = {
                command = "clippy",
              },
              mason = false,
              diagnostics = {
                enable = true,
                virtual_text = false,
              },
            },
          },
        },
      }
    end,
  },

  -- NEOTEST
  {
    "nvim-neotest/neotest",
    dependencies = { "mrcjkb/rustaceanvim", "nvim-neotest/nvim-nio" },
    opts = function(_, opts)
      opts.adapters = opts.adapters or {}
      table.insert(opts.adapters, require("rustaceanvim.neotest"))

      opts.status = {
        enabled = true,
        virtual_text = true, -- shows inline run/debug buttons
        signs = true, -- gutter signs
      }

      opts.output_panel = { enabled = true }
      opts.quickfix = { enabled = false }
      opts.summary = { enabled = true }
    end,
  },
}
