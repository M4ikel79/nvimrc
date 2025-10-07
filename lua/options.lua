require "nvchad.options"

local o = vim.o
local opt = vim.opt
local g = vim.g

-- Interface and Display Options
o.laststatus = 3
o.showmode = false
o.cmdheight = 1
o.termguicolors = true
o.shell = "/bin/bash"

o.pumheight = 10
o.pumblend = 10

o.cursorline = true
o.cursorlineopt = "both"
o.scrolloff = 10
o.sidescrolloff = 8
o.wrap = false
-- o.linebreak = true
-- o.breakindent = true
o.colorcolumn = "100"
o.showmatch = false

o.numberwidth = 2
o.ruler = false
o.signcolumn = "yes"

-- Text Editing and Indentation
o.smartindent = true
o.autoindent = true
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2

-- Clipboard and selection
o.clipboard = "unnamedplus"
o.selection = "exclusive"
o.selectmode = "mouse,key"
o.backspace = "indent,eol,start"

-- Search and Pattern Matching
o.ignorecase = true
o.smartcase = true
o.incsearch = true
o.hlsearch = true
o.grepformat = "%f:%l:%c:%m"
o.grepprg = "rg --vimgrep"

-- Window and Split Behavior
o.splitbelow = true
o.splitright = true
o.splitkeep = "screen"

-- File and Buffer Management
o.swapfile = false
o.autoread = true
o.autowrite = false
o.undofile = true
o.updatetime = 4000

-- Undo directory setup
local undodir = "~/.local/share/nvimrc/undodir"
opt.undodir = vim.fn.expand(undodir)
local undodir_path = vim.fn.expand(undodir)
if vim.fn.isdirectory(undodir_path) == 0 then
  vim.fn.mkdir(undodir_path, "p")
end

-- Completion and Wildmenu
o.completeopt = "menuone,noinsert,noselect"
opt.wildmenu = true
opt.wildmode = "longest:full,full"
opt.wildignorecase = true

-- Cursor and Visual Settings
opt.guicursor = {
  "n-c:block",
  "v:hor50",
  "i-ci-ve:ver25-blinkwait700-blinkoff400-blinkon250",
  "r-cr:hor20",
  "o:hor50",
  "a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",
  "sm:block-blinkwait175-blinkoff150-blinkon175",
}

-- Folding Configuration
o.foldmethod = "expr"
o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
o.foldlevel = 99
o.foldlevelstart = 99

-- Mouse and Input
o.mouse = "a"
o.timeoutlen = 400
o.errorbells = false

-- Language and Spelling
o.spelllang = "en"

-- Miscellaneous Options
opt.fillchars = { eob = " " }
opt.shortmess:append "sI"
opt.clipboard:append "unnamedplus"
opt.diffopt:append "vertical"
opt.diffopt:append "algorithm:patience"
opt.diffopt:append "linematch:60"
opt.whichwrap:append "<>[]hl"
o.autochdir = false

-- Provider Disable (Performance)
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-- Mason Path Setup
local is_windows = vim.fn.has "win32" ~= 0
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"
local mason_bin = table.concat({ vim.fn.stdpath "data", "mason", "bin" }, sep)
vim.env.PATH = mason_bin .. delim .. vim.env.PATH
