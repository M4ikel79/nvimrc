-- ============================================================================
-- FILE: lua/menus/markdown.lua
-- DESCRIPTION: Markdown and Obsidian menu
-- ============================================================================

return {
  -- Obsidian Notes
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

  -- Daily Notes
  {
    name = " Today's Note",
    cmd = "ObsidianToday",
    rtxt = "<leader>ot",
  },

  { name = "separator" },

  -- Markdown Preview
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

  -- Standard Actions
  {
    name = " Format",
    cmd = function()
      local ok, conform = pcall(require, "conform")
      if ok then
        conform.format { async = true, lsp_fallback = true }
      else
        vim.lsp.buf.format()
      end
    end,
    rtxt = "<leader>cf",
  },
}
