-- This file sets the colors for nested brackets to mirror what my VSCode config was.

local M = {}

function M.setup()
  -- Clear punctuation colors so RainbowDelimiter colors show
  for _, grp in ipairs({
    "@punctuation.bracket",
    "@punctuation.bracket.rust",
    "@punctuation.bracket.typescript",
    "@punctuation.bracket.javascript",
    "@punctuation.bracket.jsx",
    "@punctuation.bracket.tsx",
  }) do
    vim.api.nvim_set_hl(0, grp, { fg = "NONE", bg = "NONE", link = "" })
  end

  -- VS Code's default bracket colors (in correct nesting order)
  local rainbow_delimiter_hls = {
    RainbowDelimiterYellow = { fg = "#FFD700" },
    RainbowDelimiterPurple = { fg = "#DA70D6" },
    RainbowDelimiterBlue = { fg = "#179fff" },
  }

  -- Apply highlights
  for group, opts in pairs(rainbow_delimiter_hls) do
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- Set nesting order — MOST IMPORTANT PART
  vim.g.rainbow_delimiters = {
    highlight = {
      "RainbowDelimiterYellow",
      "RainbowDelimiterPurple",
      "RainbowDelimiterBlue",
    },
    highlight_priority = 2000,
  }
end

return M
