return {
  -- Zen Mode plugin
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      window = {
        backdrop = 0.95,
        width = 120,
        height = 1,
        options = {
          signcolumn = "no",
          number = false,
          relativenumber = false,
          cursorline = false,
          cursorcolumn = false,
          foldcolumn = "0",
          list = false,
        },
      },
      plugins = {
        options = {
          enabled = true,
          ruler = false,
          showcmd = false,
          laststatus = 0,
        },
        twilight = { enabled = true }, -- Enable Twilight integration
        gitsigns = { enabled = false },
        tmux = { enabled = false },
        -- Enable terminal integration if you use these:
        -- kitty = { enabled = true, font = "+4" },
        -- alacritty = { enabled = true, font = "14" },
        -- wezterm = { enabled = true, font = "+4" },
      },
      on_open = function(win)
        -- Optional: Add custom code when Zen mode opens
      end,
      on_close = function()
        -- Optional: Add custom code when Zen mode closes
      end,
    },
  },

  -- Twilight plugin for dimming
  {
    "folke/twilight.nvim",
    opts = {
      dimming = {
        alpha = 0.25, -- Amount of dimming
        color = { "Normal", "#ffffff" },
        term_bg = "#000000",
        inactive = false,
      },
      context = 10, -- Amount of lines to show around the cursor
      treesitter = true,
      expand = {
        "function",
        "method",
        "table",
        "if_statement",
      },
      exclude = {},
    },
  },
}
