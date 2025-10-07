-- lua/plugins/ui/menu.lua
-- Smart Context-Aware Menu System
-- Philosophy: Show only what's needed, when it's needed

return {
  {
    "nvzone/volt",
    lazy = true,
  },
  {
    "nvzone/menu",
    lazy = true,
    keys = {
      -- Single intuitive binding: Right-click or Ctrl+Space
      {
        "<C-Space>",
        function()
          require("configs.menu_manager").open_context_menu()
        end,
        mode = { "n", "v" },
        desc = "Context menu",
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
        require("configs.menu_manager").open_context_menu { mouse = true }
      end, { desc = "Context menu" })
    end,
  },
}
