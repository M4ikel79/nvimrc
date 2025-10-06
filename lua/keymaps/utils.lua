-- lua/keymaps/utils.lua
-- Utility functions for keymap system
-- Provides helper functions used across different keymap modules

local M = {}

-- ============================================================================
-- Buffer Navigation Utilities
-- ============================================================================

--- Go to buffer by index (1-9)
--- @param n number Buffer index
function M.goto_buffer(n)
  local bufs = vim.tbl_filter(function(buf)
    return vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted
  end, vim.api.nvim_list_bufs())

  if bufs[n] then
    vim.api.nvim_set_current_buf(bufs[n])
  else
    vim.notify("Buffer " .. n .. " doesn't exist", vim.log.levels.WARN)
  end
end

--- Go to last buffer in list
function M.goto_last_buffer()
  local bufs = vim.tbl_filter(function(buf)
    return vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted
  end, vim.api.nvim_list_bufs())

  if #bufs > 0 then
    vim.api.nvim_set_current_buf(bufs[#bufs])
  else
    vim.notify("No buffers available", vim.log.levels.WARN)
  end
end

--- Get count of open buffers
--- @return number
function M.count_buffers()
  local count = 0
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted then
      count = count + 1
    end
  end
  return count
end

--- Close all buffers except current
function M.close_other_buffers()
  local current = vim.api.nvim_get_current_buf()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if buf ~= current and vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted then
      vim.api.nvim_buf_delete(buf, { force = false })
    end
  end
  vim.notify("Closed all other buffers", vim.log.levels.INFO)
end

-- ============================================================================
-- Window Management Utilities
-- ============================================================================

--- Get window count
--- @return number
function M.count_windows()
  return #vim.api.nvim_tabpage_list_wins(0)
end

--- Close all windows except current
function M.close_other_windows()
  vim.cmd "only"
  vim.notify("Closed all other windows", vim.log.levels.INFO)
end

--- Toggle window zoom (maximize/restore)
function M.toggle_zoom()
  if vim.t.zoomed then
    vim.cmd "tabclose"
    vim.t.zoomed = false
  else
    vim.cmd "tab split"
    vim.t.zoomed = true
  end
end

-- ============================================================================
-- File Operation Utilities
-- ============================================================================

--- Check if file exists
--- @param path string File path
--- @return boolean
function M.file_exists(path)
  return vim.fn.filereadable(vim.fn.expand(path)) == 1
end

--- Get file extension
--- @param path string|nil File path (uses current buffer if nil)
--- @return string
function M.get_extension(path)
  path = path or vim.api.nvim_buf_get_name(0)
  return vim.fn.fnamemodify(path, ":e")
end

--- Get file name without extension
--- @param path string|nil File path (uses current buffer if nil)
--- @return string
function M.get_filename(path)
  path = path or vim.api.nvim_buf_get_name(0)
  return vim.fn.fnamemodify(path, ":t:r")
end

--- Open file in system default application
--- @param path string|nil File path (uses current buffer if nil)
function M.open_external(path)
  path = path or vim.api.nvim_buf_get_name(0)

  local cmd
  if vim.fn.has "mac" == 1 then
    cmd = "open"
  elseif vim.fn.has "unix" == 1 then
    cmd = "xdg-open"
  elseif vim.fn.has "win32" == 1 then
    cmd = "start"
  else
    vim.notify("Unsupported OS", vim.log.levels.ERROR)
    return
  end

  vim.fn.jobstart({ cmd, path }, { detach = true })
  vim.notify("Opened: " .. path, vim.log.levels.INFO)
end

-- ============================================================================
-- Search & Replace Utilities
-- ============================================================================

--- Replace word under cursor in entire buffer
--- @param replacement string|nil New value (prompts if nil)
function M.replace_word(replacement)
  local word = vim.fn.expand "<cword>"

  if not replacement then
    replacement = vim.fn.input("Replace '" .. word .. "' with: ")
    if replacement == "" then
      return
    end
  end

  local count = vim.fn.searchcount({ pattern = "\\<" .. word .. "\\>" }).total
  vim.cmd(":%s/\\<" .. word .. "\\>/" .. replacement .. "/g")
  vim.notify(string.format("Replaced %d occurrences", count), vim.log.levels.INFO)
end

--- Search for visual selection
function M.search_visual()
  local saved_reg = vim.fn.getreg "v"
  vim.cmd [[noautocmd sil norm! gv"vy]]
  local pattern = vim.fn.escape(vim.fn.getreg "v", "\\/")
  vim.fn.setreg("v", saved_reg)
  vim.fn.setreg("/", "\\V" .. pattern)
  vim.cmd "set hlsearch"
end

-- ============================================================================
-- LSP Utilities
-- ============================================================================

--- Check if LSP client is attached to buffer
--- @param bufnr number|nil Buffer number (uses current if nil)
--- @return boolean
function M.is_lsp_attached(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients { bufnr = bufnr }
  return #clients > 0
end

--- Get active LSP client names for buffer
--- @param bufnr number|nil Buffer number (uses current if nil)
--- @return string[]
function M.get_lsp_clients(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients { bufnr = bufnr }
  local names = {}
  for _, client in ipairs(clients) do
    table.insert(names, client.name)
  end
  return names
end

--- Format buffer with LSP or fallback to conform
--- @param bufnr number|nil Buffer number (uses current if nil)
function M.format_buffer(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()

  -- Try LSP first
  if M.is_lsp_attached(bufnr) then
    vim.lsp.buf.format { bufnr = bufnr, async = true }
  else
    -- Fallback to conform
    require("conform").format { bufnr = bufnr, async = true }
  end
end

-- ============================================================================
-- Diagnostic Utilities
-- ============================================================================

--- Get diagnostic count for buffer
--- @param severity number|nil Diagnostic severity level
--- @param bufnr number|nil Buffer number (uses current if nil)
--- @return number
function M.get_diagnostic_count(severity, bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  local diagnostics = vim.diagnostic.get(bufnr, { severity = severity })
  return #diagnostics
end

--- Get diagnostic summary string
--- @param bufnr number|nil Buffer number (uses current if nil)
--- @return string
function M.get_diagnostic_summary(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()

  local counts = {
    errors = M.get_diagnostic_count(vim.diagnostic.severity.ERROR, bufnr),
    warnings = M.get_diagnostic_count(vim.diagnostic.severity.WARN, bufnr),
    hints = M.get_diagnostic_count(vim.diagnostic.severity.HINT, bufnr),
    info = M.get_diagnostic_count(vim.diagnostic.severity.INFO, bufnr),
  }

  return string.format("E:%d W:%d H:%d I:%d", counts.errors, counts.warnings, counts.hints, counts.info)
end

-- ============================================================================
-- Terminal Utilities
-- ============================================================================

--- Send command to terminal
--- @param cmd string Command to execute
--- @param term_type string|nil Terminal type: "horizontal", "vertical", "float"
function M.send_to_terminal(cmd, term_type)
  term_type = term_type or "horizontal"
  require("nvchad.term").send(cmd, term_type)
end

--- Execute command and show output
--- @param cmd string Command to execute
function M.execute_command(cmd)
  local output = vim.fn.systemlist(cmd)
  if vim.v.shell_error ~= 0 then
    vim.notify("Command failed: " .. cmd, vim.log.levels.ERROR)
    return
  end

  -- Show output in split
  vim.cmd "new"
  vim.api.nvim_buf_set_lines(0, 0, -1, false, output)
  vim.bo.buftype = "nofile"
  vim.bo.bufhidden = "wipe"
  vim.bo.filetype = "log"
end

-- ============================================================================
-- Git Utilities
-- ============================================================================

--- Get git root directory
--- @return string|nil
function M.get_git_root()
  local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
  if vim.v.shell_error ~= 0 then
    return nil
  end
  return git_root
end

--- Check if current directory is a git repository
--- @return boolean
function M.is_git_repo()
  return M.get_git_root() ~= nil
end

--- Get current git branch
--- @return string|nil
function M.get_git_branch()
  if not M.is_git_repo() then
    return nil
  end
  local branch = vim.fn.systemlist("git branch --show-current")[1]
  return branch
end

--- Get git status summary
--- @return table {added: number, modified: number, removed: number}
function M.get_git_status()
  if not M.is_git_repo() then
    return { added = 0, modified = 0, removed = 0 }
  end

  local status = vim.fn.systemlist "git status --porcelain"
  local counts = { added = 0, modified = 0, removed = 0 }

  for _, line in ipairs(status) do
    local status_code = line:sub(1, 2):match "%S"
    if status_code == "A" or status_code == "?" then
      counts.added = counts.added + 1
    elseif status_code == "M" then
      counts.modified = counts.modified + 1
    elseif status_code == "D" then
      counts.removed = counts.removed + 1
    end
  end

  return counts
end

-- ============================================================================
-- Theme & Color Utilities
-- ============================================================================

--- Get current colorscheme
--- @return string|nil
function M.get_colorscheme()
  return vim.g.colors_name
end

--- List available colorschemes
--- @return string[]
function M.list_colorschemes()
  return vim.fn.getcompletion("", "color")
end

--- Cycle through colorschemes
--- @param direction number 1 for next, -1 for previous
function M.cycle_colorscheme(direction)
  direction = direction or 1
  local schemes = M.list_colorschemes()
  local current = M.get_colorscheme()

  local current_idx = 1
  for i, scheme in ipairs(schemes) do
    if scheme == current then
      current_idx = i
      break
    end
  end

  local next_idx = current_idx + direction
  if next_idx > #schemes then
    next_idx = 1
  elseif next_idx < 1 then
    next_idx = #schemes
  end

  vim.cmd("colorscheme " .. schemes[next_idx])
  vim.notify("Colorscheme: " .. schemes[next_idx], vim.log.levels.INFO)
end

--- Extract color from word under cursor
--- @return string|nil Hex color code
function M.get_color_under_cursor()
  local word = vim.fn.expand "<cword>"

  -- Check for hex color
  local hex = word:match "^#(%x%x%x%x%x%x)$" or word:match "^#(%x%x%x)$"
  if hex then
    -- Expand short form to long form
    if #hex == 3 then
      hex = hex:sub(1, 1):rep(2) .. hex:sub(2, 2):rep(2) .. hex:sub(3, 3):rep(2)
    end
    return "#" .. hex
  end

  return nil
end

-- ============================================================================
-- Project Utilities
-- ============================================================================

--- Get project root (prioritizes git, then looks for common markers)
--- @return string|nil
function M.get_project_root()
  -- Try git first
  local git_root = M.get_git_root()
  if git_root then
    return git_root
  end

  -- Look for common project markers
  local markers = { "package.json", "Cargo.toml", "go.mod", "pom.xml", "Makefile" }
  local current_dir = vim.fn.expand "%:p:h"

  while current_dir ~= "/" do
    for _, marker in ipairs(markers) do
      if M.file_exists(current_dir .. "/" .. marker) then
        return current_dir
      end
    end
    current_dir = vim.fn.fnamemodify(current_dir, ":h")
  end

  return nil
end

--- Change to project root directory
function M.cd_project_root()
  local root = M.get_project_root()
  if root then
    vim.cmd("cd " .. root)
    vim.notify("Changed to: " .. root, vim.log.levels.INFO)
  else
    vim.notify("No project root found", vim.log.levels.WARN)
  end
end

-- ============================================================================
-- Session Utilities
-- ============================================================================

--- Save current session
--- @param name string|nil Session name (prompts if nil)
function M.save_session(name)
  if not name then
    name = vim.fn.input("Session name: ", "", "file")
    if name == "" then
      return
    end
  end

  local session_dir = vim.fn.stdpath "data" .. "/sessions"
  vim.fn.mkdir(session_dir, "p")

  local session_file = session_dir .. "/" .. name .. ".vim"
  vim.cmd("mksession! " .. session_file)
  vim.notify("Session saved: " .. name, vim.log.levels.INFO)
end

--- Load session
--- @param name string|nil Session name (shows picker if nil)
function M.load_session(name)
  local session_dir = vim.fn.stdpath "data" .. "/sessions"

  if not name then
    local sessions = vim.fn.glob(session_dir .. "/*.vim", false, true)
    if #sessions == 0 then
      vim.notify("No sessions found", vim.log.levels.WARN)
      return
    end

    -- Extract just the names
    local session_names = {}
    for _, session in ipairs(sessions) do
      local session_name = vim.fn.fnamemodify(session, ":t:r")
      table.insert(session_names, session_name)
    end

    vim.ui.select(session_names, { prompt = "Select session:" }, function(choice)
      if choice then
        M.load_session(choice)
      end
    end)
    return
  end

  local session_file = session_dir .. "/" .. name .. ".vim"
  if not M.file_exists(session_file) then
    vim.notify("Session not found: " .. name, vim.log.levels.ERROR)
    return
  end

  vim.cmd("source " .. session_file)
  vim.notify("Session loaded: " .. name, vim.log.levels.INFO)
end

-- ============================================================================
-- Keymap Introspection
-- ============================================================================

--- Get all keymaps for a mode
--- @param mode string Mode ('n', 'i', 'v', etc.)
--- @return table[]
function M.get_keymaps(mode)
  return vim.api.nvim_get_keymap(mode)
end

--- Check if keymap exists
--- @param mode string Mode
--- @param lhs string Left-hand side
--- @return boolean
function M.keymap_exists(mode, lhs)
  local keymaps = M.get_keymaps(mode)
  for _, keymap in ipairs(keymaps) do
    if keymap.lhs == lhs then
      return true
    end
  end
  return false
end

--- Show keymap conflicts
--- @param mode string Mode to check
function M.show_conflicts(mode)
  local keymaps = M.get_keymaps(mode)
  local conflicts = {}

  for _, keymap in ipairs(keymaps) do
    conflicts[keymap.lhs] = conflicts[keymap.lhs] or {}
    table.insert(conflicts[keymap.lhs], keymap)
  end

  local has_conflicts = false
  for lhs, maps in pairs(conflicts) do
    if #maps > 1 then
      has_conflicts = true
      print("Conflict for " .. lhs .. ":")
      for _, map in ipairs(maps) do
        print("  - " .. (map.desc or map.rhs or "unknown"))
      end
    end
  end

  if not has_conflicts then
    vim.notify("No conflicts found for mode: " .. mode, vim.log.levels.INFO)
  end
end

-- ============================================================================
-- Miscellaneous Utilities
-- ============================================================================

--- Toggle boolean option
--- @param option string Option name
function M.toggle_option(option)
  vim.opt[option] = not vim.opt[option]:get()
  local status = vim.opt[option]:get() and "enabled" or "disabled"
  vim.notify(option .. " " .. status, vim.log.levels.INFO)
end

--- Reload Neovim configuration
function M.reload_config()
  -- Clear module cache
  for name, _ in pairs(package.loaded) do
    if name:match "^user" or name:match "^keymaps" then
      package.loaded[name] = nil
    end
  end

  -- Reload init.lua
  dofile(vim.fn.stdpath "config" .. "/init.lua")
  vim.notify("Configuration reloaded", vim.log.levels.INFO)
end

--- Get current time formatted
--- @param format string|nil Time format (default: "%H:%M:%S")
--- @return string
function M.get_time(format)
  format = format or "%H:%M:%S"
  return os.date(format)
end

--- Copy file path to clipboard
--- @param type string|nil Type: "absolute", "relative", "name" (default: "absolute")
function M.copy_path(type)
  type = type or "absolute"
  local path

  if type == "absolute" then
    path = vim.fn.expand "%:p"
  elseif type == "relative" then
    path = vim.fn.expand "%:."
  elseif type == "name" then
    path = vim.fn.expand "%:t"
  else
    vim.notify("Invalid path type", vim.log.levels.ERROR)
    return
  end

  vim.fn.setreg("+", path)
  vim.notify("Copied: " .. path, vim.log.levels.INFO)
end

return M
