require "nvchad.mappings"

local map = vim.keymap.set

-- General
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Smart Tab (expression mapping for multi-step behavior)
map("i", "<Tab>", function()
  -- Check completion menu
  if vim.fn.pumvisible() == 1 then
    return "<C-n>"
  end
  
  -- Check if cursor is in whitespace
  local col = vim.fn.col "." - 1
  if col == 0 or vim.fn.getline("."):sub(col, col):match "%s" then
    return "<Tab>"
  end
  
  return "<Tab>"
end, { expr = true, desc = "Smart Tab" })

-- Smart Shift-Tab
map("i", "<S-Tab>", function()
  if vim.fn.pumvisible() == 1 then
    return "<C-p>"
  end
  return "<S-Tab>"
end, { expr = true, desc = "Smart Shift-Tab" })

-- Smart Enter
map("i", "<CR>", function()
  if vim.fn.pumvisible() == 1 then
    return "<C-y>"
  end
  return "<CR>"
end, { expr = true, desc = "Smart Enter" })

-- Conform formatting
map({ "n", "v" }, "<leader>cf", function()
  require("conform").format { async = true, lsp_fallback = true }
end, { desc = "Format Buffer" })

map({ "n", "v" }, "<leader>cF", function()
  require("conform").format { formatters = { "injected" } }
end, { desc = "Format Injected Langs" })

-- Flash
map({ "n", "x", "o" }, "s", function()
  require("flash").jump()
end, { desc = "Flash" })

map({ "n", "x", "o" }, "S", function()
  require("flash").treesitter()
end, { desc = "Flash Treesitter" })

map("o", "r", function()
  require("flash").remote()
end, { desc = "Remote Flash" })

map({ "o", "x" }, "R", function()
  require("flash").treesitter_search()
end, { desc = "Treesitter Search" })

-- Treesitter context
map("n", "<leader>ut", function()
  require("treesitter-context").toggle()
end, { desc = "Toggle Treesitter Context" })

map("n", "[c", function()
  require("treesitter-context").go_to_context(vim.v.count1)
end, { desc = "Jump to Context" })

map("n", "<leader>sk", "<cmd>ShowkeysToggle<CR>", { desc = "Toggle Showkeys" })

-- Lazygit
map("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "LazyGit" })
map("n", "<leader>gt", "<cmd>tabnew | LazyGit<CR>", { desc = "LazyGit (tab)" })
map("n", "<leader>gl", "<cmd>LazyGitLog<CR>", { desc = "Git Log" })
map("n", "<leader>gf", "<cmd>LazyGitFilterCurrentFile<CR>", { desc = "Git File History" })

-- Live Server
map("n", "<leader>ls", "<cmd>LiveServerStart<CR>", { desc = "Start Live Server" })
map("n", "<leader>lS", "<cmd>LiveServerStop<CR>", { desc = "Stop Live Server" })

-- Trouble
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
map("n", "<leader>xq", "<cmd>Trouble quickfix toggle<cr>", { desc = "Quickfix (Trouble)" })
map("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>", { desc = "Loclist (Trouble)" })
map("n", "gR", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "LSP References (Trouble)" })

map("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })
map("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })

-- Which-key
map("n", "<leader>?", function()
  require("which-key").show { global = false }
end, { desc = "Buffer Local Keymaps" })

-- Focus Mode
map("n", "<leader>zf", "<cmd>Twilight<cr>", { desc = "Toggle Focus Mode" })
map("n", "<leader>z", "<cmd>ZenMode<cr>", { desc = "Toggle Zen Mode" })

-- CodeCompanion
map("n", "<leader>aa", "<cmd>CodeCompanionActions<cr>", { desc = "AI Actions" })
map("v", "<leader>aa", "<cmd>CodeCompanionActions<cr>", { desc = "AI Actions" })
map("n", "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "Toggle AI Chat" })
map("v", "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "Toggle AI Chat" })
map("n", "<leader>ai", "<cmd>CodeCompanion<cr>", { desc = "Inline AI" })
map("v", "<leader>ai", "<cmd>CodeCompanion<cr>", { desc = "Inline AI" })
map("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { desc = "Add to AI Chat" })

-- DAP Debug
map("n", "<leader>dc", function()
  require("dap").continue()
end, { desc = "DAP Continue" })
map("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })
map("n", "<leader>dB", function()
  require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ")
end, { desc = "Conditional Breakpoint" })
map("n", "<leader>di", function()
  require("dap").step_into()
end, { desc = "Step Into" })
map("n", "<leader>do", function()
  require("dap").step_over()
end, { desc = "Step Over" })
map("n", "<leader>dO", function()
  require("dap").step_out()
end, { desc = "Step Out" })
map("n", "<leader>dC", function()
  require("dap").run_to_cursor()
end, { desc = "Run to Cursor" })
map("n", "<leader>dt", function()
  require("dap").terminate()
end, { desc = "Terminate" })
map("n", "<leader>dr", function()
  require("dap").restart()
end, { desc = "Restart" })
map("n", "<leader>dp", function()
  require("dap").pause()
end, { desc = "Pause" })
map("n", "<leader>du", function()
  require("dapui").toggle()
end, { desc = "Toggle DAP UI" })
map("n", "<leader>de", function()
  require("dapui").eval()
end, { desc = "Eval Expression" })
map("n", "<leader>dR", function()
  require("dap").repl.toggle()
end, { desc = "Toggle REPL" })
map("n", "<leader>df", function()
  require("dap").focus_frame()
end, { desc = "Focus Frame" })
map("n", "<leader>dL", function()
  require("dap").list_breakpoints()
end, { desc = "List Breakpoints" })
map("n", "<leader>dX", function()
  require("dap").clear_breakpoints()
end, { desc = "Clear Breakpoints" })
map("v", "<leader>de", function()
  require("dapui").eval()
end, { desc = "Eval Selection" })

-- Notifications
map("n", "<leader>un", function()
  require("notify").dismiss { silent = true, pending = true }
end, { desc = "Dismiss Notifications" })
map("n", "<leader>nh", "<cmd>Telescope notify<cr>", { desc = "Notification History" })

-- Buffer Navigation
local buf_utils = require "utils.buffers"
map("n", "<A-,>", "<Cmd>bprevious<CR>", { desc = "Previous Buffer" })
map("n", "<A-.>", "<Cmd>bnext<CR>", { desc = "Next Buffer" })

for i = 1, 9 do
  map("n", "<A-" .. i .. ">", function()
    buf_utils.goto_buffer(i)
  end, { desc = "Go to Buffer " .. i })
end
map("n", "<A-0>", buf_utils.goto_last_buffer, { desc = "Last Buffer" })
map("n", "<A-c>", "<Cmd>Bdelete<CR>", { desc = "Close Buffer" })
map("n", "<C-p>", "<Cmd>Telescope buffers<CR>", { desc = "Buffer Picker" })

-- Theme Management
map("n", "<leader>uh", function()
  require("nvchad.themes").open()
end, { desc = "Theme Selector" })

map("n", "<leader>ut", function()
  local base46 = require("nvconfig").base46
  local themes = base46.theme_toggle
  local current = base46.theme
  local next = (current == themes[1]) and themes[2] or themes[1]
  base46.theme = next
  require("base46").load_all_highlights()
  vim.notify("Theme switched to " .. next)
end, { desc = "Toggle Theme" })

map("n", "<leader>ui", function()
  local config = require("nvconfig").base46
  config.transparency = not config.transparency
  require("base46").load_all_highlights()
end, { desc = "Toggle Transparency" })

-- Tab Management
map("n", "<leader>tn", ":tabnew<CR>", { desc = "New Tab" })
map("n", "<leader>tc", ":tabclose<CR>", { desc = "Close Tab" })
map("n", "<leader>tl", ":tabnext<CR>", { desc = "Next Tab" })
map("n", "<leader>th", ":tabprevious<CR>", { desc = "Previous Tab" })
map("n", "<leader>t0", ":tabfirst<CR>", { desc = "First Tab" })
map("n", "<leader>t$", ":tablast<CR>", { desc = "Last Tab" })
map("n", "<leader>t<", ":-tabmove<CR>", { desc = "Move Tab Left" })
map("n", "<leader>t>", ":+tabmove<CR>", { desc = "Move Tab Right" })

-- Window Management
map("n", "<leader>-", "<C-W>s", { desc = "Split Below" })
map("n", "<leader>|", "<C-W>v", { desc = "Split Right" })
map("n", "<M-=>", "<cmd>resize +2<cr>", { desc = "Increase Height" })
map("n", "<M-->", "<cmd>resize -2<cr>", { desc = "Decrease Height" })
map("n", "<M-.>", "<cmd>vertical resize +2<cr>", { desc = "Increase Width" })
map("n", "<M-,>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Width" })

-- Terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "Exit Terminal Mode" })
map("n", "<leader>h", "<cmd>Sterm<cr>", { desc = "Horizontal Term" })
map("n", "<leader>v", "<cmd>Vterm<cr>", { desc = "Vertical Term" })
map({ "n", "t" }, "<A-v>", "<cmd>Vterm<cr>", { desc = "Vertical Term" })
map({ "n", "t" }, "<A-h>", "<cmd>Sterm<cr>", { desc = "Horizontal Term" })
map({ "n", "t" }, "<A-i>", "<cmd>Fterm<cr>", { desc = "Floating Term" })
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Close Terminal" })
map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

-- Terminal navigation
map("t", "<C-h>", [[<C-\><C-N><C-w>h]], { desc = "Window Left" })
map("t", "<C-j>", [[<C-\><C-N><C-w>j]], { desc = "Window Down" })
map("t", "<C-k>", [[<C-\><C-N><C-w>k]], { desc = "Window Up" })
map("t", "<C-l>", [[<C-\><C-N><C-w>l]], { desc = "Window Right" })

-- Terminal resize
map("t", "<A-Left>", [[<C-\><C-N><C-w><]], { desc = "Decrease Width" })
map("t", "<A-Right>", [[<C-\><C-N><C-w>>]], { desc = "Increase Width" })
map("t", "<A-Up>", [[<C-\><C-N><C-w>+]], { desc = "Increase Height" })
map("t", "<A-Down>", [[<C-\><C-N><C-w>-]], { desc = "Decrease Height" })
