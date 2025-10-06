local options = {
  base46 = {
    theme = "ayu_dark",
    hl_add = {},
    hl_override = {
      Comment = { italic = true },
      ["@comment"] = { italic = true },
      LineNr = { bold = true },
      CursorLineNr = { bold = true },
    },
    integrations = {},
    changed_themes = {},
    transparency = false,
    theme_toggle = { "tokyodark", "ayu_dark" },
  },

  ui = {
    cmp = {
      icons_left = false,
      style = "default",
      abbr_maxwidth = 60,
      format_colors = { lsp = true, icon = "󱓻" },
    },

    telescope = { style = "borderless" },

    statusline = {
      enabled = true,
      theme = "default",
      separator_style = "default",
      order = nil,
      modules = nil,
    },

    tabufline = {
      enabled = true,
      lazyload = true,
      order = { "treeOffset", "buffers", "tabs", "btns" },
      modules = nil,
      bufwidth = 21,
    },
  },

  nvdash = {
    load_on_startup = true,
    header = {
      "                                                                     ",
      "       ████ ██████           █████      ██                     ",
      "      ███████████             █████                             ",
      "      █████████ ███████████████████ ███   ███████████   ",
      "     █████████  ███    █████████████ █████ ██████████████   ",
      "    █████████ ██████████ █████████ █████ █████ ████ █████   ",
      "  ███████████ ███    ███ █████████ █████ █████ ████ █████  ",
      " ██████  █████████████████████ ████ █████ █████ ████ ██████ ",
    },
    buttons = {
      { txt = "󰈞  Find Files", keys = "f", cmd = "Telescope find_files" },
      { txt = "  Recent Files", keys = "r", cmd = "Telescope oldfiles" },
      { txt = "  Find Word", keys = "w", cmd = "Telescope live_grep" },
      { txt = "  New File", keys = "n", cmd = "enew" },
      { txt = "󰙅 File Explorer", keys = "e", cmd = "NvimTreeToggle" },
      { txt = "󰍐 KeyMaps", keys = "k", cmd = "Telescope keymaps" },
      {
        txt = "  Terminal",
        keys = "t",
        cmd = "lua require('nvchad.term').toggle({ pos = 'float', id = 'floatTerm' })",
      },
      { txt = " Themes", keys = "h", cmd = "lua require('nvchad.themes').open()" },
      { txt = "󰒓  Config", keys = "c", cmd = "e ~/.config/nvimrc/init.lua" },
      { txt = "󰢛  Mason", keys = "m", cmd = "Mason" },
      { txt = "󰒲  Lazy", keys = "l", cmd = "Lazy" },
      { txt = "󰅚  Quit", keys = "q", cmd = "qa" },
    },
  },

  term = {
    base46_colors = true,
    winopts = { number = false, relativenumber = false },
    sizes = { sp = 0.3, vsp = 0.2, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
    float = {
      relative = "editor",
      row = 0.3,
      col = 0.25,
      width = 0.5,
      height = 0.4,
      border = "single",
    },
  },

  lsp = { signature = true },

  cheatsheet = {
    theme = "grid",
    excluded_groups = { "terminal (t)", "autopairs", "Nvim", "Opens" },
  },

  mason = { pkgs = {}, skip = {} },

  colorify = {
    enabled = true,
    mode = "virtual",
    virt_text = "󱓻 ",
    highlight = {
      hex = true,
      rgb = true,
      hsl = true,
      names = true,
      lspvars = true,
    },
  },
}

local status, chadrc = pcall(require, "chadrc")
return vim.tbl_deep_extend("force", options, status and chadrc or {})
