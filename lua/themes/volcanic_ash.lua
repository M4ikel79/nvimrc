-- Volcanic Ash Theme - Red/orange volcanic colors
-- NvChad theme implementation
local M = {}

M.base_30 = {
  white = "#FFE6D9",
  darker_black = "#1A0D08",
  black = "#331A0F",
  black2 = "#4D2817",
  one_bg = "#66351F",
  one_bg2 = "#804327",
  one_bg3 = "#99502F",
  grey = "#B35D37",
  grey_fg = "#CC6B3F",
  grey_fg2 = "#E67847",
  light_grey = "#FF864F",
  red = "#E63946",
  baby_pink = "#F77F00",
  pink = "#FB8500",
  line = "#66351F",
  green = "#80ED99",
  vibrant_green = "#95F5B4",
  nord_blue = "#219EBC",
  blue = "#023047",
  yellow = "#FFB703",
  sun = "#FFCB77",
  purple = "#8B5A3C",
  dark_purple = "#A0694A",
  teal = "#006A6B",
  orange = "#FF9500",
  cyan = "#22577A",
  statusline_bg = "#66351F",
  lightbg = "#99502F",
  pmenu_bg = "#E63946",
  folder_bg = "#FF9500",
}

M.base_16 = {
  base00 = "#331A0F",
  base01 = "#66351F",
  base02 = "#99502F",
  base03 = "#B35D37",
  base04 = "#E67847",
  base05 = "#FFE6D9",
  base06 = "#FFF2E9",
  base07 = "#FFFFFF",
  base08 = "#E63946",
  base09 = "#FF9500",
  base0A = "#FFB703",
  base0B = "#80ED99",
  base0C = "#006A6B",
  base0D = "#219EBC",
  base0E = "#8B5A3C",
  base0F = "#FB8500",
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
