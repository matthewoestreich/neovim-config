return {
  "okuuva/auto-save.nvim",
  event = "VeryLazy",
  opts = {
    enabled = true,
    trigger_events = {
      immediate_save = {},
      defer_save = {
        "TextChanged",
        "TextChangedI",
        "TextChangedP",
      },
      cancel_deferred_save = {},
    },
    debounce_delay = 500,

    condition = function(buf)
      return vim.bo[buf].modifiable
    end,
  },

  -------------------------------------------------------------------------
  -- VISUAL FEEDBACK ON SAVE (Snacks notify with fallback)
  -------------------------------------------------------------------------
  config = function(_, opts)
    require("auto-save").setup(opts)

    local function notify(msg)
      -- Try Snacks first
      local ok, snacks = pcall(require, "snacks")
      if ok and snacks.notify then
        snacks.notify(msg, { level = "info", timeout = 700 })
      else
        vim.notify(msg, vim.log.levels.INFO)
      end
    end

    -- Autocmd fired by auto-save.nvim after writing the buffer
    vim.api.nvim_create_autocmd("User", {
      pattern = "AutoSaveWritePost",
      callback = function(ev)
        local buf = ev.data and ev.data.saved_buffer or nil
        if not buf then
          notify("Auto-saved")
          return
        end

        local name = vim.api.nvim_buf_get_name(buf)
        if name == "" then
          name = "[No Name]"
        end
        local rel = vim.fn.fnamemodify(name, ":.")
        notify("Auto-saved: " .. rel)
      end,
    })
  end,
}
