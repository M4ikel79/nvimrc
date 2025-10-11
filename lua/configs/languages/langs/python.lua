-- lua/configs/languages/langs/python.lua
-- Complete Python language support configuration
-- Just create a file like this for any language you want to add!

return {
  -- Required: Language name
  name = "python",

  -- Required: File types this config applies to
  filetypes = { "python" },

  -- LSP Configuration
  lsp = {
    server = "pyright",
    settings = {
      python = {
        analysis = {
          typeCheckingMode = "basic",
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
          diagnosticMode = "workspace",
        },
      },
    },
  },

  -- Formatters (will be auto-configured in conform.nvim)
  formatters = { "black", "isort" },

  -- Linters (will be auto-configured in nvim-lint)
  linters = { "ruff" },

  -- DAP (Debug Adapter Protocol) configuration
  dap = {
    adapter = "debugpy",
    config = function()
      local dap = require "dap"
      dap.adapters.python = {
        type = "executable",
        command = "python",
        args = { "-m", "debugpy.adapter" },
      }

      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          pythonPath = function()
            local venv = os.getenv "VIRTUAL_ENV"
            if venv then
              return venv .. "/bin/python"
            end
            return "/usr/bin/python3"
          end,
        },
      }
    end,
  },

  -- Snippets (LuaSnip format)
  snippets = {
    require("luasnip").snippet("def", {
      require("luasnip").text_node "def ",
      require("luasnip").insert_node(1, "function_name"),
      require("luasnip").text_node "(",
      require("luasnip").insert_node(2, "args"),
      require("luasnip").text_node "):",
      require("luasnip").text_node { "", "    " },
      require("luasnip").insert_node(0),
    }),
  },

  -- FileType-specific autocmds
  autocmds = {
    {
      desc = "Set Python-specific options",
      callback = function()
        vim.opt_local.textwidth = 88
        vim.opt_local.colorcolumn = "88"
        vim.opt_local.expandtab = true
        vim.opt_local.shiftwidth = 4
        vim.opt_local.tabstop = 4
      end,
    },
  },

  -- FileType-specific keymaps
  keymaps = {
    {
      mode = "n",
      lhs = "<leader>rp",
      rhs = function()
        require("nvchad.term").send("python " .. vim.fn.expand "%", "horizontal")
      end,
      opts = { desc = "Run Python file" },
    },
    {
      mode = "n",
      lhs = "<leader>rt",
      rhs = function()
        require("nvchad.term").send("pytest", "horizontal")
      end,
      opts = { desc = "Run pytest" },
    },
    {
      mode = "n",
      lhs = "<leader>ri",
      rhs = function()
        require("nvchad.term").toggle { pos = "float", cmd = "ipython", id = "ipython" }
      end,
      opts = { desc = "Launch IPython REPL" },
    },
  },

  -- Additional options
  options = {
    -- Custom options for this language
    use_virtual_env = true,
    prefer_poetry = false,
  },
}
