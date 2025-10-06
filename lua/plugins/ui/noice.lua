-- lua/plugins/noice.lua
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  opts = {
    lsp = {
      progress = { enabled = false },
      hover = { enabled = true },
      signature = {
        enabled = true,
        auto_open = {
          enabled = true,
          trigger = true,
          luasnip = true,
          throttle = 50,
        },
      },
      message = { enabled = true },
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
      },
    },
    presets = {
      bottom_search = false,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = true,
    },
    messages = {
      enabled = true,
      view = "notify",
      view_error = "notify",
      view_warn = "notify",
      view_history = "messages",
      view_search = "virtualtext",
    },
    cmdline = {
      enabled = true,
      view = "cmdline_popup",
      opts = {},
      format = {
        cmdline = { pattern = "^:", icon = " ", lang = "vim", title = "{ 󰕷 }" },
        search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex", title = "{  }" },
        search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex", title = "{  }" },
        filter = { pattern = "^:%s*!", icon = "$", lang = "bash", title = "{ #! }" },
        lua = {
          pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" },
          icon = "󰢱 ",
          lang = "lua",
          title = "{  }",
        },
        help = { pattern = "^:%s*he?l?p?%s+", icon = "󰋖 ", title = "{  }" },
        input = {},
      },
    },
    popupmenu = {
      enabled = true,
      backend = "nui",
      kind_icons = {},
    },
    notify = {
      enabled = true,
      view = "notify",
    },
    views = {
      cmdline_popup = {
        position = { row = 1, col = "50%" },
        size = { width = 60, height = "auto" },
        border = { style = "rounded", padding = { 0, 1 } },
        win_options = {
          winhighlight = "Normal:Normal,FloatBorder:DiagnosticInfo",
        },
      },
      popupmenu = {
        relative = "editor",
        position = { row = 8, col = "50%" },
        size = { width = 60, height = 10 },
        border = { style = "rounded", padding = { 0, 1 } },
        win_options = {
          winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
        },
      },
    },
    routes = {
      {
        filter = { event = "msg_show", kind = "", find = "written" },
        opts = { skip = true },
      },
      {
        filter = { event = "msg_show", kind = "", find = "more line" },
        opts = { skip = true },
      },
      {
        filter = { event = "msg_show", kind = "", find = "fewer line" },
        opts = { skip = true },
      },
    },
  },
}
