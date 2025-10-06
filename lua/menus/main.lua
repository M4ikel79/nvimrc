-- lua/menus/main.lua
-- Main entry menu with access to all submenus

return {
  -- Quick Actions Section
  {
    name = " Save File",
    cmd = "write",
    rtxt = "<C-s>",
  },
  {
    name = " Quit",
    cmd = function()
      local modified = vim.bo.modified
      if modified then
        local choice = vim.fn.confirm("Save changes before closing?", "&Yes\n&No\n&Cancel", 3)
        if choice == 1 then
          vim.cmd "write | quit"
        elseif choice == 2 then
          vim.cmd "quit!"
        end
      else
        vim.cmd "quit"
      end
    end,
    rtxt = "<leader>q",
  },

  { name = "separator" },

  -- Submenu Access
  {
    name = " Files & Search",
    hl = "ExBlue",
    items = "files",
  },
  {
    name = " Code Actions",
    hl = "ExGreen",
    items = "code",
  },
  {
    name = " Git Operations",
    hl = "ExRed",
    items = "git",
  },
  {
    name = " Terminal",
    hl = "ExCyan",
    items = "terminal",
  },
  {
    name = "󰖲 Window Management",
    hl = "ExYellow",
    items = "window",
  },

  { name = "separator" },

  -- Configuration
  {
    name = " Edit Config",
    cmd = function()
      vim.cmd "tabnew"
      local conf = vim.fn.stdpath "config"
      vim.cmd("tcd " .. conf .. " | e init.lua")
    end,
    rtxt = "ed",
  },
  {
    name = " Theme Selector",
    cmd = function()
      require("nvchad.themes").open()
    end,
    rtxt = "<leader>th",
  },

  { name = "separator" },

  -- Plugin Management
  {
    name = "󰒲 Lazy Plugins",
    cmd = "Lazy",
    rtxt = "<leader>L",
  },
  {
    name = "󰢛 Mason Installer",
    cmd = "Mason",
    rtxt = "<leader>M",
  },

  { name = "separator" },

  -- More Options
  {
    name = "󱂬 Session Management",
    hl = "ExPurple",
    items = "session",
  },
  {
    name = " Help & Docs",
    hl = "ExOrange",
    items = "help",
  },
}
