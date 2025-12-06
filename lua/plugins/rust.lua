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
            vim.keymap.set("n", "<leader>Krd", function()
              --vim.cmd.RustLsp({ "hover", "actions" })
              vim.cmd.RustLsp({ "renderDiagnostic", "current" })
            end, { silent = true, buffer = bufnr })
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

      -- Optional: keymaps for running tests
      vim.api.nvim_set_keymap(
        "n",
        "<leader>tn",
        ":lua require('neotest').run.run()<CR>",
        { noremap = true, silent = true }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>tf",
        ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>",
        { noremap = true, silent = true }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>td",
        ":lua require('neotest').run.run({strategy = 'dap'})<CR>",
        { noremap = true, silent = true }
      )
    end,
  },
}
