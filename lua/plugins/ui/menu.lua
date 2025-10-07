-- lua/plugins/ui/menu.lua
-- Smart context-aware menu system plugin configuration

return {
  {
    "nvzone/volt",
    lazy = true,
  },
  {
    "nvzone/menu",
    lazy = true,
    keys = {
      -- Context-aware menu
      {
        "<C-Space>",
        function()
          require("configs.menu_manager").open_context_menu()
        end,
        mode = { "n", "v" },
        desc = "Context menu",
      },
      -- Quick access to specific menus
      {
        "<leader>m",
        function()
          require("configs.menu_manager").open_context_menu()
        end,
        desc = "Context menu",
      },
      {
        "<leader>md",
        function()
          require("configs.menu_manager").open_debug_menu()
        end,
        desc = "Debug menu",
      },
      {
        "<leader>mg",
        function()
          require("configs.menu_manager").open_git_menu()
        end,
        desc = "Git menu",
      },
      {
        "<leader>mc",
        function()
          require("configs.menu_manager").open_colors_menu()
        end,
        desc = "Colors menu",
      },
    },
    config = function()
      -- Right-click support
      vim.keymap.set({ "n", "v" }, "<RightMouse>", function()
        -- Clean up old menus
        local state = require "menu.state"
        if #state.bufids > 0 then
          vim.api.nvim_buf_call(state.bufids[1], function()
            vim.api.nvim_feedkeys("q", "x", false)
          end)
        end

        vim.cmd.exec '"normal! \\<RightMouse>"'

        -- Open context-aware menu at mouse position
        require("configs.menu_manager").open_context_menu { mouse = true }
      end, { desc = "Context menu" })
    end,
  },
}
