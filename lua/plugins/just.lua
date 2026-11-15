return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        just = {},
      },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "just",
        callback = function()
          vim.opt_local.tabstop = 4
          vim.opt_local.shiftwidth = 4
          vim.opt_local.softtabstop = 4
          vim.opt_local.expandtab = true
        end,
      })
    end,
  },
}
