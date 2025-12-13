return {
  {
    "nvim-lualine/lualine.nvim",
    config = function(_, opts)
      --opts.theme = "auto"

      --[[
      opts.sections = opts.sections or {}
      opts.sections.lualine_c = opts.sections.lualine_c or {}
      -- Merge into the existing diagnostics component
      for i, comp in ipairs(opts.sections.lualine_c) do
        if type(comp) == "table" then
          if comp[1] == "diagnostics" then
            comp.symbols = vim.tbl_extend("force", comp.symbols or {}, {
              hint = "", -- remove hint icon
            })
            comp.diagnostics_color = vim.tbl_extend("force", comp.diagnostics_color or {}, {
              hint = nil, -- optional
            })
          end
        end
      end
      --]]

      -- only change lualine_z, leave everything else intact
      opts.sections = opts.sections or {}
      opts.sections.lualine_z = {
        function()
          local hour = tonumber(os.date("%I"))
          local minute = os.date("%M")
          local ampm = os.date("%p")
          return "  " .. hour .. ":" .. minute .. " " .. ampm
        end,
      }

      require("lualine").setup(opts)
    end,
  },
}
