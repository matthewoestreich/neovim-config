-- This file will be loaded automatically *after* all plugins

-- Clear existing highlights
--vim.cmd("syntax reset")
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
  ["@punctuation.special.typescript"] = { fg = "#D4D4D4" },
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
  ["@function.macro"] = { fg = "#ffffff" },
  ["@function.call"] = { fg = "#DCDCAA" },
  ["@variable"] = { fg = "#4fc1ff" },
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
  ["@method"] = { fg = "#DCDCAA" },
  ["@punctuation"] = { fg = "#d4d4d4" },
  ["@punctuation.delimiter"] = { fg = "#ffffff" },
  ["@punctuation.special.rust"] = { fg = "#ffffff" },
  ["@punctuation.bracket"] = { fg = "#C586C0" },
  ["@tag"] = { fg = "#569cd6" },
  ["@field"] = { fg = "#9cdcfe" },
  ["DiagnosticUnnecessary"] = {
    fg = "#736f44",
    blend = 50,
    undercurl = true,
    underdouble = true,
    underdashed = true,
  },
  ["@lsp.mod.mutable.rust"] = { fg = "#9cdcfe", bold = true },
}

for group, opts in pairs(ts_hl) do
  vim.api.nvim_set_hl(0, group, opts)
end
