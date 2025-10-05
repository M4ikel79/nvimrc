-- lua/plugins/paint.lua
return {
  "folke/paint.nvim",
  event = "VeryLazy",
  opts = {
    highlights = {
      {
        filter = { filetype = "lua" },
        pattern = "%s*%-%-%-%s*(@%w+)",
        hl = "Constant",
      },
      {
        filter = {},
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
