-- Credits to original Monokai Pro theme
-- Base46 implementation for NvChad
local M = {}

M.base_30 = {
  white = "#f8f8f2",           -- Main foreground
  darker_black = "#1e1f1c",    -- Darker than main bg
  black = "#272822",           -- Main background (editor)
  black2 = "#2d2e28",          -- Slightly lighter bg
  one_bg = "#34352f",          -- Light background 1 (tab inactive)
  one_bg2 = "#3e3d32",         -- Light background 2 (line highlight)
  one_bg3 = "#414339",         -- Light background 3 (statusbar)
  grey = "#464741",            -- Base grey (whitespace)
  grey_fg = "#75715e",         -- Comments/borders
  grey_fg2 = "#90908a",        -- Line numbers
  light_grey = "#c2c2bf",      -- Active line numbers
  red = "#f92672",             -- Keywords/errors (bright red)
  baby_pink = "#ff6188",       -- Softer red variant
  pink = "#f92672",            -- Same as red
  line = "#34352f",            -- For lines like vertsplit
  green = "#a6e22e",           -- Strings/success (bright green)
  vibrant_green = "#86b42b",   -- ANSI green variant
  nord_blue = "#66d9ef",       -- Functions/types (cyan-blue)
  blue = "#6a7ec8",            -- ANSI blue
  yellow = "#e6db74",          -- Numbers/warnings
  sun = "#e2e22e",             -- ANSI bright yellow
  purple = "#ae81ff",          -- Constants/types (bright purple)
  dark_purple = "#8c6bc8",     -- ANSI magenta
  teal = "#56adbc",            -- ANSI cyan
  orange = "#fd971f",          -- Operators/classes
  cyan = "#66d9ef",            -- Same as nord_blue
  statusline_bg = "#414339",   -- Status bar background
  lightbg = "#3e3d32",         -- Light bg for UI elements
  pmenu_bg = "#a6e22e",        -- Popup menu accent (green)
  folder_bg = "#66d9ef",       -- Folder/directory color (cyan)
}

M.base_16 = {
  base00 = "#272822", -- Default Background
  base01 = "#1e1f1c", -- Lighter Background (status bars, line numbers)
  base02 = "#34352f", -- Selection Background
  base03 = "#75715e", -- Comments, Invisibles, Line Highlighting
  base04 = "#90908a", -- Dark Foreground (status bars)
  base05 = "#f8f8f2", -- Default Foreground, Caret, Delimiters, Operators
  base06 = "#f8f8f0", -- Light Foreground
  base07 = "#ffffff", -- Light Background
  base08 = "#f92672", -- Variables, XML Tags, Markup Link Text, Diff Deleted (red)
  base09 = "#fd971f", -- Integers, Boolean, Constants, XML Attributes (orange)
  base0A = "#e6db74", -- Classes, Markup Bold, Search Text Background (yellow)
  base0B = "#a6e22e", -- Strings, Inherited Class, Markup Code, Diff Inserted (green)
  base0C = "#66d9ef", -- Support, Regular Expressions, Escape Characters (cyan)
  base0D = "#66d9ef", -- Functions, Methods, Attribute IDs, Headings (cyan-blue)
  base0E = "#ae81ff", -- Keywords, Storage, Selector, Markup Italic (purple)
  base0F = "#fd971f", -- Deprecated, Opening/Closing Embedded Language Tags (orange)
}

M.polish_hl = {
  treesitter = {
    ["@variable"] = { fg = M.base_16.base05 },
    ["@punctuation.bracket"] = { fg = M.base_30.purple },
    ["@function.method.call"] = { fg = M.base_30.green },
    ["@function.call"] = { fg = M.base_30.green },
    ["@constant"] = { fg = M.base_30.purple },
    ["@variable.parameter"] = { fg = M.base_30.orange },
    ["@keyword"] = { fg = M.base_30.red },
    ["@string"] = { fg = M.base_30.yellow },
    ["@number"] = { fg = M.base_30.purple },
    ["@operator"] = { fg = M.base_30.red },
    ["@comment"] = { fg = M.base_30.grey_fg, italic = true },
  },
}

M.type = "dark"

return M
