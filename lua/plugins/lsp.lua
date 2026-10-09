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
    local cwd = vim.fn.getcwd()
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
      -- fail-safe: stop if we reach cwd
      if dir == cwd then
        return nil
      end
      dir = parent
    end

    return nil
  end
end

--[[
  CONFIG STARTS HERE
--]]

-- local util = require("lspconfig.util")

local vtsls_file_types = { "typescript", "typescriptreact", "javascript", "javascriptreact" }
local vtsls_root_dir = {
  files_and_folders_that_denote_project_root = { "package.json", "tsconfig.json", "jsconfig.json" },
  files_and_folders_to_exclude_from_denoting_project_root = { "deno.json", "deno.jsonc" },
}

return {
  {
    "neovim/nvim-lspconfig",
    opts = {

      servers = {
        html = {},

        clangd = {
          on_attach = function(client, bufnr)
            require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
          end,
        },

        vtsls = {
          workspace_required = true,
          cmd = { "vtsls", "--stdio" },
          filetypes = vtsls_file_types,
          root_dir = function(fname, callback)
            local result = find_root_dir({
              root = vtsls_root_dir.files_and_folders_that_denote_project_root,
              exclude = vtsls_root_dir.files_and_folders_to_exclude_from_denoting_project_root,
            })(fname)

            if result ~= nil then
              callback(result)
            else
              vim.notify(
                string.format(
                  "Project root not found! Please create one of these files/folders at root:\n-%s",
                  table.concat(vtsls_root_dir.files_and_folders_that_denote_project_root, "\n-")
                ),
                vim.log.levels.WARN
              )
            end
          end,
          settings = {
            vtsls = {
              autoUseWorkspaceTsdk = true,
              experimental = {
                completion = { enableServerSideFuzzyMatch = true },
              },
            },
            ["js/ts"] = {
              implicitProjectConfig = {
                module = "ESNext",
                target = "ES2022",
                checkJs = false,
                allowJs = true,
              },
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

        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "standard",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace", -- "openFilesOnly",
              },
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
        float = false,
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
