-- Pastel Dream Theme - Soft pastel colors light theme
-- NvChad theme implementation
local M = {}

M.base_30 = {
  white = "#2E2E2E",
  darker_black = "#FFFFFF",
  black = "#F8F4FF",
  black2 = "#F0E8FF",
  one_bg = "#E8D8FF",
  one_bg2 = "#E0C8FF",
  one_bg3 = "#D8B8FF",
  grey = "#C8A8E8",
  grey_fg = "#B898D8",
  grey_fg2 = "#A888C8",
  light_grey = "#9878B8",
  red = "#FFB3BA",
  baby_pink = "#FFC3C0",
  pink = "#FFDFBA",
  line = "#E8D8FF",
  green = "#BAFFC9",
  vibrant_green = "#B9FFC1",
  nord_blue = "#BAE1FF",
  blue = "#C9C9FF",
  yellow = "#FFFFBA",
  sun = "#FFFFC9",
  purple = "#D4A5FF",
  dark_purple = "#C995FF",
  teal = "#A5F5FF",
  orange = "#FFCBA5",
  cyan = "#B5E5FF",
  statusline_bg = "#E8D8FF",
  lightbg = "#D8B8FF",
  pmenu_bg = "#D4A5FF",
  folder_bg = "#A5F5FF",
}

M.base_16 = {
  base00 = "#F8F4FF",
  base01 = "#E8D8FF",
  base02 = "#D8B8FF",
  base03 = "#C8A8E8",
  base04 = "#A888C8",
  base05 = "#2E2E2E",
  base06 = "#1E1E1E",
  base07 = "#000000",
  base08 = "#E85A9B",
  base09 = "#E8955A",
  base0A = "#E8D55A",
  base0B = "#5AE89B",
  base0C = "#5AE8D5",
  base0D = "#5A9BE8",
  base0E = "#9B5AE8",
  base0F = "#E85AD5",
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
