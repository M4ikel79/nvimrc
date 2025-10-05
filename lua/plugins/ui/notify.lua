-- lua/plugins/notify.lua
return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  opts = {
    stages = "fade_in_slide_out",
    timeout = 5000,
    background_colour = "#1e222a",
    minimum_width = 30,
    winblend = 10,
    icons = {
      ERROR = " ",
      WARN = " ",
      INFO = " ",
      DEBUG = " ",
      TRACE = " ",
    },
    render = "default",
    top_down = true,
    merge_duplicates = true,
  },
  config = function(_, opts)
    local notify = require "notify"
    notify.setup(opts)
    vim.notify = notify
  end,
}
