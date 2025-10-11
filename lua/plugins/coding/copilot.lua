return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  dependencies = {
    "copilotlsp-nvim/copilot-lsp", -- For NES (Next Edit Suggestion) functionality
  },
  opts = {
    panel = {
      enabled = true,
      auto_refresh = true, -- Auto-refresh suggestions as you type
      keymap = {
        jump_prev = "[[",
        jump_next = "]]",
        accept = "<CR>",
        refresh = "gr",
        open = "<M-CR>", -- Alt+Enter to open panel
      },
      layout = {
        position = "bottom",
        ratio = 0.4,
      },
    },
    suggestion = {
      enabled = true,
      auto_trigger = true, -- Automatically show suggestions
      hide_during_completion = true,
      debounce = 75,
      trigger_on_accept = true,
      keymap = {
        accept = "<Tab>", -- Accept suggestion with Tab
        accept_word = "<C-Right>", -- Accept next word
        accept_line = "<C-l>", -- Accept entire line
        next = "<M-]>", -- Next suggestion
        prev = "<M-[>", -- Previous suggestion
        dismiss = "<C-]>", -- Dismiss suggestion
      },
    },
    nes = {
      enabled = true, -- Enable Next Edit Suggestions
      auto_trigger = true,
      keymap = {
        accept_and_goto = "<C-y>", -- Accept and jump to next edit location
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
      hgcommit = false,
      svn = false,
      cvs = false,
      ["."] = false, -- Disable for files without extension
      ["*"] = true, -- Enable for all other files
    },
    copilot_node_command = "node", -- Use system node
    server_opts_overrides = {
      trace = "verbose",
      settings = {
        advanced = {
          listCount = 10, -- Number of completions for panel
          inlineSuggestCount = 5, -- Number of inline suggestions
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

    -- Keymaps for panel control
    vim.keymap.set("n", "<leader>cp", function()
      require("copilot.panel").toggle()
    end, { desc = "Toggle Copilot Panel" })

    vim.keymap.set("n", "<leader>cr", function()
      require("copilot.panel").refresh()
    end, { desc = "Refresh Copilot Panel" })

    -- Toggle auto-trigger
    vim.keymap.set("n", "<leader>ct", function()
      require("copilot.suggestion").toggle_auto_trigger()
      vim.notify("Copilot auto-trigger toggled", vim.log.levels.INFO)
    end, { desc = "Toggle Copilot Auto-trigger" })

    -- Manual trigger when auto-trigger is off
    vim.keymap.set("i", "<C-Space>", function()
      require("copilot.suggestion").next()
    end, { desc = "Trigger Copilot Suggestion" })
  end,
}
