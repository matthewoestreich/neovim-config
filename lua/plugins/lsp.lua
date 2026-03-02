---@param opts table { root = string|table, exclude = string|table }
---@return fun(fname: string): string|nil
local function find_root_dir(opts)
  local roots = type(opts.root) == "table" and opts.root or { opts.root }
  local excludes = type(opts.exclude) == "table" and opts.exclude or { opts.exclude }

  ---@param fname string
  ---@return string|nil
  return function(fname)
    if type(fname) ~= "string" then
      fname = vim.api.nvim_buf_get_name(fname)
    end
    if fname == "" then
      return nil
    end

    local dir = vim.fs.dirname(fname)
    while dir do
      -- check excludes first
      for _, ex in ipairs(excludes) do
        if #vim.fn.glob(table.concat({ dir, ex }, "/")) > 0 then
          return nil -- stop immediately if we hit an exclude
        end
      end

      -- check roots
      for _, root in ipairs(roots) do
        if #vim.fn.glob(table.concat({ dir, root }, "/")) > 0 then
          return dir -- stop immediately if we hit a root
        end
      end

      -- move upward
      local parent = vim.fs.dirname(dir)
      if parent == dir then
        break
      end
      dir = parent
    end

    return nil
  end
end

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          cmd = { "vtsls", "--stdio" },
          filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
          root_dir = function(fname, callback)
            local result = find_root_dir({
              root = { "package.json", "tsconfig.json", "jsconfig.json" },
              exclude = { "deno.json", "deno.jsonc" },
            })(fname)

            if result ~= nil then
              callback(result)
            end
          end,
          settings = {
            vtsls = {
              autoUseWorkspaceTsdk = true,
            },
            typescript = {
              updateImportsOnFileMove = { enabled = "always" },
              suggest = { autoImports = true },
              inlayHints = {
                functionLikeReturnTypes = { enabled = true },
                parameterTypes = { enabled = true },
              },
            },
          },
        },

        denols = {
          cmd = { "deno", "lsp" },
          filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
          root_dir = function(fname, callback)
            local result = find_root_dir({
              root = { "deno.json", "deno.jsonc" },
              exclude = { "package.json", "tsconfig.json", "jsconfig.json" },
            })(fname)

            if result ~= nil then
              callback(result)
            end
          end,
          settings = {
            deno = {
              enable = true,
              lint = true,
              unstable = true,
            },
          },
        },

        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "wezterm", "vim" },
              },
              workspace = {
                checkThirdParty = false,
                library = {
                  vim.fn.expand("~/.luarocks/share/lua/5.4/wezterm/types"),
                },
              },
              hint = {
                enable = true,
              },
            },
          },
        },
      },

      diagnostics = {
        enabled = true,
        virtual_text = false,
        severity_sort = true,
        signs = true,
      },

      inlay_hints = {
        enabled = false,
      },
    },
  },
}
