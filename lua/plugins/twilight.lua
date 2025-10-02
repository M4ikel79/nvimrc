return {
  "folke/twilight.nvim",
  cmd = { "Twilight" }, -- load only when you call it
  opts = {
    context = 10,
    dimming = {
      alpha = 0.25,
      inactive = true,
    },
    treesitter = true,
    expand = { "function", "method", "table", "if_statement" },
    exclude = { "help", "dashboard", "NvimTree", "terminal" },
  },
}
