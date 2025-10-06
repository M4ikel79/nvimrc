-- Cherry Blossom Theme - Japanese sakura inspired light theme
-- NvChad theme implementation
local M = {}

M.base_30 = {
  white = "#2A2A2A",
  darker_black = "#FFEEF5",
  black = "#FFE4EC",
  black2 = "#FFDAE3",
  one_bg = "#FFD0DA",
  one_bg2 = "#FFC6D1",
  one_bg3 = "#FFBCC8",
  grey = "#E6A8B8",
  grey_fg = "#D598A8",
  grey_fg2 = "#C48898",
  light_grey = "#B37888",
  red = "#E91E63",
  baby_pink = "#F06292",
  pink = "#F8BBD9",
  line = "#FFD0DA",
  green = "#4CAF50",
  vibrant_green = "#81C784",
  nord_blue = "#2196F3",
  blue = "#64B5F6",
  yellow = "#FFC107",
  sun = "#FFD54F",
  purple = "#9C27B0",
  dark_purple = "#BA68C8",
  teal = "#009688",
  orange = "#FF9800",
  cyan = "#00BCD4",
  statusline_bg = "#FFD0DA",
  lightbg = "#FFBCC8",
  pmenu_bg = "#E91E63",
  folder_bg = "#009688",
}

M.base_16 = {
  base00 = "#FFE4EC",
  base01 = "#FFD0DA",
  base02 = "#FFBCC8",
  base03 = "#E6A8B8",
  base04 = "#C48898",
  base05 = "#2A2A2A",
  base06 = "#1A1A1A",
  base07 = "#000000",
  base08 = "#E91E63",
  base09 = "#FF9800",
  base0A = "#FFC107",
  base0B = "#4CAF50",
  base0C = "#009688",
  base0D = "#2196F3",
  base0E = "#9C27B0",
  base0F = "#F8BBD9",
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

M.type = "light"

return M
