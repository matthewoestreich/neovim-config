---@diagnostic disable-next-line: unused-local
local kanigawa = {
  "rebelot/kanagawa.nvim",
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
  dir = vim.fn.stdpath("config") .. "/colors",
  lazy = false,
  config = function()
    vim.cmd("colorscheme pitchblack")
  end,
}

return {
  --kanigawa,
  pitchblack,
}
