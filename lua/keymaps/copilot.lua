-- lua/keymaps/copilot.lua
-- GitHub Copilot keymaps with <leader>ai as the main prefix
-- Uses vim.keymap.set for plugin-specific bindings

local map = vim.keymap.set

-- ============================================================================
-- Copilot Acceptance Maps (Insert Mode)
-- ============================================================================
-- Accept entire suggestion with Ctrl-G (similar to other IDEs)
map("i", "<C-g>", 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
  desc = "Accept Copilot suggestion",
})

-- Accept word-by-word with Ctrl-Right or Alt-Right
map("i", "<M-Right>", "<Plug>(copilot-accept-word)", {
  desc = "Accept next word",
})
map("i", "<C-Right>", "<Plug>(copilot-accept-word)", {
  desc = "Accept next word",
})

-- Accept line-by-line with Ctrl-Alt-Right
map("i", "<M-C-Right>", "<Plug>(copilot-accept-line)", {
  desc = "Accept next line",
})

-- ============================================================================
-- Copilot Navigation (Insert Mode)
-- ============================================================================
-- Cycle through suggestions
map("i", "<M-]>", "<Plug>(copilot-next)", {
  desc = "Next Copilot suggestion",
})
map("i", "<M-[>", "<Plug>(copilot-previous)", {
  desc = "Previous Copilot suggestion",
})

-- Dismiss current suggestion
map("i", "<C-]>", "<Plug>(copilot-dismiss)", {
  desc = "Dismiss Copilot suggestion",
})

-- Explicitly request suggestion
map("i", "<M-\\>", "<Plug>(copilot-suggest)", {
  desc = "Request Copilot suggestion",
})

-- ============================================================================
-- Copilot Management (Normal Mode) - Main Prefix: <leader>ai
-- ============================================================================
-- Note: <leader>aa is already used by CodeCompanion
-- We use <leader>ai for Copilot (AI = Assisted Intelligence)

-- Copilot Panel (shows multiple suggestions)
map("n", "<leader>aip", "<cmd>Copilot panel<cr>", {
  desc = "Copilot panel",
})

-- Copilot Status
map("n", "<leader>ais", "<cmd>Copilot status<cr>", {
  desc = "Copilot status",
})

-- Enable/Disable Copilot
map("n", "<leader>aie", "<cmd>Copilot enable<cr>", {
  desc = "Enable Copilot",
})
map("n", "<leader>aid", "<cmd>Copilot disable<cr>", {
  desc = "Disable Copilot",
})

-- Toggle Copilot (custom function)
map("n", "<leader>ait", function()
  if vim.g.copilot_enabled == false then
    vim.cmd "Copilot enable"
    vim.notify("Copilot enabled", vim.log.levels.INFO)
  else
    vim.cmd "Copilot disable"
    vim.notify("Copilot disabled", vim.log.levels.INFO)
  end
end, {
  desc = "Toggle Copilot",
})

-- Copilot Setup (authentication)
map("n", "<leader>aiS", "<cmd>Copilot setup<cr>", {
  desc = "Copilot setup",
})

-- Copilot Sign out
map("n", "<leader>aio", "<cmd>Copilot signout<cr>", {
  desc = "Copilot signout",
})

-- Copilot Version
map("n", "<leader>aiv", "<cmd>Copilot version<cr>", {
  desc = "Copilot version",
})

-- Copilot Feedback
map("n", "<leader>aif", "<cmd>Copilot feedback<cr>", {
  desc = "Copilot feedback",
})

-- ============================================================================
-- Buffer-specific Copilot Control
-- ============================================================================
-- Disable Copilot for current buffer
map("n", "<leader>aiD", function()
  vim.b.copilot_enabled = false
  vim.notify("Copilot disabled for this buffer", vim.log.levels.INFO)
end, {
  desc = "Disable Copilot (buffer)",
})

-- Enable Copilot for current buffer
map("n", "<leader>aiE", function()
  vim.b.copilot_enabled = true
  vim.notify("Copilot enabled for this buffer", vim.log.levels.INFO)
end, {
  desc = "Enable Copilot (buffer)",
})

-- ============================================================================
-- Quick Access Shortcuts
-- ============================================================================
-- Quick panel access (alternative to <leader>aip)
map("n", "<leader>ap", "<cmd>Copilot panel<cr>", {
  desc = "Copilot panel",
})

-- Quick toggle (alternative to <leader>ait)
map("n", "<leader>at", function()
  if vim.g.copilot_enabled == false then
    vim.cmd "Copilot enable"
    vim.notify("Copilot enabled", vim.log.levels.INFO)
  else
    vim.cmd "Copilot disable"
    vim.notify("Copilot disabled", vim.log.levels.INFO)
  end
end, {
  desc = "Toggle Copilot",
})

-- ============================================================================
-- Visual Mode - Get suggestions for selection
-- ============================================================================
map("v", "<leader>ais", "<Plug>(copilot-suggest)", {
  desc = "Request Copilot suggestion",
})
