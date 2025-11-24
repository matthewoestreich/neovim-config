return {
  "iamcco/markdown-preview.nvim",
  ft = { "markdown" }, -- only load for markdown files
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  config = function()
    vim.g.mkdp_auto_start = 0 -- do not start automatically
    vim.g.mkdp_auto_close = 1 -- auto-close when leaving buffer
    vim.g.mkdp_refresh_slow = 0 -- speed up refresh
    vim.g.mkdp_open_to_the_world = 0 -- don't allow external access
  end,
}
