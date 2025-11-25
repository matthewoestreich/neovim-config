return {
  {
    "hrsh7th/nvim-cmp",
    enabled = true,
    opts = function(_, opts)
      local cmp = require("cmp")

      opts.completion = opts.completion or {}
      opts.completion.completeopt = "menu,menuone,noinsert,noselect"

      -- IMPORTANT: enable auto-trigger on trigger characters
      opts.preselect = cmp.PreselectMode.None

      opts.mapping = vim.tbl_extend("force", opts.mapping or {}, {
        ["<C-Space>"] = cmp.mapping.complete(), -- manual trigger if needed
      })

      -- Require minimal config for auto-trigger on "."
      opts.experimental = { ghost_text = false }

      return opts
    end,
  },
}
