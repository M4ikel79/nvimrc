-- lua/plugins/which-key.lua
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
    delay = function(ctx)
      return ctx.plugin and 0 or 200
    end,
    filter = function(mapping)
      return true
    end,
    spec = {},
    notify = true,
    triggers = {
      { "<auto>", mode = "nxso" },
      { "<leader>", mode = { "n", "v" } },
      { "<c-w>", mode = "n" },
      { "<c-r>", mode = "i" },
      { "g", mode = { "n", "v" } },
      { "z", mode = { "n", "v" } },
      { "[", mode = "n" },
      { "]", mode = "n" },
      { '"', mode = { "n", "v" } },
      { "'", mode = { "n", "v" } },
      { "`", mode = { "n", "v" } },
    },
    defer = function(ctx)
      return ctx.mode == "V" or ctx.mode == "<C-V>"
    end,
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = true,
        motions = true,
        text_objects = true,
        windows = true,
        nav = true,
        z = true,
        g = true,
      },
    },
    win = {
      no_overlap = true,
      border = "none",
      title = true,
      title_pos = "center",
      zindex = 1000,
      bo = {},
      wo = {},
    },
    layout = {
      width = { min = 15 },
      spacing = 1,
    },
    keys = {
      scroll_down = "<c-d>",
      scroll_up = "<c-u>",
    },
    sort = { "local", "order", "group", "alphanum", "mod" },
    expand = 0,
    replace = {
      key = {
        function(key)
          return require("which-key.view").format(key)
        end,
      },
      desc = {
        { "<Plug>%(?(.*)%)?", "%1" },
        { "^%+", "" },
        { "<[cC]md>", "" },
        { "<[cC][rR]>", "" },
        { "<[sS]ilent>", "" },
        { "^lua%s+", "" },
        { "^call%s+", "" },
        { "^:%s*", "" },
      },
    },
    icons = {
      breadcrumb = "»",
      separator = "➜",
      group = "+",
      ellipsis = "…",
      mappings = true,
      rules = {},
      colors = true,
      keys = {
        Up = " ",
        Down = " ",
        Left = " ",
        Right = " ",
        C = "󰘴 ",
        M = "󰘵 ",
        D = "󰘳 ",
        S = "󰘶 ",
        CR = "󰌑 ",
        Esc = "󱊷 ",
        ScrollWheelDown = "󱕐 ",
        ScrollWheelUp = "󱕑 ",
        NL = "󰌑 ",
        BS = "󰁮",
        Space = "󱁐 ",
        Tab = "󰌒 ",
      },
    },
    show_help = true,
    show_keys = true,
    disable = {
      ft = {},
      bt = {},
    },
  },
}
