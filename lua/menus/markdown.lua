-- FILE: lua/menus/markdown.lua
-- Markdown and note-taking menu (Markdown, Obsidian)

return {
  -- Preview
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

  { name = "separator" },

  -- Obsidian quick actions
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

  { name = "separator" },

  -- Daily notes
  {
    name = " Today's Note",
    cmd = "ObsidianToday",
    rtxt = "<leader>ot",
  },
  {
    name = " Yesterday",
    cmd = "ObsidianYesterday",
    rtxt = "<leader>oy",
  },

  { name = "separator" },

  -- Links
  {
    name = " Backlinks",
    cmd = "ObsidianBacklinks",
    rtxt = "<leader>ob",
  },
  {
    name = " Toggle Checkbox",
    cmd = function()
      require("obsidian").util.toggle_checkbox()
    end,
    rtxt = "<leader>oc",
  },

  { name = "separator" },

  -- Formatting
  {
    name = " Format",
    cmd = function()
      require("conform").format { async = true, lsp_fallback = true }
    end,
    rtxt = "<leader>fm",
  },
  {
    name = " Insert Template",
    cmd = "ObsidianTemplate",
  },
}
