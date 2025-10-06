-- Tokyo Rain Theme - Neon-lit rainy night in Tokyo
-- NvChad theme implementation
local M = {}

M.base_30 = {
  white = "#E0F8FF",
  darker_black = "#0A0F1A",
  black = "#1A1F2E",
  black2 = "#242938",
  one_bg = "#2E3342",
  one_bg2 = "#383D4C",
  one_bg3 = "#424756",
  grey = "#4C5160",
  grey_fg = "#565B6A",
  grey_fg2 = "#606574",
  light_grey = "#6A6F7E",
  red = "#FF4081",
  baby_pink = "#FF6BA3",
  pink = "#FF80AB",
  line = "#2E3342",
  green = "#69F0AE",
  vibrant_green = "#B9F6CA",
  nord_blue = "#40C4FF",
  blue = "#82B1FF",
  yellow = "#FFD740",
  sun = "#FFFF8D",
  purple = "#E040FB",
  dark_purple = "#EA80FC",
  teal = "#1DE9B6",
  orange = "#FF9100",
  cyan = "#18FFFF",
  statusline_bg = "#2E3342",
  lightbg = "#424756",
  pmenu_bg = "#40C4FF",
  folder_bg = "#1DE9B6",
}

M.base_16 = {
  base00 = "#1A1F2E",
  base01 = "#2E3342",
  base02 = "#424756",
  base03 = "#4C5160",
  base04 = "#606574",
  base05 = "#E0F8FF",
  base06 = "#F0FEFF",
  base07 = "#FFFFFF",
  base08 = "#FF4081",
  base09 = "#FF9100",
  base0A = "#FFD740",
  base0B = "#69F0AE",
  base0C = "#1DE9B6",
  base0D = "#40C4FF",
  base0E = "#E040FB",
  base0F = "#FF80AB",
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
