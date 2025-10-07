-- lua/menus/nvimtree.lua
-- NvimTree file operations menu (replaces the existing one)

local api = require "nvim-tree.api"

-- Helper function to get node under cursor
local function get_node()
  return api.tree.get_node_under_cursor()
end

return {
  -- ============================================================================
  -- Open Actions
  -- ============================================================================
  {
    name = " Open",
    cmd = function()
      api.node.open.edit(get_node())
    end,
    rtxt = "o",
  },
  {
    name = " Open in Vertical Split",
    cmd = function()
      api.node.open.vertical(get_node())
    end,
    rtxt = "v",
  },
  {
    name = " Open in Horizontal Split",
    cmd = function()
      api.node.open.horizontal(get_node())
    end,
    rtxt = "s",
  },
  {
    name = "󰓪 Open in New Tab",
    cmd = function()
      api.node.open.tab(get_node())
    end,
    rtxt = "t",
  },
  {
    name = " Preview",
    cmd = function()
      api.node.open.preview(get_node())
    end,
    rtxt = "P",
  },

  { name = "separator" },

  -- ============================================================================
  -- File Operations
  -- ============================================================================
  {
    name = " New File",
    cmd = function()
      api.fs.create(get_node())
    end,
    rtxt = "a",
  },
  {
    name = " New Folder",
    cmd = function()
      api.fs.create(get_node())
      -- Note: After pressing 'a', user adds '/' at end to create folder
    end,
    rtxt = "a",
  },
  {
    name = " Rename",
    cmd = function()
      api.fs.rename(get_node())
    end,
    rtxt = "r",
  },
  {
    name = " Rename (Basename)",
    cmd = function()
      api.fs.rename_basename(get_node())
    end,
    rtxt = "e",
  },
  {
    name = " Rename (Full Path)",
    cmd = function()
      api.fs.rename_full(get_node())
    end,
    rtxt = "R",
  },

  { name = "separator" },

  -- ============================================================================
  -- Copy/Cut/Paste
  -- ============================================================================
  {
    name = " Copy",
    cmd = function()
      api.fs.copy.node(get_node())
    end,
    rtxt = "c",
  },
  {
    name = " Cut",
    cmd = function()
      api.fs.cut(get_node())
    end,
    rtxt = "x",
  },
  {
    name = " Paste",
    cmd = function()
      api.fs.paste(get_node())
    end,
    rtxt = "p",
  },

  { name = "separator" },

  -- ============================================================================
  -- Copy Paths to Clipboard
  -- ============================================================================
  {
    name = "󰴠 Copy Absolute Path",
    cmd = function()
      api.fs.copy.absolute_path(get_node())
    end,
    rtxt = "gy",
  },
  {
    name = " Copy Relative Path",
    cmd = function()
      api.fs.copy.relative_path(get_node())
    end,
    rtxt = "Y",
  },
  {
    name = " Copy Filename",
    cmd = function()
      api.fs.copy.filename(get_node())
    end,
    rtxt = "y",
  },

  { name = "separator" },

  -- ============================================================================
  -- Delete Operations
  -- ============================================================================
  {
    name = " Trash",
    cmd = function()
      api.fs.trash(get_node())
    end,
    rtxt = "D",
  },
  {
    name = " Delete",
    hl = "ExRed",
    cmd = function()
      api.fs.remove(get_node())
    end,
    rtxt = "d",
  },

  { name = "separator" },

  -- ============================================================================
  -- Navigation
  -- ============================================================================
  {
    name = " Parent Directory",
    cmd = function()
      api.tree.change_root_to_parent()
    end,
    rtxt = "P",
  },
  {
    name = " Change Root to Node",
    cmd = function()
      api.tree.change_root_to_node(get_node())
    end,
    rtxt = "C",
  },
  {
    name = " Go to Parent",
    cmd = function()
      api.node.navigate.parent()
    end,
    rtxt = "p",
  },

  { name = "separator" },

  -- ============================================================================
  -- Search & Filter
  -- ============================================================================
  {
    name = " Find File",
    cmd = function()
      api.tree.find_file { open = true, focus = true }
    end,
    rtxt = "f",
  },
  {
    name = " Filter",
    cmd = function()
      api.live_filter.start()
    end,
    rtxt = "F",
  },
  {
    name = " Clear Filter",
    cmd = function()
      api.live_filter.clear()
    end,
    rtxt = "F",
  },

  { name = "separator" },

  -- ============================================================================
  -- View Options
  -- ============================================================================
  {
    name = " Toggle Hidden Files",
    cmd = function()
      api.tree.toggle_hidden_filter()
    end,
    rtxt = "H",
  },
  {
    name = " Toggle Gitignore Filter",
    cmd = function()
      api.tree.toggle_gitignore_filter()
    end,
    rtxt = "I",
  },
  {
    name = " Toggle Help",
    cmd = function()
      api.tree.toggle_help()
    end,
    rtxt = "g?",
  },
  {
    name = " Refresh",
    cmd = function()
      api.tree.reload()
    end,
    rtxt = "R",
  },
  {
    name = " Collapse All",
    cmd = function()
      api.tree.collapse_all()
    end,
    rtxt = "W",
  },

  { name = "separator" },

  -- ============================================================================
  -- System Actions
  -- ============================================================================
  {
    name = " Open in System",
    hl = "ExBlue",
    cmd = function()
      api.node.run.system(get_node())
    end,
    rtxt = "s",
  },
  {
    name = " Open in Terminal",
    hl = "ExCyan",
    cmd = function()
      local node = get_node()
      local path = node.absolute_path
      local node_type = vim.loop.fs_stat(path).type
      local dir = node_type == "directory" and path or vim.fn.fnamemodify(path, ":h")

      -- Close NvimTree
      api.tree.close()

      -- Open terminal in the directory
      vim.cmd "enew"
      vim.fn.termopen { vim.o.shell, "-c", "cd " .. vim.fn.shellescape(dir) .. " ; " .. vim.o.shell }
      vim.cmd "startinsert"
    end,
  },
  {
    name = " Run Command",
    cmd = function()
      api.node.run.cmd(get_node())
    end,
    rtxt = "!",
  },

  { name = "separator" },

  -- ============================================================================
  -- Bookmarks
  -- ============================================================================
  {
    name = " Toggle Bookmark",
    cmd = function()
      api.marks.toggle(get_node())
    end,
    rtxt = "m",
  },
  {
    name = " Bulk Move Bookmarks",
    cmd = function()
      api.marks.bulk.move()
    end,
    rtxt = "bmv",
  },

  { name = "separator" },

  -- ============================================================================
  -- Info
  -- ============================================================================
  {
    name = " File Info",
    cmd = function()
      api.node.show_info_popup(get_node())
    end,
    rtxt = "i",
  },
  {
    name = " Git Status",
    cmd = function()
      api.node.navigate.git.prev()
    end,
  },

  { name = "separator" },

  -- ============================================================================
  -- Close
  -- ============================================================================
  {
    name = " Close Explorer",
    cmd = function()
      api.tree.close()
    end,
    rtxt = "q",
  },
}
