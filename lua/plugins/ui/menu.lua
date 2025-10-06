-- lua/plugins/ui/menu.lua
-- Minimal yet comprehensive menu system for Neovim
-- Integrates with existing keymaps and provides context-aware actions

return {
  {
    "nvzone/volt",
    lazy = true,
  },
  {
    "nvzone/menu",
    lazy = true,
    config = function()
      -- Register custom menu configurations
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          -- Ensure menu module loads after all plugins
          vim.defer_fn(function()
            -- Set up keymaps after everything is loaded
            local map = vim.keymap.set

            -- ============================================================================
            -- Main Menu Keymaps
            -- ============================================================================

            -- Primary menu access (using different key to avoid tag stack conflict)
            map("n", "<leader><leader>", function()
              require("menu").open "main"
            end, { desc = "Open main menu" })

            -- Context-aware right-click menu
            map({ "n", "v" }, "<RightMouse>", function()
              require("menu.utils").delete_old_menus()
              vim.cmd.exec '"normal! \\<RightMouse>"'

              local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
              local ft = vim.bo[buf].ft

              -- Choose menu based on context
              local menu_name = "default"
              if ft == "NvimTree" then
                menu_name = "nvimtree"
              elseif ft == "markdown" then
                menu_name = "markdown"
              elseif vim.tbl_contains({ "lua", "python", "javascript", "typescript", "rust", "go" }, ft) then
                menu_name = "code"
              end

              require("menu").open(menu_name, { mouse = true })
            end, { desc = "Context menu" })

            -- Quick access menus
            map("n", "<leader>mm", function()
              require("menu").open "main"
            end, { desc = "Main menu" })

            map("n", "<leader>mf", function()
              require("menu").open "files"
            end, { desc = "Files menu" })

            map("n", "<leader>mc", function()
              require("menu").open "code"
            end, { desc = "Code menu" })

            map("n", "<leader>mg", function()
              require("menu").open "git"
            end, { desc = "Git menu" })

            map("n", "<leader>mt", function()
              require("menu").open "terminal"
            end, { desc = "Terminal menu" })

            map("n", "<leader>mw", function()
              require("menu").open "window"
            end, { desc = "Window menu" })

            map("n", "<leader>ms", function()
              require("menu").open "session"
            end, { desc = "Session menu" })
          end, 100)
        end,
      })
    end,
  },
}
