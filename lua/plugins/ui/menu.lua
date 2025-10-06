-- ============================================================================
-- FILE: lua/plugins/ui/menu.lua
-- DESCRIPTION: Fresh menu plugin configuration for nvzone/menu
-- ============================================================================

return {
  -- Volt is required for menu to work
  {
    "nvzone/volt",
    lazy = true,
  },

  -- Main menu plugin
  {
    "nvzone/menu",
    lazy = true,
    keys = {
      -- Primary menu access
      {
        "<C-t>",
        function()
          require("menu").open "main"
        end,
        desc = "Open main menu",
      },

      -- Quick submenu access
      {
        "<leader>mf",
        function()
          require("menu").open "files"
        end,
        desc = "Files menu",
      },
      {
        "<leader>mc",
        function()
          require("menu").open "code"
        end,
        desc = "Code menu",
      },
      {
        "<leader>mg",
        function()
          require("menu").open "git"
        end,
        desc = "Git menu",
      },
      {
        "<leader>mt",
        function()
          require("menu").open "terminal"
        end,
        desc = "Terminal menu",
      },
    },
    config = function()
      -- Context-aware right-click menu
      vim.keymap.set({ "n", "v" }, "<RightMouse>", function()
        -- Clean up any existing menus
        local old_bufs = require("menu.state").bufids
        if #old_bufs > 0 then
          vim.api.nvim_buf_call(old_bufs[1], function()
            vim.api.nvim_feedkeys("q", "x", false)
          end)
        end

        -- Execute the right click
        vim.cmd.exec '"normal! \\<RightMouse>"'

        -- Get buffer info at mouse position
        local mouse_pos = vim.fn.getmousepos()
        local buf = vim.api.nvim_win_get_buf(mouse_pos.winid)
        local ft = vim.bo[buf].ft

        -- Choose menu based on filetype
        local menu_name = "default"

        if ft == "NvimTree" then
          menu_name = "nvimtree"
        elseif ft == "markdown" then
          menu_name = "markdown"
        elseif vim.tbl_contains({ "lua", "python", "javascript", "typescript", "rust", "go", "java" }, ft) then
          menu_name = "code"
        end

        -- Open menu at mouse position
        require("menu").open(menu_name, { mouse = true })
      end, { desc = "Context menu" })
    end,
  },
}
