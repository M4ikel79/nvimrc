-- lua/keymaps/core.lua
-- Core editor mappings using mini.keymap
-- Handles fundamental editing, navigation, and window management

local map_multistep = require("mini.keymap").map_multistep

-- ============================================================================
-- Insert Mode Intelligence
-- ============================================================================
-- Smart Tab navigation and completion
map_multistep("i", "<Tab>", {
  "pmenu_next",
  "minisnippets_next",
  "minisnippets_expand",
  "jump_after_tsnode",
  "jump_after_close",
})

map_multistep("i", "<S-Tab>", {
  "pmenu_prev",
  "minisnippets_prev",
  "jump_before_tsnode",
  "jump_before_open",
})

-- Smart Enter - respects completion and pairs
map_multistep("i", "<CR>", {
  "pmenu_accept",
  "minipairs_cr",
})

-- Smart Backspace - respects pairs
map_multistep("i", "<BS>", {
  "minipairs_bs",
  "hungry_bs",
})

-- Better escape combos
local map_combo = require("mini.keymap").map_combo
local escape_modes = { "i", "c", "x", "s" }
map_combo(escape_modes, "jk", "<BS><BS><Esc>")
map_combo(escape_modes, "kj", "<BS><BS><Esc>")

-- Terminal mode escape
map_combo("t", "jk", "<BS><BS><C-\\><C-n>")
map_combo("t", "kj", "<BS><BS><C-\\><C-n>")

-- ============================================================================
-- Normal Mode - Enhanced Navigation
-- ============================================================================
local map = vim.keymap.set

-- Command mode shortcut
map("n", ";", ":", { desc = "Enter command mode" })

-- Better line navigation
map({ "n", "x" }, "H", "^", { desc = "Go to line start" })
map({ "n", "x" }, "L", "$", { desc = "Go to line end" })

-- Window navigation (tmux-aware)
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Window left" })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Window down" })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Window up" })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Window right" })

-- Window resizing
map("n", "<M-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<M-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<M-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
map("n", "<M-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })

-- Window splits
map("n", "<leader>-", "<C-W>s", { desc = "Split window below" })
map("n", "<leader>|", "<C-W>v", { desc = "Split window right" })
map("n", "<leader>wd", "<C-W>c", { desc = "Close window" })
map("n", "<leader>w=", "<C-W>=", { desc = "Equalize window sizes" })
map("n", "<leader>wo", "<C-W>o", { desc = "Close other windows" })
map("n", "<leader>wh", "<C-W>H", { desc = "Move window to far left" })
map("n", "<leader>wj", "<C-W>J", { desc = "Move window to bottom" })
map("n", "<leader>wk", "<C-W>K", { desc = "Move window to top" })
map("n", "<leader>wl", "<C-W>L", { desc = "Move window to far right" })

-- ============================================================================
-- Buffer Management
-- ============================================================================
local buf_utils = require "keymaps.utils"

-- Buffer navigation
map("n", "<A-,>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
map("n", "<A-.>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<A-c>", "<cmd>Bdelete<cr>", { desc = "Close buffer" })
map("n", "<C-p>", "<cmd>Telescope buffers<cr>", { desc = "Buffer picker" })

-- Quick buffer access (Alt+1 through Alt+9)
for i = 1, 9, 1 do
  vim.keymap.set("n", string.format("<A-%s>", i), function()
    vim.api.nvim_set_current_buf(vim.t.bufs[i])
  end)
end
map("n", "<A-0>", buf_utils.goto_last_buffer, { desc = "Last buffer" })

-- ============================================================================
-- File Operations & Quit Commands
-- ============================================================================
-- Safe quit commands
map("n", "<leader>q", function()
  local modified = vim.bo.modified
  if modified then
    local choice = vim.fn.confirm("Buffer has unsaved changes. Save before closing?", "&Yes\n&No\n&Cancel", 3)
    if choice == 1 then
      vim.cmd "write | quit"
    elseif choice == 2 then
      vim.cmd "quit!"
    end
  else
    vim.cmd "quit"
  end
end, { desc = "Safe quit" })

map("n", "<leader>Q", "<cmd>quit!<cr>", { desc = "Force quit" })
map("n", "<leader>qa", "<cmd>quitall<cr>", { desc = "Quit all" })
map("n", "<leader>qA", "<cmd>quitall!<cr>", { desc = "Force quit all" })
map("n", "<leader>wq", "<cmd>wqall<cr>", { desc = "Write and quit all" })

-- Save shortcuts
map({ "n", "i", "v" }, "<C-s>", "<cmd>write<cr><esc>", { desc = "Save file" })
map("n", "<leader>w", "<cmd>write<cr>", { desc = "Save file" })
map("n", "<leader>W", "<cmd>wall<cr>", { desc = "Save all files" })

-- ============================================================================
-- Visual Mode Enhancements
-- ============================================================================
-- Better indenting (keeps selection)
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })

-- Move lines (uses mini.move)
map("v", "<S-j>", ":m '>+1<cr>gv=gv", { desc = "Move selection down" })
map("v", "<S-k>", ":m '<-2<cr>gv=gv", { desc = "Move selection up" })

-- Paste without yanking in visual mode
map("v", "p", '"_dP', { desc = "Paste without yank" })

-- ============================================================================
-- Search & Replace
-- ============================================================================
-- Clear search highlighting
map("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })

-- Better search navigation
map("n", "n", "nzzzv", { desc = "Next search result (centered)" })
map("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })

-- Quick replace word under cursor
map("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word under cursor" })

-- ============================================================================
-- Miscellaneous
-- ============================================================================
-- Better join (keeps cursor position)
map("n", "J", "mzJ`z", { desc = "Join lines" })

-- Center screen on navigation
map("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- Quickfix navigation
map("n", "]q", "<cmd>cnext<cr>zz", { desc = "Next quickfix" })
map("n", "[q", "<cmd>cprev<cr>zz", { desc = "Previous quickfix" })

-- Location list navigation
map("n", "]l", "<cmd>lnext<cr>zz", { desc = "Next location" })
map("n", "[l", "<cmd>lprev<cr>zz", { desc = "Previous location" })

-- Toggle options
map("n", "<leader>uw", "<cmd>set wrap!<cr>", { desc = "Toggle line wrap" })
map("n", "<leader>us", "<cmd>set spell!<cr>", { desc = "Toggle spell check" })
map("n", "<leader>un", "<cmd>set relativenumber!<cr>", { desc = "Toggle relative numbers" })

-- Diagnostic navigation
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic" })

-- ============================================================================
-- Tab Management
-- ============================================================================
map("n", "<leader>tn", "<cmd>enew<cr>", { desc = "New tab" })
map("n", "<leader>tc", "<cmd>tabclose<cr>", { desc = "Close tab" })
map("n", "<leader>tl", "<cmd>tabnext<cr>", { desc = "Next tab" })
map("n", "<leader>th", "<cmd>tabprevious<cr>", { desc = "Previous tab" })
map("n", "<leader>t0", "<cmd>tabfirst<cr>", { desc = "First tab" })
map("n", "<leader>t$", "<cmd>tablast<cr>", { desc = "Last tab" })
