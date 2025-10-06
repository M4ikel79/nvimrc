-- lua/menus/code.lua
-- Code actions, LSP, formatting, and debugging menu

return {
  -- ============================================================================
  -- LSP Navigation
  -- ============================================================================
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
    name = " Go to Implementation",
    cmd = vim.lsp.buf.implementation,
    rtxt = "gi",
  },
  {
    name = " Go to Type Definition",
    cmd = vim.lsp.buf.type_definition,
    rtxt = "gt",
  },
  {
    name = " Show References",
    cmd = "Telescope lsp_references",
    rtxt = "gr",
  },

  { name = "separator" },

  -- ============================================================================
  -- Code Actions
  -- ============================================================================
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
      require("conform").format { async = true, lsp_fallback = true }
    end,
    rtxt = "<leader>cf",
  },
  {
    name = " Hover Documentation",
    cmd = vim.lsp.buf.hover,
    rtxt = "K",
  },
  {
    name = " Signature Help",
    cmd = vim.lsp.buf.signature_help,
    rtxt = "<C-k>",
  },

  { name = "separator" },

  -- ============================================================================
  -- Diagnostics
  -- ============================================================================
  {
    name = " Diagnostics",
    items = {
      {
        name = "Show Diagnostics (Trouble)",
        cmd = "Trouble diagnostics toggle",
        rtxt = "<leader>xx",
      },
      {
        name = "Buffer Diagnostics",
        cmd = "Trouble diagnostics toggle filter.buf=0",
        rtxt = "<leader>xX",
      },
      {
        name = "Next Diagnostic",
        cmd = vim.diagnostic.goto_next,
        rtxt = "]d",
      },
      {
        name = "Previous Diagnostic",
        cmd = vim.diagnostic.goto_prev,
        rtxt = "[d",
      },
      {
        name = "Show Diagnostic Float",
        cmd = vim.diagnostic.open_float,
        rtxt = "<leader>e",
      },
    },
  },

  { name = "separator" },

  -- ============================================================================
  -- Symbols & Structure
  -- ============================================================================
  {
    name = " Document Symbols",
    cmd = "Telescope lsp_document_symbols",
    rtxt = "<leader>cs",
  },
  {
    name = " Workspace Symbols",
    cmd = "Telescope lsp_workspace_symbols",
    rtxt = "<leader>cS",
  },
  {
    name = " Treesitter Symbols",
    cmd = "Telescope treesitter",
    rtxt = "<leader>fp",
  },

  { name = "separator" },

  -- ============================================================================
  -- Debugging (DAP)
  -- ============================================================================
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
      {
        name = " Step Out",
        cmd = function()
          require("dap").step_out()
        end,
        rtxt = "<leader>dO",
      },
      {
        name = " Toggle UI",
        cmd = function()
          require("dapui").toggle()
        end,
        rtxt = "<leader>du",
      },
      {
        name = " Terminate",
        cmd = function()
          require("dap").terminate()
        end,
        rtxt = "<leader>dt",
      },
    },
  },

  { name = "separator" },

  -- ============================================================================
  -- Todo Comments
  -- ============================================================================
  {
    name = " Todo Comments",
    cmd = "TodoTelescope",
    rtxt = "<leader>st",
  },
  {
    name = " Next Todo",
    cmd = function()
      require("todo-comments").jump_next()
    end,
    rtxt = "]t",
  },
  {
    name = " Previous Todo",
    cmd = function()
      require("todo-comments").jump_prev()
    end,
    rtxt = "[t",
  },

  { name = "separator" },

  -- ============================================================================
  -- AI Assistant
  -- ============================================================================
  {
    name = " AI Actions",
    hl = "ExPurple",
    items = {
      {
        name = "Code Actions",
        cmd = "CodeCompanionActions",
        rtxt = "<leader>aa",
      },
      {
        name = "Toggle Chat",
        cmd = "CodeCompanionChat Toggle",
        rtxt = "<leader>ac",
      },
      {
        name = "Inline AI",
        cmd = "CodeCompanion",
        rtxt = "<leader>ai",
      },
      {
        name = "Explain Code",
        cmd = function()
          vim.cmd "CodeCompanionChat"
          vim.defer_fn(function()
            vim.api.nvim_feedkeys("Explain this code", "n", false)
          end, 100)
        end,
        rtxt = "<leader>ae",
      },
      {
        name = "Fix Code",
        cmd = function()
          vim.cmd "CodeCompanionChat"
          vim.defer_fn(function()
            vim.api.nvim_feedkeys("Fix this code", "n", false)
          end, 100)
        end,
        rtxt = "<leader>af",
      },
      {
        name = "Optimize Code",
        cmd = function()
          vim.cmd "CodeCompanionChat"
          vim.defer_fn(function()
            vim.api.nvim_feedkeys("Optimize this code", "n", false)
          end, 100)
        end,
        rtxt = "<leader>ao",
      },
    },
  },

  { name = "separator" },

  -- ============================================================================
  -- LSP Management
  -- ============================================================================
  {
    name = " LSP Info",
    cmd = "LspInfo",
    rtxt = "<leader>li",
  },
  {
    name = " LSP Restart",
    cmd = "LspRestart",
    rtxt = "<leader>lr",
  },
  {
    name = " Conform Info",
    cmd = "ConformInfo",
    rtxt = "<leader>lf",
  },
}
