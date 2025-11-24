return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      -- only change lualine_z, leave everything else intact
      opts.sections.lualine_z = {
        function()
          local hour = tonumber(os.date("%I"))
          local minute = os.date("%M")
          local ampm = os.date("%p")
          return "  " .. hour .. ":" .. minute .. " " .. ampm
        end,
      }
    end,
  },
}
