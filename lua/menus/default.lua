-- lua/menus/default.lua
-- General-purpose menu for text editing

return {
  -- Essential editing
  {
    name = "󰌵 Code Action",
    cmd = vim.lsp.buf.code_action,
    rtxt = "<leader>ca",
  },
  {
    name = " Rename",
    cmd = vim.lsp.buf.rename,
    rtxt = "<leader>rn",
  },
  {
    name = " Format",
    cmd = function()
      local ok, conform = pcall(require, "conform")
      if ok then
        conform.format { async = true, lsp_fallback = true }
      else
        vim.lsp.buf.format()
      end
    end,
    rtxt = "<leader>fm",
  },

  { name = "separator" },

  -- Navigation
  {
    name = " Definition",
    cmd = vim.lsp.buf.definition,
    rtxt = "gd",
  },
  {
    name = " References",
    cmd = "Telescope lsp_references",
    rtxt = "gr",
  },

  { name = "separator" },

  -- Quick actions
  {
    name = " Find Files",
    cmd = "Telescope find_files",
    rtxt = "<leader>ff",
  },
  {
    name = " Terminal",
    cmd = function()
      require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
    end,
    rtxt = "<C-\\>",
  },
}
