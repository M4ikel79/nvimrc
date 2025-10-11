-- Complete setup for copilot.lua + blink.cmp integration
return {
  -- 1. Copilot.lua - Main plugin
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    dependencies = {
      "copilotlsp-nvim/copilot-lsp", -- For NES functionality
    },
    opts = {
      panel = {
        enabled = true,
        auto_refresh = true,
        keymap = {
          jump_prev = "[[",
          jump_next = "]]",
          accept = "<CR>",
          refresh = "gr",
          open = "<M-CR>",
        },
        layout = {
          position = "bottom",
          ratio = 0.4,
        },
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = true,
        debounce = 75,
        trigger_on_accept = true,
        keymap = {
          accept = "<Tab>",
          accept_word = "<C-Right>",
          accept_line = "<C-l>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      nes = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept_and_goto = "<C-y>",
          accept = false,
          dismiss = "<Esc>",
        },
      },
      filetypes = {
        yaml = true,
        markdown = true,
        help = false,
        gitcommit = true,
        gitrebase = false,
        ["."] = false,
        ["*"] = true,
      },
      server_opts_overrides = {
        trace = "verbose",
        settings = {
          advanced = {
            listCount = 10,
            inlineSuggestCount = 5,
          },
        },
      },
    },
    config = function(_, opts)
      require("copilot").setup(opts)

      -- Hide copilot suggestions when blink.cmp menu is open
      vim.api.nvim_create_autocmd("User", {
        pattern = "BlinkCmpMenuOpen",
        callback = function()
          vim.b.copilot_suggestion_hidden = true
        end,
      })

      vim.api.nvim_create_autocmd("User", {
        pattern = "BlinkCmpMenuClose",
        callback = function()
          vim.b.copilot_suggestion_hidden = false
        end,
      })

      -- Useful keymaps
      local keymap = vim.keymap.set
      keymap("n", "<leader>cp", function()
        require("copilot.panel").toggle()
      end, { desc = "Copilot Panel" })

      keymap("n", "<leader>cr", function()
        require("copilot.panel").refresh()
      end, { desc = "Copilot Refresh" })

      keymap("n", "<leader>ct", function()
        require("copilot.suggestion").toggle_auto_trigger()
        vim.notify("Copilot auto-trigger toggled", vim.log.levels.INFO)
      end, { desc = "Copilot Toggle Auto" })

      keymap("i", "<C-Space>", function()
        require("copilot.suggestion").next()
      end, { desc = "Copilot Trigger" })
    end,
  },

  -- 2. Blink-cmp Copilot integration
  {
    "giuxtaposition/blink-cmp-copilot",
    dependencies = {
      "zbirenbaum/copilot.lua",
    },
    opts = {},
  },

  -- 3. Blink.cmp configuration (example)
  {
    "saghen/blink.cmp",
    dependencies = {
      "rafamadriz/friendly-snippets",
      "giuxtaposition/blink-cmp-copilot",
    },
    version = "v0.*",
    opts = {
      keymap = {
        preset = "default",
        ["<Tab>"] = {
          function(cmp)
            if cmp.snippet_active() then
              return cmp.accept()
            else
              return cmp.select_and_accept()
            end
          end,
          "snippet_forward",
          "fallback",
        },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },
        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback" },
        ["<C-n>"] = { "select_next", "fallback" },
        ["<C-u>"] = { "scroll_documentation_up", "fallback" },
        ["<C-d>"] = { "scroll_documentation_down", "fallback" },
        ["<C-e>"] = { "hide", "fallback" },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "copilot" },
        cmdline = {},
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-cmp-copilot",
            score_offset = 100,
            async = true,
            transform_items = function(_, items)
              local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
              local kind_idx = #CompletionItemKind + 1
              CompletionItemKind[kind_idx] = "Copilot"
              for _, item in ipairs(items) do
                item.kind = kind_idx
              end
              return items
            end,
          },
        },
      },
      completion = {
        accept = {
          auto_brackets = {
            enabled = true,
          },
        },
        menu = {
          draw = {
            treesitter = { "lsp" },
            columns = {
              { "kind_icon" },
              { "label", "label_description", gap = 1 },
              { "kind" },
            },
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
        ghost_text = {
          enabled = false, -- Disable to avoid conflict with copilot
        },
      },
      signature = { enabled = true },
    },
  },
}
