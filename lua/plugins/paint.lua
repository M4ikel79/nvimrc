return {
  "folke/paint.nvim",
  event = "VeryLazy",
  opts = {
    highlights = {
      -- highlight @tags in Lua comments
      {
        filter = { filetype = "lua" },
        pattern = "%s*%-%-%-%s*(@%w+)",
        hl = "Constant",
      },
      -- generic TODO/FIXME/HACK/NOTE for any filetype
      {
        filter = {}, -- applies to all filetypes
        pattern = "%s*TODO",
        hl = "Todo",
      },
      {
        filter = {},
        pattern = "%s*FIXME",
        hl = "Error",
      },
      {
        filter = {},
        pattern = "%s*HACK",
        hl = "WarningMsg",
      },
      {
        filter = {},
        pattern = "%s*NOTE",
        hl = "SpecialComment",
      },
    },
  },
}
