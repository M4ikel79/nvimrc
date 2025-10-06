-- Matrix Code Theme - Green terminal matrix style
-- NvChad theme implementation
local M = {}

M.base_30 = {
  white = "#00FF00",
  darker_black = "#000000",
  black = "#001100",
  black2 = "#002200",
  one_bg = "#003300",
  one_bg2 = "#004400",
  one_bg3 = "#005500",
  grey = "#006600",
  grey_fg = "#007700",
  grey_fg2 = "#008800",
  light_grey = "#009900",
  red = "#FF0000",
  baby_pink = "#FF3333",
  pink = "#FF6666",
  line = "#003300",
  green = "#00FF00",
  vibrant_green = "#33FF33",
  nord_blue = "#0066FF",
  blue = "#3399FF",
  yellow = "#FFFF00",
  sun = "#FFFF33",
  purple = "#FF00FF",
  dark_purple = "#FF33FF",
  teal = "#00FFFF",
  orange = "#FF9900",
  cyan = "#00FFCC",
  statusline_bg = "#003300",
  lightbg = "#005500",
  pmenu_bg = "#00FF00",
  folder_bg = "#00FFFF",
}

M.base_16 = {
  base00 = "#001100",
  base01 = "#003300",
  base02 = "#005500",
  base03 = "#006600",
  base04 = "#008800",
  base05 = "#00FF00",
  base06 = "#33FF33",
  base07 = "#66FF66",
  base08 = "#FF0000",
  base09 = "#FF9900",
  base0A = "#FFFF00",
  base0B = "#00FF00",
  base0C = "#00FFFF",
  base0D = "#0066FF",
  base0E = "#FF00FF",
  base0F = "#FF6666",
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
