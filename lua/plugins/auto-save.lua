return {
  "okuuva/auto-save.nvim",
  opts = {
    enabled = true,
    trigger_events = {
      immediate_save = { "BufLeave", "FocusLost" },
      defer_save = { "InsertLeave", "TextChanged" },
      cancel_defered_save = { "InsertEnter" },
    },
    debounce_delay = 500,
    condition = function(buf)
      -- only save for modifiable buffers
      return vim.bo[buf].modifiable
    end,
  },
}
