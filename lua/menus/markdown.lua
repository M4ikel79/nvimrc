-- lua/menus/markdown.lua
-- Markdown and Obsidian-specific menu

return {
  -- ============================================================================
  -- Obsidian Notes
  -- ============================================================================
  {
    name = " New Note",
    cmd = "ObsidianNew",
    rtxt = "<leader>on",
  },
  {
    name = " Quick Switch",
    cmd = "ObsidianQuickSwitch",
    rtxt = "<leader>oq",
  },
  {
    name = " Search Notes",
    cmd = "ObsidianSearch",
    rtxt = "<leader>os",
  },
  {
    name = " Open in Obsidian",
    cmd = "ObsidianOpen",
    rtxt = "<leader>oo",
  },

  { name = "separator" },

  -- ============================================================================
  -- Daily Notes
  -- ============================================================================
  {
    name = " Today's Note",
    cmd = "ObsidianToday",
    rtxt = "<leader>ot",
  },
  {
    name = " Yesterday's Note",
    cmd = "ObsidianYesterday",
    rtxt = "<leader>oy",
  },

  { name = "separator" },

  -- ============================================================================
  -- Links & References
  -- ============================================================================
  {
    name = " Show Backlinks",
    cmd = "ObsidianBacklinks",
    rtxt = "<leader>ob",
  },
  {
    name = " Show Links",
    cmd = "ObsidianLinks",
    rtxt = "<leader>ol",
  },
  {
    name = " Toggle Checkbox",
    cmd = function()
      require("obsidian").util.toggle_checkbox()
    end,
    rtxt = "<leader>oc",
  },

  { name = "separator" },

  -- ============================================================================
  -- Markdown Preview
  -- ============================================================================
  {
    name = " Preview",
    cmd = "MarkdownPreview",
    rtxt = "<leader>mp",
  },
  {
    name = " Stop Preview",
    cmd = "MarkdownPreviewStop",
    rtxt = "<leader>ms",
  },
  {
    name = " Toggle Preview",
    cmd = "MarkdownPreviewToggle",
    rtxt = "<leader>mt",
  },

  { name = "separator" },

  -- ============================================================================
  -- Workspace
  -- ============================================================================
  {
    name = " Switch Workspace",
    cmd = "ObsidianWorkspace",
    rtxt = "<leader>ow",
  },

  { name = "separator" },

  -- ============================================================================
  -- Standard Actions
  -- ============================================================================
  {
    name = " Format",
    cmd = function()
      require("conform").format { async = true, lsp_fallback = true }
    end,
    rtxt = "<leader>cf",
  },
  {
    name = " Save",
    cmd = "write",
    rtxt = "<C-s>",
  },
}
