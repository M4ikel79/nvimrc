return {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {
    -- LazyVim default options
    labels = "asdfghjklqwertyuiopzxcvbnm",
    search = {
      multi_window = true,
      forward = true,
      wrap = true,
    },
    jump = {
      jumplist = true,
      pos = "start",
      autojump = false,
    },
    label = {
      uppercase = false,
      after = true,
      before = false,
      style = "overlay",
    },
    modes = {
      -- LazyVim uses these defaults
      char = {
        enabled = true,
        keys = { "f", "F", "t", "T", ";", "," },
        jump_labels = false,
      },
    },
  },
}
