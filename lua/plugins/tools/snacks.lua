-- lua/plugins/snacks.lua
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    indent = { enabled = true },
    input = { enabled = true },
    terminal = {
      enabled = true,
      win = { style = "terminal" },
      shell = { "bash" },
    },
    words = { enabled = true },
  },
}
