-- ============================================================================
-- FILE: lua/menus/files.lua
-- DESCRIPTION: File operations and search menu
-- ============================================================================

return {
  -- Find Files
  {
    name = " Find Files",
    cmd = "Telescope find_files",
    rtxt = "<leader>ff",
  },
  {
    name = " Recent Files",
    cmd = "Telescope oldfiles",
    rtxt = "<leader>fr",
  },

  { name = "separator" },

  -- Search
  {
    name = " Live Grep",
    cmd = "Telescope live_grep",
    rtxt = "<leader>fw",
  },
  {
    name = " Grep String",
    cmd = "Telescope grep_string",
    rtxt = "<leader>fg",
  },

  { name = "separator" },

  -- File Explorer
  {
    name = " Toggle Explorer",
    cmd = "NvimTreeToggle",
    rtxt = "<C-n>",
  },
  {
    name = " Find in Explorer",
    cmd = "NvimTreeFindFile",
    rtxt = "<leader>E",
  },

  { name = "separator" },

  -- File Operations
  {
    name = "󰈔 Copy File Path",
    items = {
      {
        name = "Copy Absolute Path",
        cmd = function()
          local path = vim.fn.expand "%:p"
          vim.fn.setreg("+", path)
          vim.notify("Copied: " .. path, vim.log.levels.INFO)
        end,
      },
      {
        name = "Copy Relative Path",
        cmd = function()
          local path = vim.fn.expand "%:."
          vim.fn.setreg("+", path)
          vim.notify("Copied: " .. path, vim.log.levels.INFO)
        end,
      },
      {
        name = "Copy File Name",
        cmd = function()
          local path = vim.fn.expand "%:t"
          vim.fn.setreg("+", path)
          vim.notify("Copied: " .. path, vim.log.levels.INFO)
        end,
      },
    },
  },
}
