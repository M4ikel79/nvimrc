-- lua/menus/help.lua
-- Help, documentation, and information menu

return {
  -- ============================================================================
  -- Documentation
  -- ============================================================================
  {
    name = " Help Tags",
    cmd = "Telescope help_tags",
    rtxt = "<leader>fh",
  },
  {
    name = " Man Pages",
    cmd = "Telescope man_pages",
  },
  {
    name = " Vim Options",
    cmd = "Telescope vim_options",
    rtxt = "<leader>fo",
  },

  { name = "separator" },

  -- ============================================================================
  -- Keymaps
  -- ============================================================================
  {
    name = " Show Keymaps",
    cmd = "Telescope keymaps",
    rtxt = "<leader>fk",
  },
  {
    name = " Buffer Keymaps",
    cmd = function()
      require("which-key").show { global = false }
    end,
    rtxt = "<leader>?",
  },
  {
    name = " All Commands",
    cmd = "Telescope commands",
    rtxt = "<leader>fc",
  },
  {
    name = " Command History",
    cmd = "Telescope command_history",
    rtxt = "<leader>fC",
  },

  { name = "separator" },

  -- ============================================================================
  -- Information
  -- ============================================================================
  {
    name = " Neovim Info",
    cmd = "checkhealth",
  },
  {
    name = " LSP Info",
    cmd = "LspInfo",
    rtxt = "<leader>li",
  },
  {
    name = " Mason Info",
    cmd = "Mason",
    rtxt = "<leader>M",
  },
  {
    name = " Lazy Info",
    cmd = "Lazy",
    rtxt = "<leader>L",
  },
  {
    name = " Treesitter Info",
    cmd = "TSModuleInfo",
  },

  { name = "separator" },

  -- ============================================================================
  -- Notifications
  -- ============================================================================
  {
    name = " Notification History",
    cmd = "Telescope notify",
    rtxt = "<leader>nh",
  },
  {
    name = " Dismiss Notifications",
    cmd = function()
      require("notify").dismiss { silent = true, pending = true }
    end,
    rtxt = "<leader>un",
  },

  { name = "separator" },

  -- ============================================================================
  -- Quickfix & Location
  -- ============================================================================
  {
    name = " Quickfix List",
    cmd = "Telescope quickfix",
    rtxt = "<leader>fq",
  },
  {
    name = " Location List",
    cmd = "Telescope loclist",
    rtxt = "<leader>fl",
  },

  { name = "separator" },

  -- ============================================================================
  -- About
  -- ============================================================================
  {
    name = " Neovim Version",
    cmd = "version",
  },
  {
    name = " Startup Time",
    cmd = function()
      vim.cmd "Lazy profile"
    end,
    rtxt = "<leader>Lp",
  },
}
