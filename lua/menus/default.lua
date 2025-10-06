-- ============================================================================
-- FILE: lua/menus/default.lua
-- DESCRIPTION: Default context menu (right-click fallback)
-- ============================================================================

return {
  {
    name = "󰌵 Code Action",
    cmd = vim.lsp.buf.code_action,
    rtxt = "<leader>ca",
  },
  {
    name = " Rename",
    cmd = vim.lsp.buf.rename,
    rtxt = "<leader>cr",
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
    rtxt = "<leader>cf",
  },

  { name = "separator" },

  {
    name = " Go to Definition",
    cmd = vim.lsp.buf.definition,
    rtxt = "gd",
  },
  {
    name = " Show References",
    cmd = "Telescope lsp_references",
    rtxt = "gr",
  },

  { name = "separator" },

  {
    name = " Copy Line",
    cmd = "normal! yy",
    rtxt = "yy",
  },
  {
    name = " Copy Content",
    cmd = "%y+",
    rtxt = "%y+",
  },

  { name = "separator" },

  {
    name = " Find Files",
    cmd = "Telescope find_files",
    rtxt = "<leader>ff",
  },
  {
    name = " Open Terminal",
    cmd = function()
      require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
    end,
    rtxt = "<leader>tf",
  },
}
