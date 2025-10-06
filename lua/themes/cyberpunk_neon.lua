-- Cyberpunk Neon Theme - Bright neon cyberpunk colors
-- NvChad theme implementation
local M = {}

M.base_30 = {
  white = "#00FFFF",
  darker_black = "#0D001A",
  black = "#1A0033",
  black2 = "#2D004D",
  one_bg = "#400066",
  one_bg2 = "#530080",
  one_bg3 = "#660099",
  grey = "#8000B3",
  grey_fg = "#9900CC",
  grey_fg2 = "#B300E6",
  light_grey = "#CC00FF",
  red = "#FF0080",
  baby_pink = "#FF3399",
  pink = "#FF66CC",
  line = "#400066",
  green = "#00FF80",
  vibrant_green = "#33FF99",
  nord_blue = "#0080FF",
  blue = "#3399FF",
  yellow = "#FFFF00",
  sun = "#FFFF33",
  purple = "#8000FF",
  dark_purple = "#9933FF",
  teal = "#00FFCC",
  orange = "#FF8000",
  cyan = "#00CCFF",
  statusline_bg = "#400066",
  lightbg = "#660099",
  pmenu_bg = "#FF0080",
  folder_bg = "#00FFCC",
}

M.base_16 = {
  base00 = "#1A0033",
  base01 = "#400066",
  base02 = "#660099",
  base03 = "#8000B3",
  base04 = "#B300E6",
  base05 = "#00FFFF",
  base06 = "#66FFFF",
  base07 = "#FFFFFF",
  base08 = "#FF0080",
  base09 = "#FF8000",
  base0A = "#FFFF00",
  base0B = "#00FF80",
  base0C = "#00FFCC",
  base0D = "#0080FF",
  base0E = "#8000FF",
  base0F = "#FF66CC",
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
