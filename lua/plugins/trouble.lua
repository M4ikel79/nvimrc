return {
  "folke/trouble.nvim",
  version = "v1.*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function()
        require("todo-comments").setup {}
      end,
    },
  },
  cmd = { "Trouble", "TodoTrouble", "TodoTelescope" },
  opts = {
    position = "bottom", -- bottom, top, left, right
    height = 10, -- height of the trouble list when position is top or bottom
    width = 50, -- width of the list when position is left or right
    icons = true,
    mode = "document_diagnostics", -- default mode
    fold_open = "", -- icon for open folds
    fold_closed = "", -- icon for closed folds
    group = true, -- group results by file
    padding = true,
    action_keys = { -- key mappings for Trouble buffer
      close = "q",
      cancel = "<esc>",
      refresh = "r",
      jump = { "<cr>", "<tab>" },
    },
  },
}
