return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown", "quarto", "codecompanion" }, -- Add codecompanion filetype
  opts = {
    -- File types where rendering is enabled
    file_types = { "markdown", "quarto", "codecompanion" },
  },
  config = function(_, opts)
    require("render-markdown").setup(opts)
  end,
}
