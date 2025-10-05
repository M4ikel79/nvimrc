return {
  "echasnovski/mini.nvim",
  version = false,
  event = "VimEnter",
  config = function()
    require("mini.cursorword").setup {
      delay = 50,
      silent = true,
    }

    require("mini.indentscope").setup {
      draw = {
        delay = 5,
        priority = 2,
        animation = require("mini.indentscope").gen_animation.linear {
          duration = 30,
          unit = "total",
        },
      },
      options = { try_as_border = true },
      symbol = "│",
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
        left = "<S-h>",
        right = "<S-l>",
        down = "<S-j>",
        up = "<S-k>",
        line_left = "<S-h>",
        line_right = "<S-l>",
        line_down = "<S-j>",
        line_up = "<S-k>",
      },
    }

    require("mini.align").setup()
    require("mini.ai").setup()
    require("mini.splitjoin").setup()
  end,
}
