-- Ocean Depths Theme - Deep blue/teal ocean inspired
-- NvChad theme implementation
local M = {}

M.base_30 = {
  white = "#E6F7FF",
  darker_black = "#0A1219",
  black = "#0F1E2E",
  black2 = "#1B2A3D",
  one_bg = "#2A3A4A",
  one_bg2 = "#3A4A5A",
  one_bg3 = "#4A5A6A",
  grey = "#5A6A7A",
  grey_fg = "#6A7A8A",
  grey_fg2 = "#7A8A9A",
  light_grey = "#8A9AAA",
  red = "#FF5370",
  baby_pink = "#FF738A",
  pink = "#F78C6C",
  line = "#2A3A4A",
  green = "#C3E88D",
  vibrant_green = "#DDFFA3",
  nord_blue = "#82AAFF",
  blue = "#61AFEF",
  yellow = "#FFCB6B",
  sun = "#FFD585",
  purple = "#C792EA",
  dark_purple = "#D7A2FA",
  teal = "#89DDFF",
  orange = "#F78C6C",
  cyan = "#56B6C2",
  statusline_bg = "#2A3A4A",
  lightbg = "#4A5A6A",
  pmenu_bg = "#82AAFF",
  folder_bg = "#89DDFF",
}

M.base_16 = {
  base00 = "#0F1E2E",
  base01 = "#2A3A4A",
  base02 = "#4A5A6A",
  base03 = "#5A6A7A",
  base04 = "#7A8A9A",
  base05 = "#E6F7FF",
  base06 = "#F6FFFF",
  base07 = "#FFFFFF",
  base08 = "#FF5370",
  base09 = "#F78C6C",
  base0A = "#FFCB6B",
  base0B = "#C3E88D",
  base0C = "#89DDFF",
  base0D = "#82AAFF",
  base0E = "#C792EA",
  base0F = "#F78C6C",
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
