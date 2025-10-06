-- lua/keymaps/colors.lua
-- Color editing keymaps (Huefy, Shades, theme management)
-- Uses vim.keymap.set for plugin-specific bindings

local map = vim.keymap.set

-- ============================================================================
-- Huefy - HSL Color Picker
-- ============================================================================
-- Huefy provides an interactive color picker for editing colors in HSL format
map("n", "<leader>ch", "<cmd>Huefy<cr>", { desc = "Open Huefy color picker" })

-- Quick Huefy shortcuts for specific adjustments
map("n", "<leader>cH", function()
  vim.cmd "Huefy"
  -- Automatically focus on hue slider
  vim.defer_fn(function()
    vim.cmd "normal! gg"
  end, 100)
end, { desc = "Huefy (focus hue)" })

-- ============================================================================
-- Shades - Color Shade Generator
-- ============================================================================
-- Shades generates lighter/darker variations of colors
map("n", "<leader>cs", "<cmd>Shades<cr>", { desc = "Open Shades generator" })

-- Quick shade generation on color under cursor
map("n", "<leader>cS", function()
  local word = vim.fn.expand "<cword>"
  if word:match "^#%x%x%x%x%x%x" or word:match "^#%x%x%x$" then
    vim.cmd "Shades"
  else
    vim.notify("No valid color under cursor", vim.log.levels.WARN)
  end
end, { desc = "Shades for color under cursor" })

-- ============================================================================
-- NvChad Theme Management
-- ============================================================================
-- Theme picker
map("n", "<leader>th", function()
  require("nvchad.themes").open()
end, { desc = "Theme selector" })

-- Toggle between configured themes
map("n", "<leader>tt", function()
  local base46 = require("nvconfig").base46
  local themes = base46.theme_toggle

  if not themes or #themes < 2 then
    vim.notify("Configure theme_toggle in chadrc.lua", vim.log.levels.WARN)
    return
  end

  local current = base46.theme
  local next_theme = (current == themes[1]) and themes[2] or themes[1]

  base46.theme = next_theme
  require("base46").load_all_highlights()
  vim.notify("Theme: " .. next_theme, vim.log.levels.INFO)
end, { desc = "Toggle theme" })

-- Toggle transparency
map("n", "<leader>ui", function()
  local config = require("nvconfig").base46
  config.transparency = not config.transparency
  require("base46").load_all_highlights()

  local status = config.transparency and "enabled" or "disabled"
  vim.notify("Transparency " .. status, vim.log.levels.INFO)
end, { desc = "Toggle transparency" })

-- ============================================================================
-- Color Utilities
-- ============================================================================
-- Preview color under cursor (built-in vim feature)
map("n", "<leader>cp", function()
  local word = vim.fn.expand "<cword>"
  if word:match "^#%x%x%x%x%x%x" or word:match "^#%x%x%x$" then
    vim.cmd("highlight! link CursorLine " .. word)
    vim.defer_fn(function()
      vim.cmd "highlight! clear CursorLine"
    end, 2000)
    vim.notify("Previewing: " .. word, vim.log.levels.INFO)
  else
    vim.notify("No valid hex color under cursor", vim.log.levels.WARN)
  end
end, { desc = "Preview color under cursor" })

-- Insert color from picker
map("i", "<C-c>", function()
  -- Open color picker and insert result
  vim.ui.input({ prompt = "Enter hex color (#rrggbb): " }, function(input)
    if input and input:match "^#%x%x%x%x%x%x" then
      vim.api.nvim_put({ input }, "c", true, true)
    end
  end)
end, { desc = "Insert color code" })

-- ============================================================================
-- Colorizer (nvim-colorizer) Integration
-- ============================================================================
-- Toggle colorizer for current buffer
map("n", "<leader>tc", function()
  local colorizer = require "colorizer"
  local is_attached = colorizer.is_buffer_attached(0)

  if is_attached then
    colorizer.detach_from_buffer(0)
    vim.notify("Colorizer disabled", vim.log.levels.INFO)
  else
    colorizer.attach_to_buffer(0)
    vim.notify("Colorizer enabled", vim.log.levels.INFO)
  end
end, { desc = "Toggle colorizer" })

-- Reload colorizer
map("n", "<leader>rc", function()
  require("colorizer").reload_all_buffers()
  vim.notify("Colorizer reloaded", vim.log.levels.INFO)
end, { desc = "Reload colorizer" })

-- ============================================================================
-- Highlight Group Inspection
-- ============================================================================
-- Show highlight group under cursor
map("n", "<leader>ci", function()
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
end, { desc = "Inspect highlight group" })

-- Show all highlight groups
map("n", "<leader>cI", "<cmd>Telescope highlights<cr>", { desc = "Browse highlight groups" })

-- ============================================================================
-- Custom Color Scheme Development
-- ============================================================================
-- Reload current colorscheme (useful during theme development)
map("n", "<leader>cr", function()
  local current_theme = vim.g.colors_name
  if current_theme then
    vim.cmd("colorscheme " .. current_theme)
    vim.notify("Reloaded: " .. current_theme, vim.log.levels.INFO)
  else
    vim.notify("No colorscheme loaded", vim.log.levels.WARN)
  end
end, { desc = "Reload colorscheme" })

-- Export current theme colors to file
map("n", "<leader>ce", function()
  local filename = vim.fn.input("Export colors to: ", "colors.txt")
  if filename == "" then
    return
  end

  local colors = {}
  for name, val in pairs(vim.api.nvim_get_hl(0, {})) do
    if val.fg or val.bg then
      table.insert(colors, string.format("%s: fg=%s bg=%s", name, val.fg or "none", val.bg or "none"))
    end
  end

  local file = io.open(filename, "w")
  if file then
    file:write(table.concat(colors, "\n"))
    file:close()
    vim.notify("Colors exported to: " .. filename, vim.log.levels.INFO)
  else
    vim.notify("Failed to write file", vim.log.levels.ERROR)
  end
end, { desc = "Export colors to file" })

-- ============================================================================
-- Quick Color Conversions
-- ============================================================================
-- Convert hex to RGB
map("n", "<leader>cH", function()
  local word = vim.fn.expand "<cword>"
  local hex = word:match "^#(%x%x%x%x%x%x)$"

  if hex then
    local r = tonumber(hex:sub(1, 2), 16)
    local g = tonumber(hex:sub(3, 4), 16)
    local b = tonumber(hex:sub(5, 6), 16)
    local rgb = string.format("rgb(%d, %d, %d)", r, g, b)
    vim.notify(word .. " -> " .. rgb, vim.log.levels.INFO)
    vim.fn.setreg("+", rgb) -- Copy to clipboard
  else
    vim.notify("Not a valid hex color", vim.log.levels.WARN)
  end
end, { desc = "Hex to RGB" })

-- Convert RGB to hex
map("n", "<leader>cR", function()
  local line = vim.fn.getline "."
  local r, g, b = line:match "rgb%((%d+),%s*(%d+),%s*(%d+)%)"

  if r and g and b then
    local hex = string.format("#%02x%02x%02x", tonumber(r), tonumber(g), tonumber(b))
    vim.notify(string.format("rgb(%s,%s,%s) -> %s", r, g, b, hex), vim.log.levels.INFO)
    vim.fn.setreg("+", hex) -- Copy to clipboard
  else
    vim.notify("Not a valid RGB color", vim.log.levels.WARN)
  end
end, { desc = "RGB to Hex" })
