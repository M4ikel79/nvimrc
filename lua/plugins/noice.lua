return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  opts = {
    -- LSP configuration
    lsp = {
      progress = {
        enabled = true,
      },
      hover = {
        enabled = true,
      },
      signature = {
        enabled = true,
        auto_open = {
          enabled = true,
          trigger = true,
          luasnip = true,
          throttle = 50,
        },
      },
      message = {
        enabled = true,
      },
      -- Override LSP markdown rendering
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
      },
    },

    -- Presets (enable common configurations)
    presets = {
      bottom_search = false, -- Use classic bottom search
      command_palette = true, -- Position cmdline and popupmenu together
      long_message_to_split = true, -- Long messages go to split
      inc_rename = false, -- LSP rename input
      lsp_doc_border = true, -- Add border to hover/signature docs
    },

    -- Messages configuration
    messages = {
      enabled = true,
      view = "notify", -- Default view for messages
      view_error = "notify", -- View for errors
      view_warn = "notify", -- View for warnings
      view_history = "messages", -- View for :messages
      view_search = "virtualtext", -- View for search count
    },

    -- Command line configuration
    cmdline = {
      enabled = true,
      view = "cmdline_popup", -- cmdline_popup or cmdline
      opts = {}, -- Options for cmdline view
      format = {
        cmdline = { pattern = "^:", icon = " ", lang = "vim", title = "{  }" },
        search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex", title = "{  }" },
        search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex", title = "{  }" },
        filter = { pattern = "^:%s*!", icon = "$", lang = "bash", title = "{ #! }" },
        lua = {
          pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" },
          icon = "󰢱 ",
          lang = "lua",
          title = "{  }",
        },
        help = { pattern = "^:%s*he?l?p?%s+", icon = "󰋖 ", title = "{  }" },
        input = {}, -- Used by input()
      },
    },

    -- Popup menu (completion menu)
    popupmenu = {
      enabled = true,
      backend = "nui", -- nui or cmp
      kind_icons = {}, -- Set to false to disable icons
    },

    -- Notifications
    notify = {
      enabled = true,
      view = "notify",
    },

    -- Views configuration
    views = {
      cmdline_popup = {
        position = {
          row = 1,
          col = "50%",
        },
        size = {
          width = 60,
          height = "auto",
        },
        border = {
          style = "rounded",
          padding = { 0, 1 },
        },
        win_options = {
          winhighlight = "Normal:Normal,FloatBorder:DiagnosticInfo",
        },
      },
      popupmenu = {
        relative = "editor",
        position = {
          row = 8,
          col = "50%",
        },
        size = {
          width = 60,
          height = 10,
        },
        border = {
          style = "rounded",
          padding = { 0, 1 },
        },
        win_options = {
          winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
        },
      },
    },

    -- Routes (redirect specific messages)
    routes = {
      {
        filter = {
          event = "msg_show",
          kind = "",
          find = "written",
        },
        opts = { skip = true }, -- Skip "written" messages
      },
      {
        filter = {
          event = "msg_show",
          kind = "",
          find = "more line",
        },
        opts = { skip = true }, -- Skip "X more lines" messages
      },
      {
        filter = {
          event = "msg_show",
          kind = "",
          find = "fewer line",
        },
        opts = { skip = true }, -- Skip "X fewer lines" messages
      },
    },
  },
  keys = {
    {
      "<leader>sn",
      function()
        require("noice").cmd "history"
      end,
      desc = "Noice History",
    },
    {
      "<leader>nl",
      function()
        require("noice").cmd "last"
      end,
      desc = "Noice Last Message",
    },
    {
      "<leader>nd",
      function()
        require("noice").cmd "dismiss"
      end,
      desc = "Dismiss All Notifications",
    },
    {
      "<leader>ne",
      function()
        require("noice").cmd "errors"
      end,
      desc = "Noice Errors",
    },
    {
      "<c-f>",
      function()
        if not require("noice.lsp").scroll(4) then
          return "<c-f>"
        end
      end,
      silent = true,
      expr = true,
      desc = "Scroll Forward (Noice)",
      mode = { "i", "n", "s" },
    },
    {
      "<c-b>",
      function()
        if not require("noice.lsp").scroll(-4) then
          return "<c-b>"
        end
      end,
      silent = true,
      expr = true,
      desc = "Scroll Backward (Noice)",
      mode = { "i", "n", "s" },
    },
  },
}
