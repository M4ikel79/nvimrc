-- lua/keymaps/git.lua
-- Git-related keymaps (LazyGit, Gitsigns, etc.)
-- Uses vim.keymap.set for plugin-specific bindings

local map = vim.keymap.set

-- ============================================================================
-- LazyGit Integration
-- ============================================================================
map("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })
map("n", "<leader>gG", "<cmd>tabnew | LazyGit<cr>", { desc = "LazyGit (new tab)" })
map("n", "<leader>gl", "<cmd>LazyGitLog<cr>", { desc = "Git log" })
map("n", "<leader>gf", "<cmd>LazyGitFilterCurrentFile<cr>", { desc = "Git file history" })
map("n", "<leader>gc", "<cmd>LazyGitCurrentFile<cr>", { desc = "LazyGit current file" })
map("n", "<leader>gC", "<cmd>LazyGitConfig<cr>", { desc = "LazyGit config" })

-- ============================================================================
-- Gitsigns (Inline Git Operations)
-- ============================================================================
local gitsigns = require "gitsigns"

-- Navigation
map("n", "]h", function()
  if vim.wo.diff then
    vim.cmd.normal { "]c", bang = true }
  else
    gitsigns.nav_hunk "next"
  end
end, { desc = "Next git hunk" })

map("n", "[h", function()
  if vim.wo.diff then
    vim.cmd.normal { "[c", bang = true }
  else
    gitsigns.nav_hunk "prev"
  end
end, { desc = "Previous git hunk" })

-- Hunk actions
map("n", "<leader>gs", gitsigns.stage_hunk, { desc = "Stage hunk" })
map("v", "<leader>gs", function()
  gitsigns.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
end, { desc = "Stage hunk" })

map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "Reset hunk" })
map("v", "<leader>gr", function()
  gitsigns.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
end, { desc = "Reset hunk" })

map("n", "<leader>gS", gitsigns.stage_buffer, { desc = "Stage buffer" })
map("n", "<leader>gu", gitsigns.undo_stage_hunk, { desc = "Undo stage hunk" })
map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "Reset buffer" })

-- Preview & Info
map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "Preview hunk" })
map("n", "<leader>gP", gitsigns.preview_hunk_inline, { desc = "Preview hunk inline" })
map("n", "<leader>gb", function()
  gitsigns.blame_line { full = true }
end, { desc = "Blame line" })
map("n", "<leader>gB", gitsigns.toggle_current_line_blame, { desc = "Toggle line blame" })
map("n", "<leader>gd", gitsigns.diffthis, { desc = "Diff this" })
map("n", "<leader>gD", function()
  gitsigns.diffthis "~"
end, { desc = "Diff this ~" })

-- Toggle options
map("n", "<leader>gtd", gitsigns.toggle_deleted, { desc = "Toggle deleted lines" })
map("n", "<leader>gtw", gitsigns.toggle_word_diff, { desc = "Toggle word diff" })
map("n", "<leader>gtl", gitsigns.toggle_linehl, { desc = "Toggle line highlight" })
map("n", "<leader>gtn", gitsigns.toggle_numhl, { desc = "Toggle number highlight" })
map("n", "<leader>gts", gitsigns.toggle_signs, { desc = "Toggle signs" })

-- Text objects
map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<cr>", { desc = "Select hunk" })

-- ============================================================================
-- Git Telescope Integration
-- ============================================================================
map("n", "<leader>gt", "<cmd>Telescope git_status<cr>", { desc = "Git status" })
map("n", "<leader>gm", "<cmd>Telescope git_commits<cr>", { desc = "Git commits" })
map("n", "<leader>gM", "<cmd>Telescope git_bcommits<cr>", { desc = "Buffer commits" })
map("n", "<leader>gT", "<cmd>Telescope git_branches<cr>", { desc = "Git branches" })
map("n", "<leader>go", "<cmd>Telescope git_stash<cr>", { desc = "Git stash" })

-- ============================================================================
-- Quick Git Commands
-- ============================================================================
-- Push/Pull shortcuts (requires user confirmation)
map("n", "<leader>gPs", function()
  vim.cmd "Git push"
  vim.notify("Pushing changes...", vim.log.levels.INFO)
end, { desc = "Git push" })

map("n", "<leader>gPl", function()
  vim.cmd "Git pull"
  vim.notify("Pulling changes...", vim.log.levels.INFO)
end, { desc = "Git pull" })

map("n", "<leader>gPf", function()
  local confirm = vim.fn.confirm("Force push? This can overwrite remote changes!", "&Yes\n&No", 2)
  if confirm == 1 then
    vim.cmd "Git push --force"
    vim.notify("Force pushing...", vim.log.levels.WARN)
  end
end, { desc = "Git force push" })

-- Quick commit
map("n", "<leader>gcc", function()
  local msg = vim.fn.input "Commit message: "
  if msg ~= "" then
    vim.cmd('Git commit -m "' .. msg .. '"')
    vim.notify("Committed: " .. msg, vim.log.levels.INFO)
  end
end, { desc = "Quick commit" })

-- Amend last commit
map("n", "<leader>gca", function()
  vim.cmd "Git commit --amend"
end, { desc = "Amend last commit" })
