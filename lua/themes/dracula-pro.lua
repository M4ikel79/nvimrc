-- Credits to original Dracula Pro theme
-- Base46 implementation for NvChad
local M = {}

M.base_30 = {
  white = "#F8F8F2", -- Main foreground
  darker_black = "#191A21", -- Background darker
  black = "#282A36", -- Main background
  black2 = "#21222C", -- ANSI black
  one_bg = "#343746", -- Background light
  one_bg2 = "#424450", -- Background lighter
  one_bg3 = "#44475A", -- Selection background
  grey = "#6272A4", -- Comments/current line
  grey_fg = "#6272A4", -- Comments
  grey_fg2 = "#7080B0", -- Lighter comments
  light_grey = "#8090C0", -- Even lighter
  red = "#FF5555", -- Errors, warnings, deletion
  baby_pink = "#FF6E6E", -- ANSI bright red
  pink = "#FF79C6", -- Keywords, storage types
  line = "#343746", -- For lines like vertsplit
  green = "#50FA7B", -- Strings, inherited classes
  vibrant_green = "#69FF94", -- ANSI bright green
  nord_blue = "#BD93F9", -- Classes, types, variables (purple)
  blue = "#BD93F9", -- Same as purple in Dracula
  yellow = "#F1FA8C", -- Functions, methods
  sun = "#FFFFA5", -- ANSI bright yellow
  purple = "#BD93F9", -- Classes, types, variables
  dark_purple = "#D6ACFF", -- ANSI bright blue/purple
  teal = "#8BE9FD", -- Support functions, regex (cyan)
  orange = "#FFB86C", -- Numbers, constants, booleans
  cyan = "#8BE9FD", -- Support functions, regex
  statusline_bg = "#343746", -- Status bar background
  lightbg = "#44475A", -- Light bg for UI elements
  pmenu_bg = "#BD93F9", -- Popup menu accent (purple)
  folder_bg = "#8BE9FD", -- Folder/directory color (cyan)
}

M.base_16 = {
  base00 = "#282A36", -- Default Background
  base01 = "#343746", -- Lighter Background (status bars, line numbers)
  base02 = "#44475A", -- Selection Background
  base03 = "#6272A4", -- Comments, Invisibles, Line Highlighting
  base04 = "#7080B0", -- Dark Foreground (status bars)
  base05 = "#F8F8F2", -- Default Foreground, Caret, Delimiters, Operators
  base06 = "#F8F8F2", -- Light Foreground
  base07 = "#FFFFFF", -- Light Background
  base08 = "#FF5555", -- Variables, XML Tags, Markup Link Text, Diff Deleted (red)
  base09 = "#FFB86C", -- Integers, Boolean, Constants, XML Attributes (orange)
  base0A = "#F1FA8C", -- Classes, Markup Bold, Search Text Background (yellow)
  base0B = "#50FA7B", -- Strings, Inherited Class, Markup Code, Diff Inserted (green)
  base0C = "#8BE9FD", -- Support, Regular Expressions, Escape Characters (cyan)
  base0D = "#8BE9FD", -- Functions, Methods, Attribute IDs, Headings (cyan)
  base0E = "#BD93F9", -- Keywords, Storage, Selector, Markup Italic (purple)
  base0F = "#FF79C6", -- Deprecated, Opening/Closing Embedded Language Tags (pink)
}

M.polish_hl = {
  treesitter = {
    ["@variable"] = { fg = M.base_16.base05 }, -- Foreground (white)
    ["@punctuation.bracket"] = { fg = M.base_30.white }, -- White brackets
    ["@function.method.call"] = { fg = M.base_30.yellow }, -- Yellow functions
    ["@function.call"] = { fg = M.base_30.yellow }, -- Yellow functions
    ["@constant"] = { fg = M.base_30.orange }, -- Orange constants
    ["@variable.parameter"] = { fg = M.base_30.orange }, -- Orange parameters
    ["@keyword"] = { fg = M.base_30.pink }, -- Pink keywords
    ["@string"] = { fg = M.base_30.green }, -- Green strings
    ["@number"] = { fg = M.base_30.orange }, -- Orange numbers
    ["@boolean"] = { fg = M.base_30.orange }, -- Orange booleans
    ["@operator"] = { fg = M.base_30.pink }, -- Pink operators
    ["@comment"] = { fg = M.base_30.grey, italic = true }, -- Grey comments
    ["@type"] = { fg = M.base_30.purple }, -- Purple types
    ["@type.builtin"] = { fg = M.base_30.purple }, -- Purple built-in types
    ["@constructor"] = { fg = M.base_30.purple }, -- Purple constructors
  },
}

M.type = "dark"

return M
