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

    --vim.cmd("colorscheme kanagawa")
  end,
}

return {
  --kanigawa,
}
