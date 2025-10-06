-- lua/plugins/markdown.lua
return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown", "quarto", "codecompanion" },
  opts = {
    file_types = { "markdown", "quarto", "codecompanion" },
  },
  config = function(_, opts)
    require("render-markdown").setup(opts)
  end,
}
