local function set_nvim_colors()
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000", fg = "#ffffff" })
  vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#000000", fg = "#888888" })
  -- Line numbers
  --vim.api.nvim_set_hl(0, "LineNr", { fg = "#555555", bg = "#000000" })
  vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#777777", bg = "#000000" })
  vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#777777", bg = "#000000" })
  -- Sign column (git signs, diagnostics, breakpoints)
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#000000" })
  vim.api.nvim_set_hl(0, "SignColumnSB", { bg = "#000000" })
  -- Fold column (if shown)
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#000000" })
end

local function setup_rainbow_delimiters()
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

local function apply_lualine_colors()
  local theme = {
    normal = {
      a = { fg = "#1b1d2b", bg = "#82aaff", gui = "bold" },
      b = { fg = "#82aaff", bg = "#3b4261" },
      c = { fg = "#ffffff", bg = "#1e2030" },
    },
    insert = {
      a = { fg = "#1b1d2b", bg = "#c3e88d", gui = "bold" },
      b = { fg = "#c3e88d", bg = "#3b4261" },
      c = { fg = "#ffffff", bg = "#1e2030" },
    },
    visual = {
      a = { fg = "#1b1d2b", bg = "#c099ff", gui = "bold" },
      b = { fg = "#c099ff", bg = "#3b4261" },
      c = { fg = "#ffffff", bg = "#1e2030" },
    },
    command = {
      a = { fg = "#1b1d2b", bg = "#ffc777", gui = "bold" },
      b = { fg = "#ffc777", bg = "#3b4261" },
      c = { fg = "#ffffff", bg = "#1e2030" },
    },
    replace = {
      a = { fg = "#1b1d2b", bg = "#ff757f", gui = "bold" },
      b = { fg = "#ff757f", bg = "#3b4261" },
      c = { fg = "#ffffff", bg = "#1e2030" },
    },
    terminal = {
      a = { fg = "#1b1d2b", bg = "#4fd6be", gui = "bold" },
      b = { fg = "#4fd6be", bg = "#3b4261" },
      c = { fg = "#ffffff", bg = "#1e2030" },
    },
    inactive = {
      a = { fg = "#82aaff", bg = "#1e2030", gui = "bold" },
      b = { fg = "#3b4261", bg = "#1e2030" },
      c = { fg = "#828bb8", bg = "#1e2030" },
    },
  }

  -- Apply the theme
  require("lualine").setup({
    options = {
      theme = theme,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      globalstatus = true,
    },
  })
end

vim.g.colors_name = "pitchblack"
vim.o.background = "dark"

-- Normal text
vim.api.nvim_set_hl(0, "Normal", { fg = "#d4d4d4", bg = "#000000" })
vim.api.nvim_set_hl(0, "NormalNC", { fg = "#d4d4d4", bg = "#000000" })

-- Treesitter / Syntax highlights
local ts_hl = {
  ["@constructor.typescript"] = { fg = "#4ec9b0" },
  ["@keyword.return.typescript"] = { fg = "#C586C0" },
  ["@keyword.coroutine.typescript"] = { fg = "#C586C0" },
  ["@type.builtin.typescript"] = { fg = "#4EC9B0" },
  ["@attribute"] = { fg = "#ffffff" },
  ["@comment"] = { fg = "#6a9955", italic = false },
  ["@string"] = { fg = "#d69d85" },
  ["@character"] = { fg = "#d69d85" },
  ["@keyword"] = { fg = "#569cd6", italic = false },
  ["@keyword.function"] = { fg = "#569cd6" },
  ["@keyword.modifier"] = { fg = "#569cd6" },
  ["@keyword.struct"] = { fg = "#569cd6" },
  ["@keyword.repeat"] = { fg = "#C586C0" },
  ["@keyword.conditional"] = { fg = "#C586C0" },
  ["@keyword.enum"] = { fg = "#569cd6" },
  ["@keyword.import"] = { fg = "#569cd6" },
  ["@function"] = { fg = "#DCDCAA" },
  ["@function.rust"] = { fg = "#DCDCAA" },
  ["@function.method"] = { fg = "#DCDCAA" },
  ["@function.call"] = { fg = "#DCDCAA" },
  ["@variable"] = { fg = "#9CDCFE" },
  ["@variable.builtin"] = { fg = "#569cd6" },
  ["@variable.member"] = { fg = "#9cdcfe" },
  ["@variable.parameter"] = { fg = "#9cdcfe" },
  ["@constant"] = { fg = "#4fc1ff" },
  ["@type"] = { fg = "#4ec9b0" },
  ["@number"] = { fg = "#b5cea8" },
  ["@boolean"] = { fg = "#569cd6" },
  ["@module"] = { fg = "#4ec9b0" },
  ["@operator"] = { fg = "#d4d4d4" },
  ["@namespace"] = { fg = "#569cd6" },
  ["@parameter"] = { fg = "#9cdcfe" },
  ["@property"] = { fg = "#9cdcfe" },
  ["@punctuation.delimiter"] = { fg = "#ffffff" },
  ["@punctuation.special"] = { fg = "#ffffff" },
  ["@method"] = { fg = "#DCDCAA" },
  ["@tag"] = { fg = "#569cd6" },
  ["@field"] = { fg = "#9cdcfe" },
  ["@lsp.mod.mutable.rust"] = { fg = "#9cdcfe", bold = true },
  ["@lsp.typemod.generic.attribute.rust"] = { fg = "#ffffff" },
  ["@lsp.type.formatSpecifier.rust"] = { fg = "#569cd6" },
  ["@type.builtin.rust"] = { fg = "#4EC9B0" },
  ["SnacksPickerGitStatusUntracked"] = { fg = "#b6b6c0", italic = true },
  ["DiagnosticUnderlineError"] = { undercurl = true, underdouble = true, sp = "#ff0000" },
  ["DiagnosticUnderlineHint"] = { undercurl = true, underdouble = true, sp = "#4fd6be" },
  ["DiagnosticUnderlineWarn"] = { undercurl = true, underdouble = true, sp = "#ffc777" },
  ["DiagnosticUnnecessary"] = {
    blend = 50,
    underdouble = true,
    fg = "#736f44",
    sp = "#ffc777",
  },
}

for group, opts in pairs(ts_hl) do
  vim.api.nvim_set_hl(0, group, opts)
end

-- Set floating windows to black
set_nvim_colors()
apply_lualine_colors()
setup_rainbow_delimiters()

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    set_nvim_colors()
    apply_lualine_colors()
    setup_rainbow_delimiters()
  end,
})
