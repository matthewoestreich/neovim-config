local theme = {
  normal = {
    a = { fg = "#1b1d2b", bg = "#82aaff", gui = "" },
    b = { fg = "#82aaff", bg = "#3b4261" },
    c = { fg = "#ffffff", bg = "#1e2030" },
  },
  insert = {
    a = { fg = "#1b1d2b", bg = "#c3e88d", gui = "" },
    b = { fg = "#c3e88d", bg = "#3b4261" },
    c = { fg = "#ffffff", bg = "#1e2030" },
  },
  visual = {
    a = { fg = "#1b1d2b", bg = "#c099ff", gui = "" },
    b = { fg = "#c099ff", bg = "#3b4261" },
    c = { fg = "#ffffff", bg = "#1e2030" },
  },
  command = {
    a = { fg = "#1b1d2b", bg = "#ffc777", gui = "" },
    b = { fg = "#ffc777", bg = "#3b4261" },
    c = { fg = "#ffffff", bg = "#1e2030" },
  },
  replace = {
    a = { fg = "#1b1d2b", bg = "#ff757f", gui = "" },
    b = { fg = "#ff757f", bg = "#3b4261" },
    c = { fg = "#ffffff", bg = "#1e2030" },
  },
  terminal = {
    a = { fg = "#1b1d2b", bg = "#4fd6be", gui = "" },
    b = { fg = "#4fd6be", bg = "#3b4261" },
    c = { fg = "#ffffff", bg = "#1e2030" },
  },
  inactive = {
    a = { fg = "#82aaff", bg = "#1e2030", gui = "" },
    b = { fg = "#3b4261", bg = "#1e2030" },
    c = { fg = "#828bb8", bg = "#1e2030" },
  },
}

return {
  {
    "nvim-lualine/lualine.nvim",
    config = function(_, opts)
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
      opts.theme = theme
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
