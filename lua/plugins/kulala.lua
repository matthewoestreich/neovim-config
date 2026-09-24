return {
  {
    "mistweaverco/kulala.nvim",
    ft = { "http", "rest" }, -- Only load when opening HTTP/REST files
    keys = {
      {
        "<leader>R",
        function()
          require("kulala").run()
        end,
        desc = "Run current request",
      },
      {
        "<leader>ra",
        function()
          require("kulala").run_all()
        end,
        desc = "Run all requests",
      },
      {
        "<leader>ri",
        function()
          require("kulala").inspect()
        end,
        desc = "Inspect current request (curl)",
      },
      {
        "<leader>re",
        function()
          require("kulala").set_selected_env()
        end,
        desc = "Select environment",
      },
      {
        "[r",
        function()
          require("kulala").jump_prev()
        end,
        desc = "Jump to previous request",
      },
      {
        "]r",
        function()
          require("kulala").jump_next()
        end,
        desc = "Jump to next request",
      },
      {
        "<leader>co",
        function()
          require("kulala").copy()
        end,
        desc = "Copy request as curl",
      },
    },
    opts = {
      -- Enable VS Code REST Client environment variable file support
      vscode_rest_client_environmentvars = true,
      -- Default format for the response split panel
      winbar = true,
      default_view = "body",
    },
  },
}
