-- File: ~/.config/nvim/lua/plugins/twilight.lua
return {
  "folke/twilight.nvim",
  cmd = "Twilight",
  opts = {
    dimming = {
      alpha = 0.25, -- 0 fully transparent, 1 fully opaque
      color = { "Normal", "#ffffff" },
      inactive = true, -- dim *other* windows too
    },
    context = 10, -- show 10 lines around cursor
    treesitter = true,
    expand = { -- expand more text around cursor
      "function",
      "method",
      "table",
      "if_statement",
    },
  },
}
