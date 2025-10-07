-- lua/menus/colors.lua
-- Color editing and theme management menu

return {
  {
    name = " Color Tools",
    title = true,
    hl = "ExCyan",
  },

  { name = "separator" },

  -- Color Pickers
  {
    name = " Huefy (HSL Picker)",
    cmd = function()
      require("minty.huefy").open()
    end,
    rtxt = "<leader>ch",
  },

  {
    name = " Shades Generator",
    cmd = function()
      require("minty.shades").open()
    end,
    rtxt = "<leader>cs",
  },

  { name = "separator" },

  -- Theme Management submenu
  {
    name = "󰔎 Theme Management",
    items = {
      {
        name = "Theme Selector",
        cmd = function()
          require("nvchad.themes").open()
        end,
        rtxt = "<leader>th",
      },
      {
        name = "Toggle Theme",
        cmd = function()
          local base46 = require("nvconfig").base46
          local themes = base46.theme_toggle
          if themes and #themes >= 2 then
            local current = base46.theme
            local next_theme = (current == themes[1]) and themes[2] or themes[1]
            base46.theme = next_theme
            require("base46").load_all_highlights()
            vim.notify("Theme: " .. next_theme, vim.log.levels.INFO)
          end
        end,
        rtxt = "<leader>tt",
      },
      {
        name = "Toggle Transparency",
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
        name = "Reload Colorscheme",
        cmd = function()
          local current_theme = vim.g.colors_name
          if current_theme then
            vim.cmd("colorscheme " .. current_theme)
            vim.notify("Reloaded: " .. current_theme, vim.log.levels.INFO)
          end
        end,
        rtxt = "<leader>cr",
      },
    },
  },

  { name = "separator" },

  -- Colorizer Controls
  {
    name = " Colorizer",
    items = {
      {
        name = "Toggle Colorizer",
        cmd = function()
          local colorizer = require "colorizer"
          local is_attached = colorizer.is_buffer_attached(0)
          if is_attached then
            colorizer.detach_from_buffer(0)
            vim.notify("Colorizer disabled", vim.log.levels.INFO)
          else
            colorizer.attach_to_buffer(0)
            vim.notify("Colorizer enabled", vim.log.levels.INFO)
          end
        end,
        rtxt = "<leader>tc",
      },
      {
        name = "Reload Colorizer",
        cmd = function()
          require("colorizer").reload_all_buffers()
          vim.notify("Colorizer reloaded", vim.log.levels.INFO)
        end,
        rtxt = "<leader>rc",
      },
    },
  },

  { name = "separator" },

  -- Color Utilities
  {
    name = "Inspect Highlight Group",
    cmd = function()
      local result = vim.treesitter.get_captures_at_cursor(0)
      if #result == 0 then
        vim.notify("No highlight group found", vim.log.levels.WARN)
        return
      end
      local output = "Highlight groups:\n"
      for _, capture in ipairs(result) do
        output = output .. "  - " .. capture .. "\n"
      end
      vim.notify(output, vim.log.levels.INFO)
    end,
    rtxt = "<leader>ci",
  },

  {
    name = "Browse Highlight Groups",
    cmd = "Telescope highlights",
    rtxt = "<leader>cI",
  },

  { name = "separator" },

  -- Color Conversions
  {
    name = "Hex → RGB",
    cmd = function()
      local word = vim.fn.expand "<cword>"
      local hex = word:match "^#(%x%x%x%x%x%x)$"
      if hex then
        local r = tonumber(hex:sub(1, 2), 16)
        local g = tonumber(hex:sub(3, 4), 16)
        local b = tonumber(hex:sub(5, 6), 16)
        local rgb = string.format("rgb(%d, %d, %d)", r, g, b)
        vim.notify(word .. " → " .. rgb, vim.log.levels.INFO)
        vim.fn.setreg("+", rgb)
      else
        vim.notify("Not a valid hex color", vim.log.levels.WARN)
      end
    end,
    rtxt = "<leader>cH",
  },

  {
    name = "RGB → Hex",
    cmd = function()
      local line = vim.fn.getline "."
      local r, g, b = line:match "rgb%((%d+),%s*(%d+),%s*(%d+)%)"
      if r and g and b then
        local hex = string.format("#%02x%02x%02x", tonumber(r), tonumber(g), tonumber(b))
        vim.notify(string.format("rgb(%s,%s,%s) → %s", r, g, b, hex), vim.log.levels.INFO)
        vim.fn.setreg("+", hex)
      else
        vim.notify("Not a valid RGB color", vim.log.levels.WARN)
      end
    end,
    rtxt = "<leader>cR",
  },
}
