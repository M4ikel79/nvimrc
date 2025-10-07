-- lua/configs/menu_manager.lua
-- Intelligent context-aware menu dispatcher
-- Detects current context and shows the most relevant menu

local M = {}

-- Context detection helper functions
local function has_lsp()
  local clients = vim.lsp.get_clients { bufnr = 0 }
  return #clients > 0
end

local function is_git_repo()
  local git_dir = vim.fn.finddir(".git", vim.fn.expand "%:p:h" .. ";")
  return git_dir ~= ""
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

  local menu_name = "default"

  -- Priority 1: Special buffer types
  if ft == "NvimTree" then
    menu_name = "nvimtree"
  elseif ft == "Trouble" or ft == "qf" then
    menu_name = "diagnostic"
  elseif ft == "TelescopePrompt" then
    -- Don't show menu in telescope
    return

  -- Priority 2: Empty buffer
  elseif buffer_is_empty() and bufname == "" then
    menu_name = "empty"

  -- Priority 3: Filetype-specific menus
  elseif ft == "markdown" then
    menu_name = "markdown"
  elseif
    vim.tbl_contains(
      { "html", "css", "scss", "javascript", "typescript", "javascriptreact", "typescriptreact", "vue", "svelte" },
      ft
    )
  then
    menu_name = "webdev"
  elseif vim.tbl_contains({ "python", "lua", "rust", "go", "java", "c", "cpp" }, ft) then
    menu_name = "code"

  -- Priority 4: Check if LSP is attached (programming context)
  elseif has_lsp() then
    menu_name = "code"
  end

  -- Open the detected menu
  require("menu").open(menu_name, opts)
end

-- Utility: Get menu for specific context (for manual override)
M.open_menu = function(menu_name, opts)
  require("menu").open(menu_name, opts or {})
end

return M
