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
--
-- -- Clean up whitespace and preserve cursor position on save
-- autocmd("BufWritePre", {
--   group = augroup("CleanupOnSave", { clear = true }),
--   callback = function()
--     local cursor_pos = vim.fn.getpos "."
--
--     -- Remove trailing whitespace
--     vim.cmd [[%s/\s\+$//e]]
--
--     -- Restore cursor position
--     vim.fn.setpos(".", cursor_pos)
--   end,
-- })
--
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "nu",
--   callback = function()
--     vim.lsp.start {
--       name = "nushell",
--       cmd = { "nu", "--lsp" },
--       root_dir = vim.fs.dirname(vim.fs.find({ ".git" }, { upward = true })[1]),
--     }
--   end,
-- })
