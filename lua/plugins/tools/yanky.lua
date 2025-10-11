return {
  "gbprod/yanky.nvim",
  event = "VeryLazy",
  dependencies = {
    { "kkharji/sqlite.lua" }, -- For persistent history across sessions
  },
  opts = {
    ring = {
      history_length = 100,
      storage = "sqlite", -- Persist history between Neovim sessions
      storage_path = vim.fn.stdpath "data" .. "/databases/yanky.db",
      sync_with_numbered_registers = true,
      cancel_event = "update",
      ignore_registers = { "_" },
      update_register_on_cycle = false,
    },
    picker = {
      select = {
        action = nil, -- Use default put action
      },
      telescope = {
        use_default_mappings = true,
      },
    },
    system_clipboard = {
      sync_with_ring = true, -- Sync with system clipboard automatically
    },
    highlight = {
      on_put = true, -- Highlight text when pasting
      on_yank = true, -- Highlight text when yanking
      timer = 500, -- Duration of highlight in ms
    },
    preserve_cursor_position = {
      enabled = true, -- Keep cursor position when yanking
    },
    textobj = {
      enabled = true, -- Enable text object for last put text
    },
  },
  keys = {
    -- Yank history picker
    {
      "<leader>p",
      "<cmd>YankyRingHistory<cr>",
      mode = { "n", "x" },
      desc = "Open Yank History",
    },

    -- Yank with cursor position preservation
    { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank text" },

    -- Basic put operations
    { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put after cursor" },
    { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put before cursor" },
    { "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "Put after and move cursor" },
    { "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "Put before and move cursor" },

    -- Cycle through yank history
    -- { "<c-p>", "<Plug>(YankyPreviousEntry)", desc = "Cycle to previous yank" },
    -- { "<c-n>", "<Plug>(YankyNextEntry)", desc = "Cycle to next yank" },

    -- Linewise put operations (vim-unimpaired style)
    { "]p", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
    { "[p", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
    { "]P", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
    { "[P", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },

    -- Shift-indent operations
    { ">p", "<Plug>(YankyPutIndentAfterShiftRight)", desc = "Put and indent right" },
    { "<p", "<Plug>(YankyPutIndentAfterShiftLeft)", desc = "Put and indent left" },
    { ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Put before and indent right" },
    { "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)", desc = "Put before and indent left" },

    -- Filter operations
    { "=p", "<Plug>(YankyPutAfterFilter)", desc = "Put after applying a filter" },
    { "=P", "<Plug>(YankyPutBeforeFilter)", desc = "Put before applying a filter" },

    -- Text object for last put
    {
      "iy",
      function()
        require("yanky.textobj").last_put()
      end,
      mode = { "o", "x" },
      desc = "Last put text object",
    },
  },
}
