-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- IF RUNNING ON LINUX, AND ON AN SSH SESSION FROM MY MAC,
-- USE THE MAC CLIPBOARD FOR YANK, etc..
if vim.uv.os_uname().sysname == "Linux" then
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
      ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
      ["+"] = function()
        return {}
      end,
      ["*"] = function()
        return {}
      end,
    },
  }
end

-- Add mouse events
vim.o.mousemoveevent = true

-- Add 'soft' line wrapping.
vim.opt.wrap = false

-- Prefer treesitter over semantic_tokens
vim.hl.priorities.semantic_tokens = 50 -- Default is often 100

--[[
Disable the weird `>` "inlay characters" for indentions, which were apparently representing `tab`.
For example Go code would look like:

```go
func foo() string {
 > return "foo"
}
```

Where the `>` char is inlayed.
--]]
vim.opt.list = false
