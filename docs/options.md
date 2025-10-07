# Options Reference

Complete documentation of Neovim options configured in NvimRC.

## Table of Contents

- [Interface & Display](#interface--display)
- [Text Editing](#text-editing)
- [Search & Patterns](#search--patterns)
- [File Management](#file-management)
- [Window & Split Behavior](#window--split-behavior)
- [Completion](#completion)
- [Folding](#folding)
- [Performance](#performance)
- [Clipboard & Selection](#clipboard--selection)

---

## Interface & Display

### Status Line & Command Line

```lua
vim.o.laststatus = 3          -- Global statusline
vim.o.showmode = false        -- Don't show mode (in statusline)
vim.o.cmdheight = 1           -- Command line height
```

**Why these settings:**
- `laststatus = 3` - Single statusline across all windows (cleaner)
- `showmode = false` - Mode shown in statusline plugin
- `cmdheight = 1` - Standard height for command line

### Colors & Appearance

```lua
vim.o.termguicolors = true    -- 24-bit RGB colors
vim.o.pumheight = 10          -- Popup menu height
vim.o.pumblend = 10           -- Popup menu transparency (0-100)
```

**Why these settings:**
- `termguicolors` - Required for true color themes
- `pumheight = 10` - Prevents completion menu from being too tall
- `pumblend = 10` - Subtle transparency for modern look

### Cursor & Line Display

```lua
vim.o.cursorline = true       -- Highlight current line
vim.o.cursorlineopt = "both"  -- Highlight line number and text
vim.o.scrolloff = 10          -- Lines to keep above/below cursor
vim.o.sidescrolloff = 8       -- Columns to keep left/right of cursor
vim.o.wrap = false            -- Don't wrap lines
vim.o.colorcolumn = "100"     -- Vertical line at column 100
```

**Why these settings:**
- `cursorline` - Easy to spot cursor position
- `scrolloff = 10` - Keeps context visible when scrolling
- `wrap = false` - Prevents confusing wrapped lines in code
- `colorcolumn = "100"` - Standard line length guide

### Line Numbers & Signs

```lua
vim.o.numberwidth = 2         -- Width of number column
vim.o.ruler = false           -- Don't show cursor position (in statusline)
vim.o.signcolumn = "yes"      -- Always show sign column
```

**Why these settings:**
- `numberwidth = 2` - Minimal width (expands as needed)
- `signcolumn = "yes"` - Prevents text shifting when signs appear

### Fill Characters

```lua
vim.opt.fillchars = { eob = " " }  -- Hide end-of-buffer tildes
```

**Why:** Cleaner appearance without `~` characters

---

## Text Editing

### Indentation

```lua
vim.o.smartindent = true      -- Smart autoindenting
vim.o.autoindent = true       -- Copy indent from current line
vim.o.expandtab = true        -- Spaces instead of tabs
vim.o.shiftwidth = 2          -- Spaces for auto-indent
vim.o.tabstop = 2             -- Spaces per tab
vim.o.softtabstop = 2         -- Spaces per tab in insert mode
```

**Why these settings:**
- `expandtab` - Consistent across editors/platforms
- `2 spaces` - Modern standard (matches Prettier, most style guides)
- `smartindent` - Automatically indents after `{`, etc.

### Text Behavior

```lua
vim.o.backspace = "indent,eol,start"  -- Backspace over everything
vim.o.showmatch = false               -- Don't jump to matching bracket
```

**Why:**
- `backspace` - Intuitive backspace behavior
- `showmatch = false` - Jumping is distracting (pairs plugin handles this)

---

## Search & Patterns

### Search Behavior

```lua
vim.o.ignorecase = true       -- Ignore case in search
vim.o.smartcase = true        -- Override ignorecase if uppercase used
vim.o.incsearch = true        -- Show matches as you type
vim.o.hlsearch = true         -- Highlight all matches
```

**Why these settings:**
- `ignorecase + smartcase` - Smart case-insensitive search
  - `/foo` matches "foo", "Foo", "FOO"
  - `/Foo` matches only "Foo"
- `incsearch` - Immediate feedback while typing
- `hlsearch` - See all matches (clear with `<Esc>`)

### Grep Configuration

```lua
vim.o.grepformat = "%f:%l:%c:%m"     -- Format for quickfix
vim.o.grepprg = "rg --vimgrep"       -- Use ripgrep for :grep
```

**Why:**
- Ripgrep is much faster than default grep
- Proper format for Neovim's quickfix list

---

## File Management

### File Behavior

```lua
vim.o.swapfile = false        -- Don't use swap files
vim.o.autoread = true         -- Auto-reload changed files
vim.o.autowrite = false       -- Don't auto-write on :next, etc.
vim.o.undofile = true         -- Persistent undo
vim.o.updatetime = 4000       -- CursorHold time (ms)
```

**Why these settings:**
- `swapfile = false` - Modern systems don't need it, causes confusion
- `autoread` - Stay in sync with external changes
- `autowrite = false` - Explicit saving prevents accidents
- `undofile` - Undo survives closing/reopening files
- `updatetime = 4000` - For CursorHold events (git signs, etc.)

### Undo Directory

```lua
vim.opt.undodir = vim.fn.expand("~/.local/share/nvimrc/undodir")
```

**Why:**
- Centralized undo history
- Separate from config for cleaner git tracking
- Auto-created if doesn't exist

---

## Window & Split Behavior

### Split Direction

```lua
vim.o.splitbelow = true       -- Horizontal splits open below
vim.o.splitright = true       -- Vertical splits open right
vim.o.splitkeep = "screen"    -- Keep cursor position on split
```

**Why:**
- `splitbelow/splitright` - More intuitive (matches reading direction)
- `splitkeep = "screen"` - Cursor stays in same screen position

---

## Completion

### Completion Menu

```lua
vim.o.completeopt = "menuone,noinsert,noselect"
```

**Options explained:**
- `menuone` - Show menu even for single match
- `noinsert` - Don't auto-insert text
- `noselect` - Don't auto-select first item

**Why:** Gives user control over completion

### Wildmenu (Command-line Completion)

```lua
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.wildignorecase = true
```

**Why:**
- `longest:full` - Complete longest common string first
- `full` - Then show full list
- `wildignorecase` - Case-insensitive command completion

---

## Folding

### Fold Configuration

```lua
vim.o.foldmethod = "expr"                              -- Use expression
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"   -- Treesitter folding
vim.o.foldlevel = 99                                   -- Open all folds by default
vim.o.foldlevelstart = 99                              -- Open all on file open
```

**Why these settings:**
- Treesitter-based folding is syntax-aware
- Starting with everything open is less surprising
- nvim-origami plugin enhances fold display

---

## Performance

### Provider Disable

```lua
vim.g.loaded_perl_provider = 0   -- Disable Perl provider
vim.g.loaded_ruby_provider = 0   -- Disable Ruby provider
```

**Why:** Faster startup (we don't use these languages)

### Disabled Default Plugins

```lua
performance = {
  rtp = {
    disabled_plugins = {
      "2html_plugin",
      "tohtml",
      "getscript",
      "getscriptPlugin",
      "gzip",
      "logipat",
      "netrw",        -- Using nvim-tree instead
      "netrwPlugin",
      "netrwSettings",
      "netrwFileHandlers",
      "matchit",
      "tar",
      "tarPlugin",
      "rrhelper",
      "spellfile_plugin",
      "vimball",
      "vimballPlugin",
      "zip",
      "zipPlugin",
      "tutor",
      "rplugin",
      "syntax",       -- Using treesitter instead
      "synmenu",
      "optwin",
      "compiler",
      "bugreport",
      "ftplugin",
    },
  },
}
```

**Why:** Significant startup time improvement

### Mason Path

```lua
local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
vim.env.PATH = mason_bin .. ":" .. vim.env.PATH
```

**Why:** Makes Mason-installed tools available to Neovim

---

## Clipboard & Selection

### Clipboard Integration

```lua
vim.o.clipboard = "unnamedplus"           -- System clipboard
vim.opt.clipboard:append("unnamedplus")   -- Ensure it's set
```

**Why:** Seamless copy/paste with system clipboard

### Selection Behavior

```lua
vim.o.selection = "exclusive"   -- Cursor after selection
vim.o.selectmode = "mouse,key"  -- Visual mode with mouse/keys
```

**Why:** Standard selection behavior

---

## Cursor Configuration

### Cursor Shapes

```lua
vim.opt.guicursor = {
  "n-c:block",                                -- Normal/Command: block
  "v:hor50",                                  -- Visual: horizontal 50%
  "i-ci-ve:ver25-blinkwait700-blinkoff400-blinkon250",  -- Insert: thin vertical, blinking
  "r-cr:hor20",                               -- Replace: horizontal 20%
  "o:hor50",                                  -- Operator: horizontal 50%
  "a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",  -- All: blink settings
  "sm:block-blinkwait175-blinkoff150-blinkon175",  -- Showmatch: block
}
```

**Why:** Visual feedback for different modes

---

## Mouse & Input

```lua
vim.o.mouse = "a"           -- Enable mouse in all modes
vim.o.timeoutlen = 400      -- Key sequence timeout (ms)
vim.o.errorbells = false    -- No beeping
```

**Why:**
- `mouse = "a"` - Modern convenience without losing keyboard focus
- `timeoutlen = 400` - Fast enough for sequences, slow enough to think
- `errorbells = false` - Visual feedback only

---

## Shell Configuration

```lua
vim.o.shell = "/bin/bash"   -- Default shell
```

**Why:** Consistent shell behavior across systems

---

## Miscellaneous Options

### Auto-directory Change

```lua
vim.o.autochdir = false     -- Don't change directory automatically
```

**Why:** Explicit project root management is more predictable

### Short Messages

```lua
vim.opt.shortmess:append("sI")
```

**Options:**
- `s` - Don't show "search hit BOTTOM" message
- `I` - Don't show intro message on startup

### Diff Options

```lua
vim.opt.diffopt:append("vertical")      -- Vertical diff splits
vim.opt.diffopt:append("algorithm:patience")  -- Better diff algorithm
vim.opt.diffopt:append("linematch:60")  -- Match similar lines
```

**Why:** Better diff display and algorithm

### Which Wrap

```lua
vim.opt.whichwrap:append("<>[]hl")
```

**Allows these keys to move to previous/next line:**
- `h`, `l` - Left/right in normal mode
- `<Left>`, `<Right>` - Arrow keys
- `[`, `]` - In insert mode

### Spelling

```lua
vim.o.spelllang = "en"      -- English spelling
```

**Usage:** Enable with `<leader>us` or `:set spell`

---

## Option Categories Summary

### Fast Startup
- Disabled providers (Perl, Ruby)
- Disabled default plugins
- Lazy-loading plugins

### Modern Defaults
- True color support
- System clipboard integration
- Smart case search
- Persistent undo

### Code-Friendly
- 2-space indentation
- No line wrapping
- Column guide at 100
- Treesitter folding

### User Experience
- Global statusline
- Context scrolling
- Smart completion
- Intuitive splits

---

## Checking Current Options

### View Option Value

```vim
:set option?              " Show value
:set option               " Show value (alternate)
:verbose set option?      " Show where it was last set
```

### View All Options

```vim
:options                  " Interactive option browser
:set all                  " Show all options
:set                      " Show modified options
```

### View in Lua

```lua
:lua print(vim.o.option)        -- Global option
:lua print(vim.bo.option)       -- Buffer option
:lua print(vim.wo.option)       -- Window option
```

---

## Option Scopes

Neovim has three option scopes:

### Global Options (`vim.o`)
Apply everywhere:
```lua
vim.o.mouse = "a"
vim.o.ignorecase = true
```

### Buffer Options (`vim.bo`)
Per-buffer settings:
```lua
vim.bo.expandtab = true
vim.bo.shiftwidth = 2
```

### Window Options (`vim.wo`)
Per-window settings:
```lua
vim.wo.number = true
vim.wo.relativenumber = true
```

### `vim.opt` vs `vim.o`

```lua
-- vim.opt - Can use :append, :prepend, :remove
vim.opt.shortmess:append("c")
vim.opt.clipboard:append("unnamedplus")

-- vim.o - Direct assignment only
vim.o.mouse = "a"
vim.o.wrap = false
```

---

## Customizing Options

### In options.lua

```lua
-- Add to lua/options.lua
local o = vim.o
local opt = vim.opt

o.your_option = value
opt.list_option:append("value")
```

### Buffer-Specific

```lua
-- In autocmd or ftplugin
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
  end,
})
```

### Window-Specific

```lua
-- For specific window
vim.wo.number = false
vim.wo.signcolumn = "no"
```

---

## Common Option Patterns

### Toggle Options

```lua
-- Create toggle function
local function toggle_option(option)
  vim.opt[option] = not vim.opt[option]:get()
end

-- Usage
vim.keymap.set("n", "<leader>uw", function()
  toggle_option("wrap")
end, { desc = "Toggle line wrap" })
```

### Conditional Options

```lua
-- Set based on condition
if vim.fn.has("mac") == 1 then
  vim.o.shell = "/bin/zsh"
else
  vim.o.shell = "/bin/bash"
end
```

### Per-Filetype Options

```lua
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text" },
  callback = function()
    vim.wo.wrap = true
    vim.wo.linebreak = true
  end,
})
```

---

## Performance Tips

### Slow Options

Some options can impact performance:

```lua
-- Potentially slow (but useful)
vim.o.cursorline = true      -- Highlight current line
vim.o.relativenumber = true  -- Relative line numbers

-- Fast alternatives
vim.o.cursorline = false
vim.o.number = true          -- Just absolute numbers
```

### Profile Options

Check which options impact performance:

```vim
:profile start profile.log
:profile func *
:profile file *
" Use Neovim normally
:profile pause
:noautocmd qall!
```

---

## Troubleshooting Options

### Option Not Working

1. **Check if set correctly:**
   ```vim
   :verbose set option?
   ```

2. **Check for conflicts:**
   ```vim
   :set option?          " Current value
   :set option&          " Reset to default
   ```

3. **Check scope:**
   ```lua
   print(vim.o.option)   -- Global
   print(vim.bo.option)  -- Buffer
   print(vim.wo.option)  -- Window
   ```

### Option Gets Reset

Likely being overridden by:
- Plugin
- Autocmd
- Filetype plugin

**Solution:** Set in autocmd after plugins load:

```lua
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.o.your_option = value
  end,
})
```

---

## Related Documentation

- [Neovim Options](https://neovim.io/doc/user/options.html) - Official docs
- [Customization Guide](customization.md) - How to modify
- [FAQ](faq.md) - Common option questions

---

## Quick Reference Card

```
Display:
  termguicolors=true      " True color
  cursorline=true         " Highlight line
  number=true             " Line numbers
  signcolumn="yes"        " Always show signs

Editing:
  expandtab=true          " Spaces not tabs
  shiftwidth=2            " 2 space indent
  smartindent=true        " Auto indent

Search:
  ignorecase=true         " Ignore case
  smartcase=true          " Unless uppercase
  hlsearch=true           " Highlight matches

Files:
  undofile=true           " Persistent undo
  swapfile=false          " No swap files
  autoread=true           " Auto reload

Behavior:
  mouse="a"               " Enable mouse
  clipboard="unnamedplus" " System clipboard
  splitbelow=true         " Split below
  splitright=true         " Split right
```
