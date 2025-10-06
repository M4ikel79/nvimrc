-- ============================================================================
-- FILE: lua/menus/code.lua
-- DESCRIPTION: LSP and code-related actions menu
-- ============================================================================

return {
  -- LSP Navigation
  {
    name = " Go to Definition",
    cmd = vim.lsp.buf.definition,
    rtxt = "gd",
  },
  {
    name = " Go to Declaration",
    cmd = vim.lsp.buf.declaration,
    rtxt = "gD",
  },
  {
    name = " Show References",
    cmd = "Telescope lsp_references",
    rtxt = "gr",
  },

  { name = "separator" },

  -- Code Actions
  {
    name = "󰌵 Code Action",
    cmd = vim.lsp.buf.code_action,
    rtxt = "<leader>ca",
  },
  {
    name = " Rename Symbol",
    cmd = vim.lsp.buf.rename,
    rtxt = "<leader>cr",
  },
  {
    name = " Format Buffer",
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
  {
    name = " Hover Documentation",
    cmd = vim.lsp.buf.hover,
    rtxt = "K",
  },

  { name = "separator" },

  -- Diagnostics
  {
    name = " Show Diagnostics",
    cmd = "Trouble diagnostics toggle",
    rtxt = "<leader>xx",
  },
  {
    name = " Next Diagnostic",
    cmd = vim.diagnostic.goto_next,
    rtxt = "]d",
  },
  {
    name = " Previous Diagnostic",
    cmd = vim.diagnostic.goto_prev,
    rtxt = "[d",
  },

  { name = "separator" },

  -- Debugging
  {
    name = " Debug",
    hl = "ExRed",
    items = {
      {
        name = " Continue/Start",
        cmd = function()
          require("dap").continue()
        end,
        rtxt = "<leader>dc",
      },
      {
        name = " Toggle Breakpoint",
        cmd = function()
          require("dap").toggle_breakpoint()
        end,
        rtxt = "<leader>db",
      },
      {
        name = " Step Into",
        cmd = function()
          require("dap").step_into()
        end,
        rtxt = "<leader>di",
      },
      {
        name = " Step Over",
        cmd = function()
          require("dap").step_over()
        end,
        rtxt = "<leader>do",
      },
    },
  },
}
