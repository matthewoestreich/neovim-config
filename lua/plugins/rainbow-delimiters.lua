return {
  {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      ---@diagnostic disable-next-line: unused-local
      local rainbow = require("rainbow-delimiters")

      vim.g.rainbow_delimiters = {
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterOrange",
          "RainbowDelimiterYellow",
          "RainbowDelimiterGreen",
          "RainbowDelimiterBlue",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      }
    end,
  },
}
