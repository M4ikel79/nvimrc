return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "html-lsp",
        "css-lsp",
        "emmet-ls", -- Add this
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
    import = "nvchad.blink.lazyspec",
    opts = {
      sources = {
        default = { "lazydev", "lsp", "path", "snippets", "buffer" }, -- Add lazydev first
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100, -- Make lazydev completions top priority
          },
        },
      },
    },
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
        "yaml", -- Add this
        "json", -- Recommended
        "markdown", -- Recommended
        "markdown_inline", -- For markdown code blocks
        "bash", -- Recommended
        "python", -- If you use Python
        "javascript", -- If you use JS
        "typescript", -- If you use TS
      },
    },
  },
  -- lua/plugins/treesitter_context.lua
  "nvim-treesitter/nvim-treesitter-context",
  event = "BufReadPost",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {
    enable = true, -- Enable this plugin (can be false to disable)

    -- How many lines of context to show
    max_lines = 3, -- 0 = no limit

    -- Minimum height of editor window to show context
    min_window_height = 20,

    -- Line numbers in context area
    line_numbers = true,

    -- Maximum number of lines to show for a single context
    multiline_threshold = 5,

    -- Which context lines to discard if max_lines is exceeded
    -- 'inner' or 'outer'
    trim_scope = "outer",

    -- Line used to calculate context
    -- 'cursor' or 'topline'
    mode = "cursor",

    -- Separator between context and content
    -- false, "single", "double", or string
    separator = nil,

    -- Z-index of the context window
    zindex = 20,

    -- Callback on attach
    on_attach = nil,
  },
  config = function(_, opts)
    require("treesitter-context").setup(opts)

    -- Custom highlight for context
    vim.api.nvim_set_hl(0, "TreesitterContext", { link = "Normal" })
    vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { link = "LineNr" })
    vim.api.nvim_set_hl(0, "TreesitterContextBottom", { link = "Normal" })

    -- Optional: Add separator
    -- vim.api.nvim_set_hl(0, "TreesitterContextSeparator", { fg = "#44475a" })
  end,
}
