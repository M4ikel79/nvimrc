-- lua/menus/main.lua
-- Primary editor menu with LSP, formatting, and core editing actions

return {
  -- LSP Actions (nested submenu)
  {
    name = "󰗝 Lsp Actions",
    hl = "ExBlue",
    items = {
      {
        name = "Goto Definition",
        cmd = vim.lsp.buf.definition,
        rtxt = "gd",
      },
      {
        name = "Goto Declaration",
        cmd = vim.lsp.buf.declaration,
        rtxt = "gD",
      },
      {
        name = "Goto Implementation",
        cmd = vim.lsp.buf.implementation,
        rtxt = "gi",
      },
      {
        name = "Goto Type Definition",
        cmd = vim.lsp.buf.type_definition,
        rtxt = "gt",
      },
      { name = "separator" },
      {
        name = "Show signature help",
        cmd = vim.lsp.buf.signature_help,
        rtxt = "<leader>sh",
      },
      {
        name = "Show References",
        cmd = "Telescope lsp_references",
        rtxt = "gr",
      },
      {
        name = "Document Symbols",
        cmd = "Telescope lsp_document_symbols",
        rtxt = "<leader>cs",
      },
      { name = "separator" },
      {
        name = "Add workspace folder",
        cmd = vim.lsp.buf.add_workspace_folder,
        rtxt = "<leader>wa",
      },
      {
        name = "Remove workspace folder",
        cmd = vim.lsp.buf.remove_workspace_folder,
        rtxt = "<leader>wr",
      },
    },
  },

  { name = "separator" },

  -- Code Actions
  {
    name = "󰌵 Code Actions",
    cmd = vim.lsp.buf.code_action,
    rtxt = "<leader>ca",
  },

  {
    name = " Rename Symbol",
    cmd = vim.lsp.buf.rename,
    rtxt = "<leader>rn",
  },

  {
    name = " Format Buffer",
    cmd = function()
      require("conform").format { async = true, lsp_fallback = true }
    end,
    rtxt = "<leader>fm",
  },

  { name = "separator" },

  -- Edit Operations
  {
    name = "Edit Config",
    cmd = function()
      vim.cmd "tabnew"
      local conf = vim.fn.stdpath "config"
      vim.cmd("tcd " .. conf .. " | e init.lua")
    end,
    rtxt = "ed",
  },

  {
    name = "Copy Content",
    cmd = "%y+",
    rtxt = "<C-c>",
  },

  {
    name = "Delete Content",
    cmd = "%d",
    rtxt = "dc",
  },

  { name = "separator" },

  -- Diagnostics submenu
  {
    name = "󱉶 Diagnostics",
    hl = "ExRed",
    items = {
      {
        name = "Show All Diagnostics",
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

  -- AI Assistant submenu
  {
    name = "󰚩 AI Assistant",
    hl = "ExCyan",
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
        name = "Inline Assistant",
        cmd = "CodeCompanion",
        rtxt = "<leader>ai",
      },
      { name = "separator" },
      {
        name = "Explain Code",
        cmd = function()
          vim.cmd "CodeCompanionChat"
          vim.defer_fn(function()
            vim.api.nvim_feedkeys("Explain this code", "n", false)
          end, 100)
        end,
      },
      {
        name = "Fix Issues",
        cmd = function()
          vim.cmd "CodeCompanionChat"
          vim.defer_fn(function()
            vim.api.nvim_feedkeys("Fix this code", "n", false)
          end, 100)
        end,
      },
      {
        name = "Optimize Code",
        cmd = function()
          vim.cmd "CodeCompanionChat"
          vim.defer_fn(function()
            vim.api.nvim_feedkeys("Optimize this code", "n", false)
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

  { name = "separator" },

  -- Quick Navigation
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

  {
    name = " File Explorer",
    cmd = "NvimTreeToggle",
    rtxt = "<C-n>",
  },

  {
    name = " Terminal",
    cmd = function()
      require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
    end,
    rtxt = "<C-\\>",
  },
}
