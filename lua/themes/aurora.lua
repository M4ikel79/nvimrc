-- Aurora Theme - Pink/Purple/Cyan Aurora Borealis inspired
-- NvChad theme implementation
local M = {}

M.base_30 = {
  white = "#E8E6FF",
  darker_black = "#0B0A1A",
  black = "#1A0F2E",
  black2 = "#2A1B3D",
  one_bg = "#3A2C4A",
  one_bg2 = "#4A3D5A",
  one_bg3 = "#5A4E6A",
  grey = "#7A6E8A",
  grey_fg = "#8A7E9A",
  grey_fg2 = "#9A8EAA",
  light_grey = "#AA9EBA",
  red = "#FF6B9D",
  baby_pink = "#FF8EBA",
  pink = "#E478FF",
  line = "#3A2C4A",
  green = "#78FFB6",
  vibrant_green = "#8AFFCC",
  nord_blue = "#78C4FF",
  blue = "#A478FF",
  yellow = "#FFE478",
  sun = "#FFF078",
  purple = "#C478FF",
  dark_purple = "#D488FF",
  teal = "#78FFEA",
  orange = "#FF9E78",
  cyan = "#78F4FF",
  statusline_bg = "#3A2C4A",
  lightbg = "#5A4E6A",
  pmenu_bg = "#C478FF",
  folder_bg = "#78FFEA",
}

M.base_16 = {
  base00 = "#1A0F2E",
  base01 = "#3A2C4A",
  base02 = "#5A4E6A",
  base03 = "#7A6E8A",
  base04 = "#9A8EAA",
  base05 = "#E8E6FF",
  base06 = "#F8F6FF",
  base07 = "#FFFFFF",
  base08 = "#FF6B9D",
  base09 = "#FF9E78",
  base0A = "#FFE478",
  base0B = "#78FFB6",
  base0C = "#78FFEA",
  base0D = "#78C4FF",
  base0E = "#C478FF",
  base0F = "#E478FF",
}

M.polish_hl = {
  treesitter = {
    ["@variable"] = { fg = M.base_16.base05 },
    ["@punctuation.bracket"] = { fg = M.base_30.white },
    ["@function.method.call"] = { fg = M.base_30.yellow },
    ["@function.call"] = { fg = M.base_30.yellow },
    ["@constant"] = { fg = M.base_30.orange },
    ["@variable.parameter"] = { fg = M.base_30.orange },
    ["@keyword"] = { fg = M.base_30.pink },
    ["@string"] = { fg = M.base_30.green },
    ["@number"] = { fg = M.base_30.orange },
    ["@boolean"] = { fg = M.base_30.orange },
    ["@operator"] = { fg = M.base_30.pink },
    ["@comment"] = { fg = M.base_30.grey, italic = true },
    ["@type"] = { fg = M.base_30.purple },
    ["@type.builtin"] = { fg = M.base_30.purple },
    ["@constructor"] = { fg = M.base_30.purple },
  },
}

M.type = "dark"

return M
