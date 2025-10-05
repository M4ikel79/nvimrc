return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- LSP servers
        "html-lsp",
        "css-lsp",
        "emmet-ls",
        "rust-analyzer",
        "lua-language-server",
        "jdtls",
        "typescript-language-server",
        "pyright",
        -- Formatters
        "stylua",
        "black",
        "isort",
        "prettier",
        "prettierd",
        "rustfmt",
        "google-java-format",
        "shfmt",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "yaml",
        "markdown",
        "markdown_inline",
        "bash",
        "python",
        "rust",
        "java",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPost",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      enable = true,
      max_lines = 3,
      min_window_height = 20,
      line_numbers = true,
      multiline_threshold = 5,
      trim_scope = "outer",
      mode = "cursor",
      separator = nil,
      zindex = 20,
      on_attach = nil,
    },
    config = function(_, opts)
      require("treesitter-context").setup(opts)
      vim.api.nvim_set_hl(0, "TreesitterContext", { link = "Normal" })
      vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { link = "LineNr" })
      vim.api.nvim_set_hl(0, "TreesitterContextBottom", { link = "Normal" })
    end,
  },

  -- REQUIRED PLUGINS
  { import = "plugins.coding" },
  { import = "plugins.editor" },
  { import = "plugins.tools" },
  { import = "plugins.ui" },
}
