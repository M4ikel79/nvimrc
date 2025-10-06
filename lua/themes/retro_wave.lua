-- Retro Wave Theme - 80s synthwave style
-- NvChad theme implementation
local M = {}

M.base_30 = {
  white = "#F0F0FF",
  darker_black = "#0F0F23",
  black = "#1E1E46",
  black2 = "#2D2D69",
  one_bg = "#3C3C8C",
  one_bg2 = "#4B4BAF",
  one_bg3 = "#5A5AD2",
  grey = "#6969F5",
  grey_fg = "#7878FF",
  grey_fg2 = "#9696FF",
  light_grey = "#B4B4FF",
  red = "#FF1493",
  baby_pink = "#FF69B4",
  pink = "#FFB6C1",
  line = "#3C3C8C",
  green = "#00FF7F",
  vibrant_green = "#7FFF00",
  nord_blue = "#00BFFF",
  blue = "#1E90FF",
  yellow = "#FFD700",
  sun = "#FFFF00",
  purple = "#DA70D6",
  dark_purple = "#BA55D3",
  teal = "#00CED1",
  orange = "#FF8C00",
  cyan = "#00FFFF",
  statusline_bg = "#3C3C8C",
  lightbg = "#5A5AD2",
  pmenu_bg = "#FF1493",
  folder_bg = "#00CED1",
}

M.base_16 = {
  base00 = "#1E1E46",
  base01 = "#3C3C8C",
  base02 = "#5A5AD2",
  base03 = "#6969F5",
  base04 = "#9696FF",
  base05 = "#F0F0FF",
  base06 = "#FFFFFF",
  base07 = "#FFFFFF",
  base08 = "#FF1493",
  base09 = "#FF8C00",
  base0A = "#FFD700",
  base0B = "#00FF7F",
  base0C = "#00CED1",
  base0D = "#00BFFF",
  base0E = "#DA70D6",
  base0F = "#FFB6C1",
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
