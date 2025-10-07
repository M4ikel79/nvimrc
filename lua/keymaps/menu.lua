local map = vim.keymap.set

-- Context menu
map("n", "<C-Space>", function()
  require("configs.menu_manager").open_context_menu()
end)
map("v", "<C-Space>", function()
  require("configs.menu_manager").open_context_menu()
end)

-- Web development specific
map("n", "<leader>ls", "<cmd>LiveServerStart<cr>", { desc = "Start live server" })
map("n", "<leader>lS", "<cmd>LiveServerStop<cr>", { desc = "Stop live server" })

-- Markdown specific
map("n", "<leader>mp", "<cmd>MarkdownPreview<cr>", { desc = "Markdown preview", ft = "markdown" })
map("n", "<leader>ms", "<cmd>MarkdownPreviewStop<cr>", { desc = "Stop preview", ft = "markdown" })

-- Quick run
map("n", "<F5>", function()
  -- Run current file based on filetype
end, { desc = "Run file" })

-- Debug
map("n", "<F9>", function()
  require("dap").continue()
end, { desc = "Debug: Start/Continue" })
map("n", "<F10>", function()
  require("dap").toggle_breakpoint()
end, { desc = "Debug: Breakpoint" })
map("n", "<F11>", function()
  require("dap").step_over()
end, { desc = "Debug: Step over" })
map("n", "<F12>", function()
  require("dap").step_into()
end, { desc = "Debug: Step into" })
