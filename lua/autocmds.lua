require "nvchad.autocmds"

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Remember cursor position when reopening files
autocmd("BufReadPost", {
  group = augroup("RestoreCursor", { clear = true }),
  callback = function()
    local line = vim.fn.line "'\""
    if line > 1 and line <= vim.fn.line "$" and vim.bo.filetype ~= "commit" then
      vim.cmd 'normal! g`"'
    end
  end,
})

-- Highlight yanked text briefly
autocmd("TextYankPost", {
  group = augroup("HighlightYank", { clear = true }),
  callback = function()
    vim.highlight.on_yank { timeout = 200 }
  end,
})

-- Highlight broken Obsidian links on open
autocmd("BufEnter", {
  group = augroup("ObsidianLinks", { clear = true }),
  pattern = { "*.md", "*.MD", "*.markdown" },
  callback = function()
    local ok, obsidian = pcall(require, "obsidian")
    if ok and obsidian.util then
      pcall(obsidian.util.check_links)
    end
  end,
})

-- Toggle soft wrap + spell check in Obsidian notes
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.spell = true
  end,
})
