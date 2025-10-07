-- FILE: lua/menus/code.lua
-- Programming-focused menu (Python, Lua, Rust, Go, Java)

return {
  -- LSP essentials
  {
    name = "󰌵 Code Action",
    cmd = vim.lsp.buf.code_action,
    rtxt = "<leader>ca",
  },
  {
    name = " Rename Symbol",
    cmd = vim.lsp.buf.rename,
    rtxt = "<leader>rn",
  },
  {
    name = " Format",
    cmd = function()
      require("conform").format { async = true, lsp_fallback = true }
    end,
    rtxt = "<leader>fm",
  },

  { name = "separator" },

  -- Quick navigation
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
  {
    name = " Symbols",
    cmd = "Telescope lsp_document_symbols",
    rtxt = "<leader>ds",
  },

  { name = "separator" },

  -- Diagnostics
  {
    name = " Show Diagnostics",
    cmd = "Trouble diagnostics toggle",
    rtxt = "<leader>td",
  },
  {
    name = " Next Issue",
    cmd = vim.diagnostic.goto_next,
    rtxt = "]d",
  },
  {
    name = " Previous Issue",
    cmd = vim.diagnostic.goto_prev,
    rtxt = "[d",
  },

  { name = "separator" },

  -- Run & Debug
  {
    name = " Run File",
    cmd = function()
      local runners = {
        python = "python3 %",
        lua = "lua %",
        javascript = "node %",
        typescript = "ts-node %",
        rust = "cargo run",
        go = "go run %",
        java = "javac % && java %:t:r",
      }
      local ft = vim.bo.filetype
      local cmd = runners[ft]
      if cmd then
        cmd = cmd:gsub("%%", vim.fn.expand "%:p")
        require("nvchad.term").send(cmd, "horizontal")
      end
    end,
    rtxt = "<F5>",
  },
  {
    name = " Debug",
    items = {
      {
        name = " Start/Continue",
        cmd = function()
          require("dap").continue()
        end,
        rtxt = "<F9>",
      },
      {
        name = " Toggle Breakpoint",
        cmd = function()
          require("dap").toggle_breakpoint()
        end,
        rtxt = "<F10>",
      },
      {
        name = " Step Over",
        cmd = function()
          require("dap").step_over()
        end,
        rtxt = "<F11>",
      },
      {
        name = " Step Into",
        cmd = function()
          require("dap").step_into()
        end,
        rtxt = "<F12>",
      },
    },
  },

  { name = "separator" },

  -- AI assistance
  {
    name = " AI Assistant",
    items = {
      {
        name = "Explain Code",
        cmd = "CodeCompanionChat",
      },
      {
        name = "Fix Issues",
        cmd = function()
          vim.cmd "CodeCompanionChat"
          vim.defer_fn(function()
            vim.api.nvim_feedkeys("Fix the issues in this code", "n", false)
          end, 100)
        end,
      },
      {
        name = "Add Documentation",
        cmd = function()
          vim.cmd "CodeCompanionChat"
          vim.defer_fn(function()
            vim.api.nvim_feedkeys("Add documentation to this code", "n", false)
          end, 100)
        end,
      },
    },
  },
}
