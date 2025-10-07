-- lua/menus/markdown.lua
-- Markdown editing and Obsidian integration menu

return {
  {
    name = " Markdown Tools",
    title = true,
    hl = "ExBlue",
  },

  { name = "separator" },

  -- Preview Controls
  {
    name = " Start Preview",
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

  -- Obsidian Notes submenu
  {
    name = "󰎚 Obsidian Notes",
    items = {
      {
        name = "New Note",
        cmd = "ObsidianNew",
        rtxt = "<leader>on",
      },
      {
        name = "Quick Switch",
        cmd = "ObsidianQuickSwitch",
        rtxt = "<leader>oq",
      },
      {
        name = "Search Notes",
        cmd = "ObsidianSearch",
        rtxt = "<leader>os",
      },
      {
        name = "Open in Obsidian",
        cmd = "ObsidianOpen",
        rtxt = "<leader>oo",
      },
      { name = "separator" },
      {
        name = "Today's Note",
        cmd = "ObsidianToday",
        rtxt = "<leader>ot",
      },
      {
        name = "Yesterday's Note",
        cmd = "ObsidianYesterday",
        rtxt = "<leader>oy",
      },
      { name = "separator" },
      {
        name = "Show Backlinks",
        cmd = "ObsidianBacklinks",
        rtxt = "<leader>ob",
      },
      {
        name = "Show Links",
        cmd = "ObsidianLinks",
        rtxt = "<leader>ol",
      },
      {
        name = "Insert Template",
        cmd = "ObsidianTemplate",
      },
      {
        name = "Switch Workspace",
        cmd = "ObsidianWorkspace",
        rtxt = "<leader>ow",
      },
    },
  },

  { name = "separator" },

  -- Markdown Utilities
  {
    name = "Toggle Checkbox",
    cmd = function()
      require("obsidian").util.toggle_checkbox()
    end,
    rtxt = "<leader>oc",
  },

  {
    name = " Format Document",
    cmd = function()
      require("conform").format { async = true, lsp_fallback = true }
    end,
    rtxt = "<leader>fm",
  },

  { name = "separator" },

  -- Table of Contents
  {
    name = " Generate TOC",
    cmd = function()
      -- Custom TOC generation logic
      vim.notify("TOC generation not yet implemented", vim.log.levels.INFO)
    end,
  },

  -- Toggle Render
  {
    name = " Toggle Render",
    cmd = "RenderMarkdown toggle",
  },
}
