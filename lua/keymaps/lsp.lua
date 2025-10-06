-- lua/keymaps/lsp.lua
-- LSP, formatting, and code-related keymaps
-- Uses vim.keymap.set for plugin-specific bindings

local map = vim.keymap.set

-- ============================================================================
-- LSP Core Navigation & Actions
-- ============================================================================
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
map("n", "gt", vim.lsp.buf.type_definition, { desc = "Go to type definition" })
map("n", "gr", "<cmd>Telescope lsp_references<cr>", { desc = "Show references" })
map("n", "gR", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "LSP references (Trouble)" })

-- Hover & Signature Help
map("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
map("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature help" })
map("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature help" })

-- Code Actions & Refactoring
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename symbol" })
map("n", "<leader>cs", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Document symbols" })
map("n", "<leader>cS", "<cmd>Telescope lsp_workspace_symbols<cr>", { desc = "Workspace symbols" })

-- Workspace Management
map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "Add workspace folder" })
map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = "Remove workspace folder" })
map("n", "<leader>wl", function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = "List workspace folders" })

-- ============================================================================
-- Code Formatting (Conform.nvim)
-- ============================================================================
map({ "n", "v" }, "<leader>cf", function()
  require("conform").format { async = true, lsp_fallback = true }
end, { desc = "Format buffer" })

map({ "n", "v" }, "<leader>cF", function()
  require("conform").format { formatters = { "injected" } }
end, { desc = "Format injected languages" })

-- Toggle format on save
map("n", "<leader>uf", function()
  if vim.b.disable_autoformat or vim.g.disable_autoformat then
    vim.b.disable_autoformat = false
    vim.g.disable_autoformat = false
    vim.notify("Format on save enabled", vim.log.levels.INFO)
  else
    vim.b.disable_autoformat = true
    vim.notify("Format on save disabled for buffer", vim.log.levels.INFO)
  end
end, { desc = "Toggle format on save" })

-- ============================================================================
-- Diagnostics (Trouble.nvim)
-- ============================================================================
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer diagnostics (Trouble)" })
map("n", "<leader>xq", "<cmd>Trouble quickfix toggle<cr>", { desc = "Quickfix (Trouble)" })
map("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>", { desc = "Location list (Trouble)" })
map("n", "<leader>xt", "<cmd>TodoTrouble<cr>", { desc = "Todo comments (Trouble)" })

-- ============================================================================
-- Debugging (DAP)
-- ============================================================================
local dap = require "dap"
local dapui = require "dapui"

-- Session control
map("n", "<leader>dc", dap.continue, { desc = "Continue/Start debugging" })
map("n", "<leader>dC", dap.run_to_cursor, { desc = "Run to cursor" })
map("n", "<leader>dt", dap.terminate, { desc = "Terminate session" })
map("n", "<leader>dr", dap.restart, { desc = "Restart session" })
map("n", "<leader>dp", dap.pause, { desc = "Pause execution" })

-- Breakpoints
map("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
map("n", "<leader>dB", function()
  dap.set_breakpoint(vim.fn.input "Breakpoint condition: ")
end, { desc = "Conditional breakpoint" })
map("n", "<leader>dL", dap.list_breakpoints, { desc = "List breakpoints" })
map("n", "<leader>dX", dap.clear_breakpoints, { desc = "Clear all breakpoints" })

-- Step control
map("n", "<leader>di", dap.step_into, { desc = "Step into" })
map("n", "<leader>do", dap.step_over, { desc = "Step over" })
map("n", "<leader>dO", dap.step_out, { desc = "Step out" })
map("n", "<leader>dj", dap.down, { desc = "Stack down" })
map("n", "<leader>dk", dap.up, { desc = "Stack up" })

-- UI control
map("n", "<leader>du", dapui.toggle, { desc = "Toggle DAP UI" })
map("n", "<leader>de", dapui.eval, { desc = "Evaluate expression" })
map("v", "<leader>de", dapui.eval, { desc = "Evaluate selection" })
map("n", "<leader>dR", dap.repl.toggle, { desc = "Toggle REPL" })
map("n", "<leader>df", dap.focus_frame, { desc = "Focus current frame" })

-- ============================================================================
-- LSP Info & Management
-- ============================================================================
map("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "LSP info" })
map("n", "<leader>lr", "<cmd>LspRestart<cr>", { desc = "Restart LSP" })
map("n", "<leader>lI", "<cmd>Mason<cr>", { desc = "Mason installer" })
map("n", "<leader>lf", "<cmd>ConformInfo<cr>", { desc = "Conform info" })

-- ============================================================================
-- Code Context (Treesitter)
-- ============================================================================
map("n", "<leader>ut", function()
  require("treesitter-context").toggle()
end, { desc = "Toggle treesitter context" })

map("n", "[c", function()
  require("treesitter-context").go_to_context(vim.v.count1)
end, { desc = "Jump to context" })
