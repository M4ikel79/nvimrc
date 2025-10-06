-- ============================================================================
-- FILE: lua/menus/window.lua
-- DESCRIPTION: Window and buffer management menu
-- ============================================================================

return {
  -- Split Windows
  {
    name = " Split Below",
    cmd = "split",
    rtxt = "<leader>-",
  },
  {
    name = " Split Right",
    cmd = "vsplit",
    rtxt = "<leader>|",
  },
  {
    name = " Close Window",
    cmd = "close",
    rtxt = "<leader>wd",
  },

  { name = "separator" },

  -- Buffer Navigation
  {
    name = " Previous Buffer",
    cmd = "bprevious",
    rtxt = "<A-,>",
  },
  {
    name = " Next Buffer",
    cmd = "bnext",
    rtxt = "<A-.>",
  },
  {
    name = " Close Buffer",
    cmd = "Bdelete",
    rtxt = "<A-c>",
  },
  {
    name = " Buffer Picker",
    cmd = "Telescope buffers",
    rtxt = "<C-p>",
  },

  { name = "separator" },

  -- Tabs
  {
    name = " New Tab",
    cmd = "tabnew",
    rtxt = "<leader>tn",
  },
  {
    name = " Close Tab",
    cmd = "tabclose",
    rtxt = "<leader>tc",
  },
  {
    name = " Next Tab",
    cmd = "tabnext",
    rtxt = "<leader>tl",
  },
  {
    name = " Previous Tab",
    cmd = "tabprevious",
    rtxt = "<leader>th",
  },
}
