return {
  -- RUSTACEANVIM
  {
    "mrcjkb/rustaceanvim",
    version = "^6",
    lazy = false,
    ft = "rust",
    init = function()
      vim.g.rustaceanvim = {
        tools = {
          enable_codelens = true,
        },
        server = {
          on_attach = function(_, bufnr)
            vim.keymap.set(
              "n",
              "K", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
              function()
                vim.cmd.RustLsp({ "hover", "actions" })
              end,
              { silent = true, buffer = bufnr }
            )
          end,
          settings = {
            ["rust-analyzer"] = {
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
