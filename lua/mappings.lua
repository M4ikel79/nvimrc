require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--

-- Start Live Server
vim.keymap.set("n", "<leader>ls", "<cmd>LiveServerStart<CR>", { desc = "Start Live Server" })

-- Stop Live Server
vim.keymap.set("n", "<leader>lS", "<cmd>LiveServerStop<CR>", { desc = "Stop Live Server" })

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

map("c", "<C-s>", function()
  require("flash").toggle()
end, { desc = "Toggle Flash Search" })

-- Treesitter context
map("n", "<leader>ut", function()
  require("treesitter-context").toggle()
end, { desc = "Toggle Treesitter Context" })

map("n", "[c", function()
  require("treesitter-context").go_to_context(vim.v.count1)
end, { desc = "Jump to Context" })

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
end, { desc = "Buffer Local Keymaps (which-key)" })

-- FocusMode
map("n", "<leader>zf", "<cmd>Twilight<cr>", { desc = "Toggle Focus Mode" })

-- ZenMode
map("n", "<leader>z", "<cmd>ZenMode<cr>", { desc = "Toggle Zen Mode" })

-- CodeCompanion mappings
map("n", "<leader>aa", "<cmd>CodeCompanionActions<cr>", { desc = "CodeCompanion Actions" })
map("v", "<leader>aa", "<cmd>CodeCompanionActions<cr>", { desc = "CodeCompanion Actions" })
map("n", "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "Toggle Chat" })
map("v", "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "Toggle Chat" })
map("n", "<leader>ai", "<cmd>CodeCompanion<cr>", { desc = "Inline CodeCompanion" })
map("v", "<leader>ai", "<cmd>CodeCompanion<cr>", { desc = "Inline CodeCompanion" })
map("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { desc = "Add to Chat" })

-- Debug session control
vim.keymap.set("n", "<leader>dc", function()
  require("dap").continue()
end, { desc = "DAP Continue" })
vim.keymap.set("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "DAP Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dB", function()
  require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ")
end, { desc = "DAP Conditional Breakpoint" })

-- Stepping
vim.keymap.set("n", "<leader>di", function()
  require("dap").step_into()
end, { desc = "DAP Step Into" })
vim.keymap.set("n", "<leader>do", function()
  require("dap").step_over()
end, { desc = "DAP Step Over" })
vim.keymap.set("n", "<leader>dO", function()
  require("dap").step_out()
end, { desc = "DAP Step Out" })
vim.keymap.set("n", "<leader>dC", function()
  require("dap").run_to_cursor()
end, { desc = "DAP Run to Cursor" })

-- Session management
vim.keymap.set("n", "<leader>dt", function()
  require("dap").terminate()
end, { desc = "DAP Terminate" })
vim.keymap.set("n", "<leader>dr", function()
  require("dap").restart()
end, { desc = "DAP Restart" })
vim.keymap.set("n", "<leader>dp", function()
  require("dap").pause()
end, { desc = "DAP Pause" })

-- UI controls
vim.keymap.set("n", "<leader>du", function()
  require("dapui").toggle()
end, { desc = "DAP Toggle UI" })
vim.keymap.set("n", "<leader>de", function()
  require("dapui").eval()
end, { desc = "DAP Eval" })

-- REPL
vim.keymap.set("n", "<leader>dR", function()
  require("dap").repl.toggle()
end, { desc = "DAP Toggle REPL" })

-- Frames and scopes
vim.keymap.set("n", "<leader>df", function()
  require("dap").focus_frame()
end, { desc = "DAP Focus Frame" })

-- Breakpoint management
vim.keymap.set("n", "<leader>dL", function()
  require("dap").list_breakpoints()
end, { desc = "DAP List Breakpoints" })
vim.keymap.set("n", "<leader>dX", function()
  require("dap").clear_breakpoints()
end, { desc = "DAP Clear Breakpoints" })

-- Visual mode: Eval selection
vim.keymap.set("v", "<leader>de", function()
  require("dapui").eval()
end, { desc = "DAP Eval Selection" })
-- Notifications
-- Dismiss Notifications
map("n", "<leader>un", function()
  require("notify").dismiss { silent = true, pending = true }
end, { desc = "Dismiss Notifications" })

-- Notification History
map("n", "<leader>nh", "<cmd>Telescope notify<cr>", { desc = "Notification History" })

-- Buffer
local buf_utils = require "utils.buffers"

local opts = { noremap = true, silent = true }

-- Navigate between buffers
map("n", "<A-,>", "<Cmd>bprevious<CR>", opts)
map("n", "<A-.>", "<Cmd>bnext<CR>", opts)

-- Jump to specific buffer
for i = 1, 9 do
  map("n", "<A-" .. i .. ">", function()
    buf_utils.goto_buffer(i)
  end, opts)
end
map("n", "<A-0>", buf_utils.goto_last_buffer, opts)

-- Close buffer
map("n", "<A-c>", "<Cmd>Bdelete<CR>", opts)

-- Buffer picking (Telescope)
map("n", "<C-p>", "<Cmd>Telescope buffers<CR>", opts)

-- Theme switcher
map("n", "<leader>uh", function()
  require("nvchad.themes").open()
end, { desc = "telescope nvchad themes" })

-- Theme toggle
map("n", "<leader>ut", function()
  local base46 = require("nvconfig").base46
  local themes = base46.theme_toggle
  local current = base46.theme

  -- figure out which one to switch to
  local next = (current == themes[1]) and themes[2] or themes[1]

  base46.theme = next
  require("base46").load_all_highlights()
  vim.notify("Theme switched to " .. next)
end, { desc = "Toggle Theme" })

-- Transparency
map("n", "<leader>ui", function()
  local config = require("nvconfig").base46
  config.transparency = not config.transparency
  require("base46").load_all_highlights()
  -- vim.notify("Transparency " .. (config.transparency and "enabled" or "disabled"))
end, { desc = "Toggle Transparency" })

-- Tabs
-- New tab
map("n", "<leader>tn", ":tabnew<CR>", { desc = "New Tab", remap = true })

-- Close tab
map("n", "<leader>tc", ":tabclose<CR>", { desc = "Close Tab", remap = true })

-- Next / Prev tab
map("n", "<leader>tl", ":tabnext<CR>", { desc = "Next Tab", remap = true })
map("n", "<leader>th", ":tabprevious<CR>", { desc = "Previous Tab", remap = true })

-- Go to first / last tab
map("n", "<leader>t0", ":tabfirst<CR>", { desc = "First Tab", remap = true })
map("n", "<leader>t$", ":tablast<CR>", { desc = "Last Tab", remap = true })

-- Move tab left / right
map("n", "<leader>t<", ":-tabmove<CR>", { desc = "Move Tab Left", remap = true })
map("n", "<leader>t>", ":+tabmove<CR>", { desc = "Move Tab Right", remap = true })

-- windows
map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })

-- resize
map("n", "<M-=>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<M-->", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<M-.>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
map("n", "<M-,>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- new terminals
map("n", "<leader>h", "<cmd>Sterm<cr>", { desc = "terminal new horizontal term" })
map("n", "<leader>v", "<cmd>Vterm<cr>", { desc = "terminal new vertical term" })

-- terminal shortcuts (using Alt key for quick access)
map({ "n", "t" }, "<A-v>", "<cmd>Vterm<cr>", { desc = "terminal vertical term" })
map({ "n", "t" }, "<A-h>", "<cmd>Sterm<cr>", { desc = "terminal horizontal term" })
map({ "n", "t" }, "<A-i>", "<cmd>Fterm<cr>", { desc = "terminal fullscreen term" })

-- Terminal close
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

-- Terminal navigation with Ctrl + h/j/k/l
map("t", "<C-h>", [[<C-\><C-N><C-w>h]], { noremap = true, silent = true })
map("t", "<C-j>", [[<C-\><C-N><C-w>j]], { noremap = true, silent = true })
map("t", "<C-k>", [[<C-\><C-N><C-w>k]], { noremap = true, silent = true })
map("t", "<C-l>", [[<C-\><C-N><C-w>l]], { noremap = true, silent = true })

-- Terminal resize with Alt + Arrow keys
map("t", "<A-Left>", [[<C-\><C-N><C-w><]], { noremap = true, silent = true })
map("t", "<A-Right>", [[<C-\><C-N><C-w>>]], { noremap = true, silent = true })
map("t", "<A-Up>", [[<C-\><C-N><C-w>+]], { noremap = true, silent = true })
map("t", "<A-Down>", [[<C-\><C-N><C-w>-]], { noremap = true, silent = true })
