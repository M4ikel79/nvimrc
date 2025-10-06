-- lua/menus/default.lua
-- Default context menu (right-click in normal buffers)

return {
  -- ============================================================================
  -- Quick Actions
  -- ============================================================================
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
  {
    name = " Paste",
    cmd = "normal! p",
    rtxt = "p",
  },

  { name = "separator" },

  -- ============================================================================
  -- Code Actions (if LSP available)
  -- ============================================================================
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
      require("conform").format { async = true, lsp_fallback = true }
    end,
    rtxt = "<leader>cf",
  },

  { name = "separator" },

  -- ============================================================================
  -- Navigation
  -- ============================================================================
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
  {
    name = " Hover",
    cmd = vim.lsp.buf.hover,
    rtxt = "K",
  },

  { name = "separator" },

  -- ============================================================================
  -- Search
  -- ============================================================================
  {
    name = " Find Files",
    cmd = "Telescope find_files",
    rtxt = "<leader>ff",
  },
  {
    name = " Live Grep",
    cmd = "Telescope live_grep",
    rtxt = "<leader>fw",
  },

  { name = "separator" },

  -- ============================================================================
  -- More Actions
  -- ============================================================================
  {
    name = " Open Terminal",
    cmd = function()
      require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
    end,
    rtxt = "<leader>tf",
  },
  {
    name = " Toggle Explorer",
    cmd = "NvimTreeToggle",
    rtxt = "<C-n>",
  },
  {
    name = " Save File",
    cmd = "write",
    rtxt = "<C-s>",
  },
}
