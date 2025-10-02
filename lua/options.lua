require "nvchad.options"

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!

-- Load NvChad defaults first, then apply custom options

local opt = vim.opt
local g = vim.g

-- Interface and Display Options
o.laststatus = 3 -- Global statusline
o.showmode = false -- Don't show mode in command line
o.cmdheight = 1 -- Command line height
o.termguicolors = true -- Enable 24-bit RGB colors
o.shell = "/bin/bash"

o.pumheight = 10 -- Popup menu height
o.pumblend = 10 -- Popup menu transparency

o.cursorline = true -- Highlight current line
-- o.cursorlineopt = "number"          -- Only highlight line number
o.cursorlineopt = "both" -- Highlight both line and number
o.scrolloff = 10 -- Keep 10 lines above/below cursor
o.sidescrolloff = 8 -- Keep 8 columns left/right of cursor
o.wrap = false -- Don't wrap long lines
o.colorcolumn = "100" -- Show column guide at 100 chars
o.showmatch = false -- Don't jump to matching brackets

-- o.number = true                     -- Show line numbers
-- o.relativenumber = true             -- Show relative line numbers
o.numberwidth = 2 -- Line number column width
o.ruler = false -- Don't show ruler (using statusline)
o.signcolumn = "yes" -- Always show sign column

-- Text Editing and Indentation
o.smartindent = true -- Smart auto-indenting
o.autoindent = true -- Copy indent from current line
o.expandtab = true -- Use spaces instead of tabs
o.shiftwidth = 2 -- Number of spaces for indentation
o.tabstop = 2 -- Number of spaces a tab represents
o.softtabstop = 2 -- Number of spaces for soft tab

-- Clipboard and selection
o.clipboard = "unnamedplus" -- Use system clipboard
o.selection = "exclusive" -- Character selection mode
o.selectmode = "mouse,key" -- Selection trigger modes
o.backspace = "indent,eol,start" -- Backspace behavior

-- Search and Pattern Matching
o.ignorecase = true -- Ignore case in search
o.smartcase = true -- Override ignorecase if uppercase used
o.incsearch = true -- Show search matches as you type
o.hlsearch = true -- Highlight all search matches
o.grepformat = "%f:%l:%c:%m" -- Format for grep output
o.grepprg = "rg --vimgrep" -- Use ripgrep for :grep

-- Window and Split Behavior
o.splitbelow = true -- Horizontal splits open below
o.splitright = true -- Vertical splits open to the right
o.splitkeep = "screen" -- Keep text on screen when splitting

-- File and Buffer Management
o.swapfile = false -- Disable swap files
o.autoread = true -- Auto-reload files changed outside vim
o.autowrite = false -- Don't auto-write files
o.undofile = true -- Enable persistent undo
o.updatetime = 4000 -- Faster completion and gitsigns

-- Undo directory setup
local undodir = "~/.local/share/nvimrc/undodir"
opt.undodir = vim.fn.expand(undodir)
local undodir_path = vim.fn.expand(undodir)
if vim.fn.isdirectory(undodir_path) == 0 then
  vim.fn.mkdir(undodir_path, "p")
end

-- Completion and Wildmenu
o.completeopt = "menuone,noinsert,noselect" -- Completion options
opt.wildmenu = true -- Enable command-line completion menu
opt.wildmode = "longest:full,full" -- Completion mode for command-line
opt.wildignorecase = true -- Case-insensitive tab completion

-- Cursor and Visual Settings
opt.guicursor = {
  "n-c:block", -- Normal, Command-line
  "v:hor50",
  "i-ci-ve:ver25-blinkwait700-blinkoff400-blinkon250", -- Insert mode
  "r-cr:hor20", -- Replace modes
  "o:hor50", -- Operator-pending
  "a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor", -- All modes blinking
  "sm:block-blinkwait175-blinkoff150-blinkon175", -- Showmatch mode
}

-- Folding Configuration
o.foldmethod = "expr" -- Use expression for folding
o.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- Use treesitter for folding
o.foldlevel = 99 -- Keep all folds open by default

-- Mouse and Input
o.mouse = "a" -- Enable mouse in all modes
o.timeoutlen = 400 -- Time to wait for mapped sequence
o.errorbells = false -- Disable error bells

-- Language and Spelling
o.spelllang = "en" -- Spell check language

-- Miscellaneous Options
opt.fillchars = { eob = " " } -- Hide end of buffer characters
opt.shortmess:append "sI" -- Disable nvim intro
opt.clipboard:append "unnamedplus" -- Additional clipboard setup
opt.diffopt:append "vertical" -- Vertical diff splits
opt.diffopt:append "algorithm:patience" -- Better diff algorithm
opt.diffopt:append "linematch:60" -- Better diff highlight
opt.whichwrap:append "<>[]hl" -- Allow cursor to wrap lines
o.autochdir = false -- Don't change directory automatically

-- Provider Disable (Performance)
g.loaded_perl_provider = 0 -- Disable Perl provider
g.loaded_ruby_provider = 0 -- Disable Ruby provider

-- Mason Path Setup: Add Mason binaries to PATH
local is_windows = vim.fn.has "win32" ~= 0
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"
local mason_bin = table.concat({ vim.fn.stdpath "data", "mason", "bin" }, sep)
vim.env.PATH = mason_bin .. delim .. vim.env.PATH
