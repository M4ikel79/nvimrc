-- lua/keymaps/term.lua
-- NvChad terminal keymaps
-- Ensures compatibility with NvChad default terminal bindings
-- Uses vim.keymap.set for terminal-specific operations

local map = vim.keymap.set

-- ============================================================================
-- Terminal Mode Navigation
-- ============================================================================
-- Exit terminal mode
map("t", "<C-x>", "<C-\\><C-N>", { desc = "Exit terminal mode" })
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Close terminal" })
map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

-- Window navigation in terminal mode (tmux-aware)
map("t", "<C-h>", [[<C-\><C-N><C-w>h]], { desc = "Window left" })
map("t", "<C-j>", [[<C-\><C-N><C-w>j]], { desc = "Window down" })
map("t", "<C-k>", [[<C-\><C-N><C-w>k]], { desc = "Window up" })
map("t", "<C-l>", [[<C-\><C-N><C-w>l]], { desc = "Window right" })

-- Window resizing in terminal mode
map("t", "<A-Up>", [[<C-\><C-N><C-w>+]], { desc = "Increase height" })
map("t", "<A-Down>", [[<C-\><C-N><C-w>-]], { desc = "Decrease height" })
map("t", "<A-Right>", [[<C-\><C-N><C-w>>]], { desc = "Increase width" })
map("t", "<A-Left>", [[<C-\><C-N><C-w><]], { desc = "Decrease width" })

-- ============================================================================
-- NvChad Terminal Integration
-- ============================================================================
-- Note: These mappings complement NvChad's default terminal bindings
-- NvChad defaults (preserved):
--   <leader>h - horizontal terminal
--   <leader>v - vertical terminal
--   Alt-i     - floating terminal
--   Alt-h     - horizontal terminal
--   Alt-v     - vertical terminal

local term = require "nvchad.term"

-- Enhanced terminal spawning with custom behavior
map("n", "<leader>th", function()
  term.toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "Toggle horizontal terminal" })

map("n", "<leader>tv", function()
  term.toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "Toggle vertical terminal" })

map("n", "<leader>tf", function()
  term.toggle { pos = "float", id = "floatTerm" }
end, { desc = "Toggle floating terminal" })

-- New terminal instances (don't toggle, always create new)
map("n", "<leader>tH", function()
  term.new { pos = "sp" }
end, { desc = "New horizontal terminal" })

map("n", "<leader>tV", function()
  term.new { pos = "vsp" }
end, { desc = "New vertical terminal" })

map("n", "<leader>tF", function()
  term.new { pos = "float" }
end, { desc = "New floating terminal" })

-- ============================================================================
-- Terminal Runners (Execute commands in terminal)
-- ============================================================================
-- Helper function to run command in terminal
local function run_in_terminal(cmd, term_type)
  term_type = term_type or "horizontal"
  term.send(cmd, term_type)
end

-- Language-specific runners
local runners = {
  python = "python3 %",
  javascript = "node %",
  typescript = "ts-node %",
  rust = "cargo run",
  go = "go run %",
  java = "javac % && java %:t:r",
  lua = "lua %",
  sh = "bash %",
  fish = "fish %",
  zsh = "zsh %",
}

-- Auto-detect and run current file
map("n", "<leader>tr", function()
  local ft = vim.bo.filetype
  local cmd = runners[ft]

  if cmd then
    -- Replace % with current file path
    cmd = cmd:gsub("%%", vim.fn.expand "%:p")
    run_in_terminal(cmd, "horizontal")
    vim.notify("Running: " .. cmd, vim.log.levels.INFO)
  else
    vim.notify("No runner configured for filetype: " .. ft, vim.log.levels.WARN)
  end
end, { desc = "Run current file" })

-- Custom command runner
map("n", "<leader>tR", function()
  local cmd = vim.fn.input "Run command: "
  if cmd ~= "" then
    run_in_terminal(cmd, "horizontal")
  end
end, { desc = "Run custom command" })

-- Build commands for common project types
map("n", "<leader>tb", function()
  local build_cmds = {
    rust = "cargo build",
    go = "go build",
    java = "mvn clean package",
    javascript = "npm run build",
    typescript = "npm run build",
  }

  local ft = vim.bo.filetype
  local cmd = build_cmds[ft]

  if cmd then
    run_in_terminal(cmd, "horizontal")
    vim.notify("Building project...", vim.log.levels.INFO)
  else
    -- Try generic build commands
    if vim.fn.filereadable "Makefile" == 1 then
      run_in_terminal("make", "horizontal")
    elseif vim.fn.filereadable "package.json" == 1 then
      run_in_terminal("npm run build", "horizontal")
    else
      vim.notify("No build command found", vim.log.levels.WARN)
    end
  end
end, { desc = "Build project" })

-- Test runners
map("n", "<leader>tt", function()
  local test_cmds = {
    rust = "cargo test",
    go = "go test ./...",
    java = "mvn test",
    javascript = "npm test",
    typescript = "npm test",
    python = "pytest",
  }

  local ft = vim.bo.filetype
  local cmd = test_cmds[ft]

  if cmd then
    run_in_terminal(cmd, "horizontal")
    vim.notify("Running tests...", vim.log.levels.INFO)
  else
    vim.notify("No test command configured", vim.log.levels.WARN)
  end
end, { desc = "Run tests" })

-- ============================================================================
-- Live Server Integration
-- ============================================================================
map("n", "<leader>ls", "<cmd>LiveServerStart<cr>", { desc = "Start live server" })
map("n", "<leader>lS", "<cmd>LiveServerStop<cr>", { desc = "Stop live server" })

-- ============================================================================
-- Terminal Utilities
-- ============================================================================
-- Quick terminal commands
map("n", "<leader>tg", function()
  run_in_terminal("lazygit", "float")
end, { desc = "LazyGit in terminal" })

map("n", "<leader>td", function()
  run_in_terminal("lazydocker", "float")
end, { desc = "LazyDocker in terminal" })

map("n", "<leader>tn", function()
  run_in_terminal("btm", "float") -- bottom (system monitor)
end, { desc = "System monitor" })

-- Toggle terminal size presets
map("t", "<leader>tm", function()
  vim.cmd "resize 20"
end, { desc = "Medium terminal height" })

map("t", "<leader>tl", function()
  vim.cmd "resize 30"
end, { desc = "Large terminal height" })

map("t", "<leader>ts", function()
  vim.cmd "resize 10"
end, { desc = "Small terminal height" })
