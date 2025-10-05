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
