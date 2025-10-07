-- lua/configs/menu_manager.lua
-- Intelligent context-aware menu dispatcher
-- Detects current context and shows the most relevant menu

local M = {}

-- Context detection helpers
local function has_lsp()
  local clients = vim.lsp.get_clients { bufnr = 0 }
  return #clients > 0
end

local function is_git_repo()
  local git_dir = vim.fn.finddir(".git", vim.fn.expand "%:p:h" .. ";")
  return git_dir ~= ""
end

local function has_colors_in_buffer()
  -- Check if current line or nearby lines contain color codes
  local lines = vim.api.nvim_buf_get_lines(0, math.max(0, vim.fn.line "." - 5), vim.fn.line "." + 5, false)
  for _, line in ipairs(lines) do
    if line:match "#%x%x%x%x%x%x" or line:match "#%x%x%x" or line:match "rgb%s*%(" then
      return true
    end
  end
  return false
end

local function is_dap_active()
  local ok, dap = pcall(require, "dap")
  if not ok then
    return false
  end
  return dap.session() ~= nil
end

local function buffer_is_empty()
  return vim.api.nvim_buf_line_count(0) == 1 and vim.api.nvim_buf_get_lines(0, 0, 1, false)[1] == ""
end

-- Main context detection function
M.open_context_menu = function(opts)
  opts = opts or {}

  local buf = vim.api.nvim_get_current_buf()
  local ft = vim.bo[buf].ft
  local bufname = vim.api.nvim_buf_get_name(buf)
  local menu_name = "main"

  -- Priority 1: Special buffer types
  if ft == "NvimTree" then
    menu_name = "nvimtree"

  -- Priority 2: Debugging context
  elseif is_dap_active() then
    menu_name = "debug"

  -- Priority 3: Color editing context
  elseif has_colors_in_buffer() then
    menu_name = "colors"

  -- Priority 4: File type specific menus
  elseif ft == "markdown" then
    menu_name = "markdown"
  elseif
    vim.tbl_contains({
      "html",
      "css",
      "scss",
      "sass",
      "less",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "vue",
      "svelte",
    }, ft)
  then
    menu_name = "webdev"

  -- Priority 5: Git operations (if in git repo)
  elseif is_git_repo() and not has_lsp() then
    menu_name = "git"

  -- Priority 6: General editing with LSP
  elseif has_lsp() then
    menu_name = "main"

  -- Priority 7: Empty buffer
  elseif buffer_is_empty() and bufname == "" then
    menu_name = "empty"
  end

  -- Open the detected menu
  require("menu").open(menu_name, opts)
end

-- Direct menu access (for manual override)
M.open_menu = function(menu_name, opts)
  require("menu").open(menu_name, opts or {})
end

-- Quick access functions for specific menus
M.open_debug_menu = function(opts)
  require("menu").open("debug", opts or {})
end

M.open_git_menu = function(opts)
  require("menu").open("git", opts or {})
end

M.open_colors_menu = function(opts)
  require("menu").open("colors", opts or {})
end

M.open_markdown_menu = function(opts)
  require("menu").open("markdown", opts or {})
end

M.open_webdev_menu = function(opts)
  require("menu").open("webdev", opts or {})
end

return M
