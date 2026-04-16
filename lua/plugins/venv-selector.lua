return {
  {
    "linux-cultist/venv-selector.nvim",
    opts = {
      -- Look for venvs in these local directories first
      search_venv_managers = false, -- Set to false to avoid global searches if preferred
      name = { "venv", ".venv", "env", ".env" },
    },
  },
}
