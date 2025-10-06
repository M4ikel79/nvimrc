-- ============================================================================
-- FILE: lua/menus/help.lua
-- DESCRIPTION: Help and documentation menu
-- ============================================================================

return {
  {
    name = " Help Tags",
    cmd = "Telescope help_tags",
    rtxt = "<leader>fh",
  },
  {
    name = " Show Keymaps",
    cmd = "Telescope keymaps",
    rtxt = "<leader>fk",
  },
  {
    name = " All Commands",
    cmd = "Telescope commands",
    rtxt = "<leader>fc",
  },

  { name = "separator" },

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

  { name = "separator" },

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
}
