---@diagnostic disable-next-line: unused-local
local kanigawa = {
  "rebelot/kanagawa.nvim",
  enabled = false,
  lazy = false,
  priority = 1000,
  config = function()
    require("kanagawa").setup({
      compile = false,
      theme = "wave", -- wave | dragon | lotus
      background = {
        dark = "wave",
        light = "lotus",
      },
      commentStyle = { italic = false },
      keywordStyle = { italic = false },
      overrides = function()
        return {
          ["@variable.builtin"] = { italic = false },
        }
      end,
    })
    vim.cmd("colorscheme kanagawa")
  end,
}

local pitchblack = {
  "matthewoestreich/pitchblack.nvim",
  priority = 1000,
  lazy = false,
  dependencies = {
    "HiPhish/rainbow-delimiters.nvim",
  },
  opts = {},
}

local gh_dark_high_contrast = {
  "projekt0n/github-nvim-theme",
  name = "github-theme",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require("github-theme").setup({
      -- ...
    })

    vim.cmd("colorscheme github_dark_high_contrast")
  end,
}

return {
  --kanigawa,
  --pitchblack,
  gh_dark_high_contrast,
}
