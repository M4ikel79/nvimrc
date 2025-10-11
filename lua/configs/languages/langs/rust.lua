-- lua/configs/languages/langs/rust.lua
-- Complete Rust language support configuration

return {
  name = "rust",
  filetypes = { "rust" },

  lsp = {
    server = "rust_analyzer",
    settings = {
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
          loadOutDirsFromCheck = true,
        },
        checkOnSave = {
          command = "clippy",
          extraArgs = { "--all", "--", "-W", "clippy::all" },
        },
        procMacro = {
          enable = true,
        },
      },
    },
  },

  formatters = { "rustfmt" },
  linters = {}, -- rust-analyzer handles linting via clippy

  dap = {
    adapter = "codelldb",
    config = function()
      local dap = require "dap"
      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = vim.fn.stdpath "data" .. "/mason/bin/codelldb",
          args = { "--port", "${port}" },
        },
      }

      dap.configurations.rust = {
        {
          name = "Launch",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }
    end,
  },

  snippets = {
    require("luasnip").snippet("test", {
      require("luasnip").text_node { "#[test]", "fn " },
      require("luasnip").insert_node(1, "test_name"),
      require("luasnip").text_node { "() {", "    " },
      require("luasnip").insert_node(0),
      require("luasnip").text_node { "", "}" },
    }),
  },

  autocmds = {
    {
      desc = "Set Rust-specific options",
      callback = function()
        vim.opt_local.textwidth = 100
        vim.opt_local.colorcolumn = "100"
      end,
    },
  },

  keymaps = {
    {
      mode = "n",
      lhs = "<leader>rb",
      rhs = function()
        require("nvchad.term").send("cargo build", "horizontal")
      end,
      opts = { desc = "Cargo build" },
    },
    {
      mode = "n",
      lhs = "<leader>rr",
      rhs = function()
        require("nvchad.term").send("cargo run", "horizontal")
      end,
      opts = { desc = "Cargo run" },
    },
    {
      mode = "n",
      lhs = "<leader>rt",
      rhs = function()
        require("nvchad.term").send("cargo test", "horizontal")
      end,
      opts = { desc = "Cargo test" },
    },
    {
      mode = "n",
      lhs = "<leader>rc",
      rhs = function()
        require("nvchad.term").send("cargo check", "horizontal")
      end,
      opts = { desc = "Cargo check" },
    },
    {
      mode = "n",
      lhs = "<leader>rC",
      rhs = function()
        require("nvchad.term").send("cargo clippy", "horizontal")
      end,
      opts = { desc = "Cargo clippy" },
    },
  },
}
