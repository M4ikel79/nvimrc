-- lua/keymaps/plugins.lua
-- Plugin-specific keymaps (non-LSP, non-Git, non-Terminal)
-- Uses vim.keymap.set for all plugin integrations

local map = vim.keymap.set

-- ============================================================================
-- Flash - Enhanced Navigation
-- ============================================================================
map({ "n", "x", "o" }, "s", function()
  require("flash").jump()
end, { desc = "Flash jump" })

map({ "n", "x", "o" }, "S", function()
  require("flash").treesitter()
end, { desc = "Flash treesitter" })

map("o", "r", function()
  require("flash").remote()
end, { desc = "Remote flash" })

map({ "o", "x" }, "R", function()
  require("flash").treesitter_search()
end, { desc = "Treesitter search" })

-- ============================================================================
-- Telescope - Fuzzy Finder
-- ============================================================================
local telescope = require "telescope.builtin"

-- File pickers
map("n", "<leader>ff", telescope.find_files, { desc = "Find files" })
map("n", "<leader>fa", function()
  telescope.find_files { hidden = true, no_ignore = true }
end, { desc = "Find all files" })
map("n", "<leader>fr", telescope.oldfiles, { desc = "Recent files" })
map("n", "<leader>fb", telescope.buffers, { desc = "Find buffers" })

-- Search
map("n", "<leader>fw", telescope.live_grep, { desc = "Live grep" })
map("n", "<leader>fW", function()
  telescope.live_grep {
    additional_args = function()
      return { "--hidden", "--no-ignore" }
    end,
  }
end, { desc = "Live grep (all)" })
map("n", "<leader>fg", telescope.grep_string, { desc = "Grep string" })
map("n", "<leader>fG", function()
  local word = vim.fn.expand "<cword>"
  telescope.grep_string { search = word }
end, { desc = "Grep word under cursor" })

-- Vim pickers
map("n", "<leader>fh", telescope.help_tags, { desc = "Help tags" })
map("n", "<leader>fm", telescope.marks, { desc = "Marks" })
map("n", "<leader>fk", telescope.keymaps, { desc = "Keymaps" })
map("n", "<leader>fc", telescope.commands, { desc = "Commands" })
map("n", "<leader>fC", telescope.command_history, { desc = "Command history" })
map("n", "<leader>fs", telescope.search_history, { desc = "Search history" })
map("n", "<leader>fj", telescope.jumplist, { desc = "Jumplist" })
map("n", "<leader>fR", telescope.registers, { desc = "Registers" })
map("n", "<leader>fo", telescope.vim_options, { desc = "Vim options" })

-- Advanced pickers
map("n", "<leader>fp", telescope.treesitter, { desc = "Treesitter symbols" })
map("n", "<leader>fq", telescope.quickfix, { desc = "Quickfix" })
map("n", "<leader>fl", telescope.loclist, { desc = "Location list" })
map("n", "<leader>fd", telescope.diagnostics, { desc = "Diagnostics" })

-- NvChad specific
map("n", "<leader>ft", "<cmd>Telescope themes<cr>", { desc = "Themes" })
map("n", "<leader>fn", "<cmd>Telescope notify<cr>", { desc = "Notifications" })

-- ============================================================================
-- NvimTree - File Explorer
-- ============================================================================
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file explorer" })
map("n", "<leader>E", "<cmd>NvimTreeFindFile<cr>", { desc = "Find file in explorer" })
map("n", "<leader>eo", "<cmd>NvimTreeFocus<cr>", { desc = "Focus file explorer" })
map("n", "<leader>ec", "<cmd>NvimTreeCollapse<cr>", { desc = "Collapse explorer" })
map("n", "<leader>er", "<cmd>NvimTreeRefresh<cr>", { desc = "Refresh explorer" })

-- ============================================================================
-- CodeCompanion - AI Assistant
-- ============================================================================
map("n", "<leader>aa", "<cmd>CodeCompanionActions<cr>", { desc = "AI actions" })
map("v", "<leader>aa", "<cmd>CodeCompanionActions<cr>", { desc = "AI actions" })
map("n", "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "Toggle AI chat" })
map("v", "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "Toggle AI chat" })
map("n", "<leader>a-", "<cmd>CodeCompanion<cr>", { desc = "Inline AI" })
map("v", "<leader>a-", "<cmd>CodeCompanion<cr>", { desc = "Inline AI" })
map("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { desc = "Add to AI chat" })

-- Quick AI prompts
map("n", "<leader>ae", function()
  vim.cmd "CodeCompanionChat"
  vim.defer_fn(function()
    vim.api.nvim_feedkeys("Explain this code", "n", false)
  end, 100)
end, { desc = "AI: Explain code" })

map("n", "<leader>af", function()
  vim.cmd "CodeCompanionChat"
  vim.defer_fn(function()
    vim.api.nvim_feedkeys("Fix this code", "n", false)
  end, 100)
end, { desc = "AI: Fix code" })

map("n", "<leader>ao", function()
  vim.cmd "CodeCompanionChat"
  vim.defer_fn(function()
    vim.api.nvim_feedkeys("Optimize this code", "n", false)
  end, 100)
end, { desc = "AI: Optimize code" })

-- ============================================================================
-- Zen Mode & Focus
-- ============================================================================
map("n", "<leader>z", "<cmd>ZenMode<cr>", { desc = "Toggle zen mode" })
map("n", "<leader>zf", "<cmd>Twilight<cr>", { desc = "Toggle focus mode" })

-- ============================================================================
-- Notifications
-- ============================================================================
map("n", "<leader>un", function()
  require("notify").dismiss { silent = true, pending = true }
end, { desc = "Dismiss notifications" })

map("n", "<leader>nh", "<cmd>Telescope notify<cr>", { desc = "Notification history" })

-- ============================================================================
-- Showkeys - Key Display
-- ============================================================================
map("n", "<leader>sk", "<cmd>ShowkeysToggle<cr>", { desc = "Toggle showkeys" })

-- ============================================================================
-- Todo Comments
-- ============================================================================
map("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

map("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

map("n", "<leader>st", "<cmd>TodoTelescope<cr>", { desc = "Todo comments" })
map("n", "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", { desc = "Todo/Fix comments" })

-- ============================================================================
-- Obsidian (Markdown Notes)
-- ============================================================================
map("n", "<leader>on", "<cmd>ObsidianNew<cr>", { desc = "New note" })
map("n", "<leader>oo", "<cmd>ObsidianOpen<cr>", { desc = "Open in Obsidian" })
map("n", "<leader>os", "<cmd>ObsidianSearch<cr>", { desc = "Search notes" })
map("n", "<leader>oq", "<cmd>ObsidianQuickSwitch<cr>", { desc = "Quick switch note" })
map("n", "<leader>ot", "<cmd>ObsidianToday<cr>", { desc = "Today's note" })
map("n", "<leader>oy", "<cmd>ObsidianYesterday<cr>", { desc = "Yesterday's note" })
map("n", "<leader>ob", "<cmd>ObsidianBacklinks<cr>", { desc = "Show backlinks" })
map("n", "<leader>ol", "<cmd>ObsidianLinks<cr>", { desc = "Show links" })
map("n", "<leader>ow", "<cmd>ObsidianWorkspace<cr>", { desc = "Switch workspace" })

-- Toggle checkbox in Obsidian
map("n", "<leader>oc", function()
  require("obsidian").util.toggle_checkbox()
end, { desc = "Toggle checkbox" })

-- ============================================================================
-- Markdown Preview
-- ============================================================================
map("n", "<leader>mp", "<cmd>MarkdownPreview<cr>", { desc = "Markdown preview" })
map("n", "<leader>ms", "<cmd>MarkdownPreviewStop<cr>", { desc = "Stop markdown preview" })
map("n", "<leader>mt", "<cmd>MarkdownPreviewToggle<cr>", { desc = "Toggle markdown preview" })

-- ============================================================================
-- Visual Multi (Multiple Cursors)
-- ============================================================================
-- Note: VM has its own default mappings, these are supplements
map("n", "<leader>ma", "\\\\A", { desc = "Select all occurrences", remap = true })
map("n", "<leader>m/", "\\\\/", { desc = "Start regex search", remap = true })
map("x", "<leader>ma", "\\\\a", { desc = "Add visual selection", remap = true })

-- ============================================================================
-- Miscellaneous Plugin Mappings
-- ============================================================================
-- Lazy plugin manager
map("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy plugin manager" })
map("n", "<leader>Lu", "<cmd>Lazy update<cr>", { desc = "Update plugins" })
map("n", "<leader>Ls", "<cmd>Lazy sync<cr>", { desc = "Sync plugins" })
map("n", "<leader>Lc", "<cmd>Lazy clean<cr>", { desc = "Clean plugins" })
map("n", "<leader>Lp", "<cmd>Lazy profile<cr>", { desc = "Profile startup" })

-- Mason LSP installer
map("n", "<leader>M", "<cmd>Mason<cr>", { desc = "Mason installer" })

-- WhichKey
map("n", "<leader>?", function()
  require("which-key").show { global = false }
end, { desc = "Buffer keymaps" })

-- Origami (folding)
map("n", "za", "za", { desc = "Toggle fold" })
map("n", "zA", "zA", { desc = "Toggle fold recursively" })
map("n", "zc", "zc", { desc = "Close fold" })
map("n", "zC", "zC", { desc = "Close all folds" })
map("n", "zo", "zo", { desc = "Open fold" })
map("n", "zO", "zO", { desc = "Open all folds" })
map("n", "zr", "zr", { desc = "Reduce fold level" })
map("n", "zR", "zR", { desc = "Open all folds" })
map("n", "zm", "zm", { desc = "Fold more" })
map("n", "zM", "zM", { desc = "Close all folds" })

-- Neoscroll (smooth scrolling) - uses default bindings, no custom maps needed

-- Paint (highlight patterns) - uses default settings, no custom maps needed
