-- lua/menus/main.lua
-- Main menu - Entry point to all other menus and common actions

return {
  -- ============================================================================
  -- Quick Actions
  -- ============================================================================
  {
    name = " Save File",
    cmd = "write",
    rtxt = "<C-s>",
  },
  {
    name = " Save All",
    cmd = "wall",
    rtxt = "<leader>W",
  },
  {
    name = " Quit",
    cmd = function()
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
    end,
    rtxt = "<leader>q",
  },

  { name = "separator" },

  -- ============================================================================
  -- Submenu Access
  -- ============================================================================
  {
    name = " Files & Search",
    hl = "ExBlue",
    items = "files",
    keybind = "<leader>mf",
  },
  {
    name = " Code Actions",
    hl = "ExGreen",
    items = "code",
    keybind = "<leader>mc",
  },
  {
    name = " Git Operations",
    hl = "ExRed",
    items = "git",
    keybind = "<leader>mg",
  },
  {
    name = " Terminal",
    hl = "ExCyan",
    items = "terminal",
    keybind = "<leader>mt",
  },

  { name = "separator" },

  -- ============================================================================
  -- Configuration
  -- ============================================================================
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
    name = " Reload Config",
    cmd = function()
      for name, _ in pairs(package.loaded) do
        if name:match "^user" or name:match "^keymaps" or name:match "^plugins" then
          package.loaded[name] = nil
        end
      end
      dofile(vim.fn.stdpath "config" .. "/init.lua")
      vim.notify("Configuration reloaded", vim.log.levels.INFO)
    end,
    rtxt = "<leader>cr",
  },

  { name = "separator" },

  -- ============================================================================
  -- Plugin Management
  -- ============================================================================
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

  -- ============================================================================
  -- Appearance
  -- ============================================================================
  {
    name = " Theme Selector",
    cmd = function()
      require("nvchad.themes").open()
    end,
    rtxt = "<leader>th",
  },
  {
    name = " Toggle Transparency",
    cmd = function()
      local config = require("nvconfig").base46
      config.transparency = not config.transparency
      require("base46").load_all_highlights()
      local status = config.transparency and "enabled" or "disabled"
      vim.notify("Transparency " .. status, vim.log.levels.INFO)
    end,
    rtxt = "<leader>ui",
  },
  {
    name = " Color Picker",
    cmd = function()
      require("minty.huefy").open()
    end,
    rtxt = "<leader>ch",
  },

  { name = "separator" },

  -- ============================================================================
  -- More Options
  -- ============================================================================
  {
    name = "󰖲 Window Management",
    hl = "ExYellow",
    items = "window",
  },
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
