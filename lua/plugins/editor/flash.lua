return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
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
      char = {
        enabled = true,
        keys = { "f", "F", "t", "T", ";", "," },
        jump_labels = false,
      },
    },
  },
}
