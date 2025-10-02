return {
  "echasnovski/mini.nvim",
  version = false,
  event = "VimEnter",
  config = function()
    require("mini.cursorword").setup {
      delay = 50, -- faster highlight
      silent = true, -- don’t show errors if highlight groups are missing
    }
    require("mini.indentscope").setup {
      draw = {
        delay = 5, -- Delay (in ms) between event and start of drawing scope indicator
        priority = 2,
        animation = require("mini.indentscope").gen_animation.linear {
          duration = 30, -- Duration of animation in ms (lower = faster)
          unit = "total", -- Can be 'step' or 'total'
        },
      },
      options = { try_as_border = true },
      symbol = "│", -- This is the vertical line character
    }
    require("mini.surround").setup {
      mappings = {
        add = "gsa",
        delete = "gsd",
        find = "gsf",
        find_left = "gsF",
        highlight = "gsh",
        replace = "gsr",
        update_n_lines = "gsn",
      },
    }
    require("mini.move").setup {
      mappings = {
        -- Move visual selection
        left = "<S-h>", -- Shift+h
        right = "<S-l>", -- Shift+l
        down = "<S-j>", -- Shift+j
        up = "<S-k>", -- Shift+k

        -- Move current line in Normal mode
        line_left = "<S-h>",
        line_right = "<S-l>",
        line_down = "<S-j>",
        line_up = "<S-k>",
      },
    }
    require("mini.align").setup()
    require("mini.ai").setup()
    require("mini.splitjoin").setup() -- gS to split/join
  end,
}
