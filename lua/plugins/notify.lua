-- lua/plugins/nvim_notify.lua
return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",

  opts = {
    -- Animation style
    stages = "fade_in_slide_out", -- fade_in_slide_out, fade, slide, static

    -- How long notifications stay
    timeout = 5000, -- 5 seconds

    -- Background color
    background_colour = "#1e222a",

    -- Minimum notification width
    minimum_width = 30,
    winblend = 10,
    -- Icons for different levels
    icons = {
      ERROR = "",
      WARN = "",
      INFO = "",
      DEBUG = "",
      TRACE = "✎",
    },

    -- Render style
    render = "compact", -- default, minimal, simple, compact

    -- Notification position
    top_down = true, -- false = bottom-up

    -- Merge duplicate notifications
    merge_duplicates = true,
  },
  config = function(_, opts)
    local notify = require "notify"
    notify.setup(opts)

    -- Set as default notify function
    vim.notify = notify
  end,
}
