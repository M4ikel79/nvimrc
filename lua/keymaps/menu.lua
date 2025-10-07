-- lua/keymaps/menu.lua
-- Menu system keybindings with context awareness

local map = vim.keymap.set

-- ============================================================================
-- Context-Aware Menu (Primary binding)
-- ============================================================================

-- Keyboard shortcut - detects context automatically
map("n", "<C-Space>", function()
  require("configs.menu_manager").open_context_menu()
end, { desc = "Context menu" })

map("v", "<C-Space>", function()
  require("configs.menu_manager").open_context_menu()
end, { desc = "Context menu" })

-- Right-click support - also context-aware
map({ "n", "v" }, "<RightMouse>", function()
  -- Clean up any old menus first
  local state = require "menu.state"
  if #state.bufids > 0 then
    vim.api.nvim_buf_call(state.bufids[1], function()
      vim.api.nvim_feedkeys("q", "x", false)
    end)
  end

  -- Execute the right-click
  vim.cmd.exec '"normal! \\<RightMouse>"'

  -- Open context-aware menu at mouse position
  require("configs.menu_manager").open_context_menu { mouse = true }
end, { desc = "Context menu" })

-- ============================================================================
-- Direct Menu Access (For manual control)
-- ============================================================================

-- Leader-based menu shortcuts for direct access
map("n", "<leader>m", function()
  require("configs.menu_manager").open_context_menu()
end, { desc = "Open context menu" })

-- Specific menu shortcuts
map("n", "<leader>md", function()
  require("configs.menu_manager").open_debug_menu()
end, { desc = "Debug menu" })

map("n", "<leader>mg", function()
  require("configs.menu_manager").open_git_menu()
end, { desc = "Git menu" })

map("n", "<leader>mc", function()
  require("configs.menu_manager").open_colors_menu()
end, { desc = "Colors menu" })

map("n", "<leader>mm", function()
  require("configs.menu_manager").open_markdown_menu()
end, { desc = "Markdown menu", ft = "markdown" })

map("n", "<leader>mw", function()
  require("configs.menu_manager").open_webdev_menu()
end, { desc = "Web dev menu" })

-- ============================================================================
-- Quick Actions (Frequently used menu items as direct shortcuts)
-- ============================================================================

-- Web development
map("n", "<leader>ls", "<cmd>LiveServerStart<cr>", { desc = "Start live server" })
map("n", "<leader>lS", "<cmd>LiveServerStop<cr>", { desc = "Stop live server" })

-- Markdown
map("n", "<leader>mp", "<cmd>MarkdownPreview<cr>", { desc = "Markdown preview", ft = "markdown" })
map("n", "<leader>ms", "<cmd>MarkdownPreviewStop<cr>", { desc = "Stop preview", ft = "markdown" })

-- Debug shortcuts
map("n", "<F5>", function()
  require("dap").continue()
end, { desc = "Debug: Start/Continue" })

map("n", "<F9>", function()
  require("dap").toggle_breakpoint()
end, { desc = "Debug: Toggle breakpoint" })

map("n", "<F10>", function()
  require("dap").step_over()
end, { desc = "Debug: Step over" })

map("n", "<F11>", function()
  require("dap").step_into()
end, { desc = "Debug: Step into" })

map("n", "<F12>", function()
  require("dap").step_out()
end, { desc = "Debug: Step out" })

-- Color tools shortcuts
map("n", "<leader>ch", function()
  require("minty.huefy").open()
end, { desc = "Huefy color picker" })

map("n", "<leader>cs", function()
  require("minty.shades").open()
end, { desc = "Shades generator" })
