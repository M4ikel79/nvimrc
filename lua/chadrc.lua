local options = {

  base46 = {
    theme = "dracula-pro", -- default theme
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
    theme_toggle = { "tokyonight", "tokyonight" },
  },

  ui = {
    cmp = {
      icons_left = false, -- only for non-atom styles!
      style = "default", -- default/flat_light/flat_dark/atom/atom_colored
      abbr_maxwidth = 60,
      -- for tailwind, css lsp etc
      format_colors = { lsp = true, icon = "󱓻" },
    },

    telescope = { style = "borderless" }, -- borderless / bordered

    statusline = {
      enabled = true,
      theme = "default", -- default/vscode/vscode_colored/minimal
      -- default/round/block/arrow separators work only for default statusline theme
      -- round and block will work for minimal theme only
      separator_style = "default",
      order = nil,
      modules = nil,
    },

    -- lazyload it when there are 1+ buffers
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
      { txt = "󰄉  Recent Files", keys = "r", cmd = "Telescope oldfiles" },
      { txt = "󰈭  Find Word", keys = "w", cmd = "Telescope live_grep" },
      { txt = "󰈔  New File", keys = "n", cmd = "enew" },
      { txt = "󰙅  File Explorer", keys = "e", cmd = "NvimTreeToggle" },
      { txt = "󰦄  KeyMaps", keys = "k", cmd = "Telescope keymaps" },
      {
        txt = "  Terminal",
        keys = "t",
        cmd = "lua require('nvchad.term').toggle({ pos = 'float', id = 'floatTerm' })",
      }, -- Fixed
      { txt = "  Themes", keys = "h", cmd = "lua require('nvchad.themes').open()" }, -- Fixed
      { txt = "󰒓  Config", keys = "c", cmd = "e ~/.config/nvim/init.lua" },
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
    theme = "grid", -- simple/grid
    excluded_groups = { "terminal (t)", "autopairs", "Nvim", "Opens" }, -- can add group name or with mode
  },

  mason = { pkgs = {}, skip = {} },

  colorify = {
    enabled = true,
    mode = "virtual", -- fg, bg, virtual
    virt_text = "󱓻 ",
    highlight = {
      hex = true,
      rgb = true, -- enable rgb()/rgba()
      hsl = true, -- enable hsl()/hsla()
      names = true, -- enable named colors like 'red'
      lspvars = true,
    },
  },
}

local status, chadrc = pcall(require, "chadrc")
return vim.tbl_deep_extend("force", options, status and chadrc or {})
