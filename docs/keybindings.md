# Keybindings Reference

Complete keybinding documentation for NvimRC. Leader key is `<Space>`.

## Table of Contents

- [Philosophy](#philosophy)
- [Core Editing](#core-editing)
- [Navigation](#navigation)
- [LSP & Code](#lsp--code)
- [Git Operations](#git-operations)
- [Terminal & Runners](#terminal--runners)
- [File & Buffer Management](#file--buffer-management)
- [Search & Replace](#search--replace)
- [Plugin-Specific](#plugin-specific)
- [Color & Themes](#color--themes)
- [Menu System](#menu-system)
- [Cheat Sheet](#cheat-sheet)

---

## Philosophy

NvimRC uses a modular keymap system with two approaches:

1. **mini.keymap** for smart, context-aware core editing (Tab, Enter, etc.)
2. **vim.keymap.set** for explicit plugin-specific actions (LSP, Git, etc.)

### Key Principles

- **Mnemonic**: Keys are organized by logical prefixes
- **Consistent**: Similar actions use similar keys
- **Discoverable**: Use `<Space>` then wait to see options via which-key
- **Smart**: Keys adapt to context (completion menus, pairs, etc.)

---

## Core Editing

### Insert Mode Intelligence

| Key         | Action                | Behavior                                                                     |
| ----------- | --------------------- | ---------------------------------------------------------------------------- |
| `<Tab>`     | Smart completion/jump | Cycles through: completion menu → snippet expand → jump forward → insert tab |
| `<S-Tab>`   | Reverse smart action  | Reverse of Tab                                                               |
| `<CR>`      | Smart enter           | Accepts completion or respects pairs                                         |
| `<BS>`      | Smart backspace       | Respects pairs, hungry deletion                                              |
| `jk` / `kj` | Escape                | Quick exit to Normal mode                                                    |

**Examples:**

```
# In completion menu:
<Tab>     - Select next item
<S-Tab>   - Select previous item
<CR>      - Accept selection

# After closing bracket:
function(|)   # cursor at |
<Tab>         # jumps to: function()|

# With pairs:
"|"           # cursor between quotes
<BS>          # deletes both quotes
```

### Normal Mode Editing

| Key     | Action          | Description                       |
| ------- | --------------- | --------------------------------- |
| `H`     | Line start      | Jump to first non-blank character |
| `L`     | Line end        | Jump to last character            |
| `J`     | Join lines      | Keeps cursor position             |
| `<C-d>` | Half page down  | Centered on screen                |
| `<C-u>` | Half page up    | Centered on screen                |
| `n`     | Next search     | Centered on screen                |
| `N`     | Previous search | Centered on screen                |

### Visual Mode

| Key     | Action              | Description               |
| ------- | ------------------- | ------------------------- |
| `<`     | Indent left         | Keeps selection           |
| `>`     | Indent right        | Keeps selection           |
| `<S-j>` | Move selection down | Visual block move         |
| `<S-k>` | Move selection up   | Visual block move         |
| `p`     | Paste               | Without yanking selection |

### Text Objects (mini.surround)

| Key     | Action                | Example                   |
| ------- | --------------------- | ------------------------- |
| `gsa"`  | Add surrounding       | `word` → `"word"`         |
| `gsd"`  | Delete surrounding    | `"word"` → `word`         |
| `gsr"'` | Replace surrounding   | `"word"` → `'word'`       |
| `gsf"`  | Find surrounding      | Jump to next `"`          |
| `gsh`   | Highlight surrounding | Visual select surrounding |

**Common surroundings:**

- `"` - Double quotes
- `'` - Single quotes
- `` ` `` - Backticks
- `(` or `)` - Parentheses
- `{` or `}` - Braces
- `[` or `]` - Brackets
- `<` or `>` - Angle brackets
- `t` - HTML/XML tags

---

## Navigation

### Window Navigation

| Key         | Action          | Description |
| ----------- | --------------- | ----------- |
| `<C-h>`     | Window left     | Tmux-aware  |
| `<C-j>`     | Window down     | Tmux-aware  |
| `<C-k>`     | Window up       | Tmux-aware  |
| `<C-l>`     | Window right    | Tmux-aware  |
| `<M-Up>`    | Increase height | Resize +2   |
| `<M-Down>`  | Decrease height | Resize -2   |
| `<M-Left>`  | Decrease width  | Resize -2   |
| `<M-Right>` | Increase width  | Resize +2   |

### Window Management

| Key                | Action         | Description         |
| ------------------ | -------------- | ------------------- |
| `<leader>-`        | Split below    | Horizontal split    |
| `<leader>\|`       | Split right    | Vertical split      |
| `<leader>wd`       | Close window   | Current window only |
| `<leader>wo`       | Close others   | Keep current only   |
| `<leader>w=`       | Equalize sizes | Balance windows     |
| `<leader>wh/j/k/l` | Move window    | To edge of screen   |

### Buffer Navigation

| Key                | Action          | Description          |
| ------------------ | --------------- | -------------------- |
| `<A-,>`            | Previous buffer | Cycle backward       |
| `<A-.>`            | Next buffer     | Cycle forward        |
| `<A-1>` to `<A-9>` | Go to buffer N  | Direct jump          |
| `<A-0>`            | Last buffer     | Go to end of list    |
| `<A-c>`            | Close buffer    | Safe close           |
| `<C-p>`            | Buffer picker   | Telescope fuzzy find |

### Tab Management

| Key          | Action       | Description    |
| ------------ | ------------ | -------------- |
| `<leader>tn` | New tab      | Empty tab      |
| `<leader>tc` | Close tab    | Current tab    |
| `<leader>tl` | Next tab     | Cycle forward  |
| `<leader>th` | Previous tab | Cycle backward |
| `<leader>t0` | First tab    | Jump to start  |

| `<leader>t# Keybindings Reference

Complete keybinding documentation for NvimRC. Leader key is `<Space>`.

## Table of Contents

- [Philosophy](#philosophy)
- [Core Editing](#core-editing)
- [Navigation](#navigation)
- [LSP & Code](#lsp--code)
- [Git Operations](#git-operations)
- [Terminal & Runners](#terminal--runners)
- [File & Buffer Management](#file--buffer-management)
- [Search & Replace](#search--replace)
- [Plugin-Specific](#plugin-specific)
- [Color & Themes](#color--themes)
- [Menu System](#menu-system)
- [Cheat Sheet](#cheat-sheet)

---

## Philosophy

NvimRC uses a modular keymap system with two approaches:

1. **mini.keymap** for smart, context-aware core editing (Tab, Enter, etc.)
2. **vim.keymap.set** for explicit plugin-specific actions (LSP, Git, etc.)

### Key Principles

- **Mnemonic**: Keys are organized by logical prefixes
- **Consistent**: Similar actions use similar keys
- **Discoverable**: Use `<Space>` then wait to see options via which-key
- **Smart**: Keys adapt to context (completion menus, pairs, etc.)

---

## Core Editing

### Insert Mode Intelligence

| Key         | Action                | Behavior                                                                     |
| ----------- | --------------------- | ---------------------------------------------------------------------------- |
| `<Tab>`     | Smart completion/jump | Cycles through: completion menu → snippet expand → jump forward → insert tab |
| `<S-Tab>`   | Reverse smart action  | Reverse of Tab                                                               |
| `<CR>`      | Smart enter           | Accepts completion or respects pairs                                         |
| `<BS>`      | Smart backspace       | Respects pairs, hungry deletion                                              |
| `jk` / `kj` | Escape                | Quick exit to Normal mode                                                    |

**Examples:**

```
# In completion menu:
<Tab>     - Select next item
<S-Tab>   - Select previous item
<CR>      - Accept selection

# After closing bracket:
function(|)   # cursor at |
<Tab>         # jumps to: function()|

# With pairs:
"|"           # cursor between quotes
<BS>          # deletes both quotes
```

### Normal Mode Editing

| Key     | Action          | Description                       |
| ------- | --------------- | --------------------------------- |
| `H`     | Line start      | Jump to first non-blank character |
| `L`     | Line end        | Jump to last character            |
| `J`     | Join lines      | Keeps cursor position             |
| `<C-d>` | Half page down  | Centered on screen                |
| `<C-u>` | Half page up    | Centered on screen                |
| `n`     | Next search     | Centered on screen                |
| `N`     | Previous search | Centered on screen                |

### Visual Mode

| Key     | Action              | Description               |
| ------- | ------------------- | ------------------------- |
| `<`     | Indent left         | Keeps selection           |
| `>`     | Indent right        | Keeps selection           |
| `<S-j>` | Move selection down | Visual block move         |
| `<S-k>` | Move selection up   | Visual block move         |
| `p`     | Paste               | Without yanking selection |

| Last tab | Jump to end |

### Flash Navigation (Lightning Fast)

| Key | Mode            | Action                             |
| --- | --------------- | ---------------------------------- |
| `s` | Normal/Visual   | Flash jump to any visible location |
| `S` | Normal/Visual   | Flash treesitter (AST-aware)       |
| `r` | Operator        | Remote flash                       |
| `R` | Operator/Visual | Treesitter search                  |

**Flash Usage:**

1. Press `s`
2. Type 2 characters
3. Labels appear on matching locations
4. Type label character to jump

---

## LSP & Code

### LSP Navigation

| Key     | Action                | Description                        |
| ------- | --------------------- | ---------------------------------- |
| `gd`    | Go to definition      | Jump to where symbol is defined    |
| `gD`    | Go to declaration     | Jump to declaration (if different) |
| `gi`    | Go to implementation  | Jump to implementation             |
| `gt`    | Go to type definition | Jump to type definition            |
| `gr`    | Show references       | Telescope picker                   |
| `gR`    | References (Trouble)  | In sidebar                         |
| `K`     | Hover documentation   | Show docs for symbol               |
| `<C-k>` | Signature help        | Show function signature            |

### Code Actions

| Key          | Mode          | Action                    |
| ------------ | ------------- | ------------------------- |
| `<leader>ca` | Normal/Visual | Code action menu          |
| `<leader>cr` | Normal        | Rename symbol             |
| `<leader>cf` | Normal/Visual | Format buffer/selection   |
| `<leader>cF` | Normal/Visual | Format injected languages |
| `<leader>cs` | Normal        | Document symbols          |
| `<leader>cS` | Normal        | Workspace symbols         |

### Diagnostics

| Key          | Action              | Description         |
| ------------ | ------------------- | ------------------- |
| `]d`         | Next diagnostic     | Jump forward        |
| `[d`         | Previous diagnostic | Jump backward       |
| `<leader>e`  | Show diagnostic     | Float window        |
| `<leader>xx` | All diagnostics     | Trouble window      |
| `<leader>xX` | Buffer diagnostics  | Current buffer only |
| `<leader>xq` | Quickfix            | Trouble quickfix    |
| `<leader>xt` | Todo comments       | All TODO/FIXME      |

### Workspace Management

| Key          | Action                  | Description   |
| ------------ | ----------------------- | ------------- |
| `<leader>wa` | Add workspace folder    | LSP workspace |
| `<leader>wr` | Remove workspace folder | LSP workspace |
| `<leader>wl` | List workspace folders  | Print list    |

### LSP Info & Control

| Key          | Action       | Description           |
| ------------ | ------------ | --------------------- |
| `<leader>li` | LSP info     | Show attached clients |
| `<leader>lr` | LSP restart  | Restart all clients   |
| `<leader>lI` | Mason        | Open installer        |
| `<leader>lf` | Conform info | Formatter status      |

---

## Git Operations

### LazyGit Integration

| Key          | Action            | Description       |
| ------------ | ----------------- | ----------------- |
| `<leader>gg` | Open LazyGit      | Full git TUI      |
| `<leader>gG` | LazyGit (new tab) | In new tab        |
| `<leader>gl` | Git log           | LazyGit log view  |
| `<leader>gf` | File history      | Current file only |
| `<leader>gc` | Current file      | LazyGit for file  |

### Hunk Operations (Gitsigns)

| Key          | Mode          | Action          |
| ------------ | ------------- | --------------- |
| `]h`         | Normal        | Next hunk       |
| `[h`         | Normal        | Previous hunk   |
| `<leader>gs` | Normal/Visual | Stage hunk      |
| `<leader>gr` | Normal/Visual | Reset hunk      |
| `<leader>gS` | Normal        | Stage buffer    |
| `<leader>gR` | Normal        | Reset buffer    |
| `<leader>gu` | Normal        | Undo stage hunk |

### Git Information

| Key          | Action            | Description        |
| ------------ | ----------------- | ------------------ |
| `<leader>gp` | Preview hunk      | Show diff in float |
| `<leader>gP` | Preview inline    | Inline diff        |
| `<leader>gb` | Blame line        | Full blame info    |
| `<leader>gB` | Toggle line blame | Virtual text       |
| `<leader>gd` | Diff this         | Against index      |
| `<leader>gD` | Diff this ~       | Against HEAD       |

### Git Toggles

| Key           | Action           | Description             |
| ------------- | ---------------- | ----------------------- |
| `<leader>gtd` | Toggle deleted   | Show deleted lines      |
| `<leader>gtw` | Toggle word diff | Word-level diffs        |
| `<leader>gtl` | Toggle line hl   | Highlight changed lines |
| `<leader>gtn` | Toggle number hl | Highlight line numbers  |
| `<leader>gts` | Toggle signs     | Show/hide git signs     |

### Git Telescope

| Key          | Action         | Description          |
| ------------ | -------------- | -------------------- |
| `<leader>gt` | Git status     | Changed files        |
| `<leader>gm` | Git commits    | All commits          |
| `<leader>gM` | Buffer commits | Current file commits |
| `<leader>gT` | Git branches   | All branches         |
| `<leader>go` | Git stash      | Stash list           |

### Quick Git Commands

| Key           | Action       | Description        |
| ------------- | ------------ | ------------------ |
| `<leader>gPs` | Git push     | Push to remote     |
| `<leader>gPl` | Git pull     | Pull from remote   |
| `<leader>gPf` | Force push   | With confirmation  |
| `<leader>gcc` | Quick commit | Prompt for message |
| `<leader>gca` | Amend commit | Amend last commit  |

---

## Terminal & Runners

### Terminal Toggle

| Key          | Action              | Description    |
| ------------ | ------------------- | -------------- |
| `<leader>th` | Horizontal terminal | Bottom split   |
| `<leader>tv` | Vertical terminal   | Right split    |
| `<leader>tf` | Floating terminal   | Center float   |
| `<leader>tH` | New horizontal      | Fresh instance |
| `<leader>tV` | New vertical        | Fresh instance |
| `<leader>tF` | New floating        | Fresh instance |

### Terminal Mode

| Key           | Action             | Description      |
| ------------- | ------------------ | ---------------- |
| `<C-x>`       | Exit terminal mode | Back to normal   |
| `<C-/>`       | Close terminal     | Close window     |
| `jk` / `kj`   | Escape             | To normal mode   |
| `<C-h/j/k/l>` | Navigate           | To other windows |

### File Runners

| Key          | Action           | Description              |
| ------------ | ---------------- | ------------------------ |
| `<leader>tr` | Run current file | Auto-detect filetype     |
| `<leader>tR` | Custom command   | Prompt for command       |
| `<leader>tb` | Build project    | Auto-detect build system |
| `<leader>tt` | Run tests        | Auto-detect test runner  |

**Supported filetypes for `<leader>tr`:**

- Python (`.py`) - `python3 %`
- JavaScript (`.js`) - `node %`
- TypeScript (`.ts`) - `ts-node %`
- Rust (`.rs`) - `cargo run`
- Go (`.go`) - `go run %`
- Lua (`.lua`) - `lua %`
- Bash (`.sh`) - `bash %`

### Live Server

| Key          | Action            | Description    |
| ------------ | ----------------- | -------------- |
| `<leader>ls` | Start live server | Web dev server |
| `<leader>lS` | Stop live server  | Stop server    |

### Terminal Utilities

| Key          | Action         | Description          |
| ------------ | -------------- | -------------------- |
| `<leader>tg` | LazyGit        | In floating terminal |
| `<leader>td` | LazyDocker     | If installed         |
| `<leader>tn` | System monitor | Bottom/btm           |

---

## File & Buffer Management

### File Operations

| Key          | Action           | Description        |
| ------------ | ---------------- | ------------------ |
| `<C-s>`      | Save file        | Any mode           |
| `<leader>w`  | Save file        | Normal mode        |
| `<leader>W`  | Save all         | All buffers        |
| `<leader>q`  | Safe quit        | Prompts if unsaved |
| `<leader>Q`  | Force quit       | No save            |
| `<leader>qa` | Quit all         | All buffers        |
| `<leader>qA` | Force quit all   | No save            |
| `<leader>wq` | Write & quit all | Save and close     |

### File Explorer (NvimTree)

| Key          | Action        | Description         |
| ------------ | ------------- | ------------------- |
| `<C-n>`      | Toggle tree   | Main toggle         |
| `<leader>e`  | Toggle tree   | Alternative         |
| `<leader>E`  | Find in tree  | Locate current file |
| `<leader>eo` | Focus tree    | Jump to tree        |
| `<leader>ec` | Collapse tree | Collapse all        |
| `<leader>er` | Refresh tree  | Reload              |

**Inside NvimTree:**

| Key          | Action              |
| ------------ | ------------------- |
| `o` / `<CR>` | Open file/folder    |
| `h`          | Close folder        |
| `l`          | Open folder         |
| `v`          | Open in vsplit      |
| `s`          | Open in split       |
| `t`          | Open in tab         |
| `a`          | Create file/folder  |
| `r`          | Rename              |
| `d`          | Delete              |
| `c`          | Copy                |
| `x`          | Cut                 |
| `p`          | Paste               |
| `y`          | Copy filename       |
| `Y`          | Copy relative path  |
| `gy`         | Copy absolute path  |
| `H`          | Toggle hidden files |
| `R`          | Refresh             |
| `q`          | Close tree          |

---

## Search & Replace

### Telescope Fuzzy Finding

#### File Pickers

| Key          | Action         | Description            |
| ------------ | -------------- | ---------------------- |
| `<leader>ff` | Find files     | Fuzzy file search      |
| `<leader>fa` | Find all files | Include hidden/ignored |
| `<leader>fr` | Recent files   | Old files              |
| `<leader>fb` | Find buffers   | Open buffers           |

#### Search

| Key          | Action          | Description       |
| ------------ | --------------- | ----------------- |
| `<leader>fw` | Live grep       | Search in files   |
| `<leader>fW` | Live grep (all) | Include hidden    |
| `<leader>fg` | Grep string     | Prompt for string |
| `<leader>fG` | Grep word       | Word under cursor |

#### Vim Pickers

| Key          | Action          | Description       |
| ------------ | --------------- | ----------------- |
| `<leader>fh` | Help tags       | Neovim help       |
| `<leader>fm` | Marks           | Jump marks        |
| `<leader>fk` | Keymaps         | All keybindings   |
| `<leader>fc` | Commands        | Ex commands       |
| `<leader>fC` | Command history | Previous commands |
| `<leader>fs` | Search history  | Previous searches |
| `<leader>fj` | Jumplist        | Jump history      |
| `<leader>fR` | Registers       | Vim registers     |
| `<leader>fo` | Vim options     | Settings          |

#### Advanced

| Key          | Action             | Description          |
| ------------ | ------------------ | -------------------- |
| `<leader>fp` | Treesitter symbols | AST symbols          |
| `<leader>fq` | Quickfix           | Quickfix list        |
| `<leader>fl` | Location list      | Location list        |
| `<leader>fd` | Diagnostics        | LSP diagnostics      |
| `<leader>ft` | Themes             | NvChad themes        |
| `<leader>fn` | Notifications      | Notification history |

### Search & Replace

| Key          | Action          | Description             |
| ------------ | --------------- | ----------------------- |
| `<Esc>`      | Clear highlight | Remove search highlight |
| `n`          | Next result     | Centered                |
| `N`          | Previous result | Centered                |
| `<leader>rw` | Replace word    | Word under cursor       |

### Quickfix Navigation

| Key  | Action            | Description   |
| ---- | ----------------- | ------------- |
| `]q` | Next quickfix     | Jump forward  |
| `[q` | Previous quickfix | Jump backward |
| `]l` | Next location     | Location list |
| `[l` | Previous location | Location list |

---

## Plugin-Specific

### AI Assistant (CodeCompanion)

| Key          | Mode          | Action          |
| ------------ | ------------- | --------------- |
| `<leader>aa` | Normal/Visual | AI actions menu |
| `<leader>ac` | Normal/Visual | Toggle AI chat  |
| `<leader>ai` | Normal/Visual | Inline AI       |
| `ga`         | Visual        | Add to AI chat  |
| `<leader>ae` | Normal        | Explain code    |
| `<leader>af` | Normal        | Fix code        |
| `<leader>ao` | Normal        | Optimize code   |

### Markdown (Obsidian)

| Key          | Action           | Description       |
| ------------ | ---------------- | ----------------- |
| `<leader>on` | New note         | Create note       |
| `<leader>oo` | Open in Obsidian | External app      |
| `<leader>os` | Search notes     | Fuzzy search      |
| `<leader>oq` | Quick switch     | Note picker       |
| `<leader>ot` | Today's note     | Daily note        |
| `<leader>oy` | Yesterday's note | Previous daily    |
| `<leader>ob` | Backlinks        | Show backlinks    |
| `<leader>ol` | Links            | Show links        |
| `<leader>ow` | Switch workspace | Change vault      |
| `<leader>oc` | Toggle checkbox  | Markdown checkbox |

### Markdown Preview

| Key          | Action         | Description     |
| ------------ | -------------- | --------------- |
| `<leader>mp` | Start preview  | Browser preview |
| `<leader>ms` | Stop preview   | Stop server     |
| `<leader>mt` | Toggle preview | Start/stop      |

### Focus Modes

| Key          | Action     | Description          |
| ------------ | ---------- | -------------------- |
| `<leader>z`  | Zen mode   | Distraction-free     |
| `<leader>zf` | Focus mode | Dim surrounding code |

### Debugging (DAP)

| Key                    | Action            | Description        |
| ---------------------- | ----------------- | ------------------ |
| `<F5>` / `<leader>dc`  | Continue/Start    | Start or continue  |
| `<F9>` / `<leader>db`  | Toggle breakpoint | Add/remove         |
| `<F10>` / `<leader>do` | Step over         | Next line          |
| `<F11>` / `<leader>di` | Step into         | Into function      |
| `<F12>` / `<leader>dO` | Step out          | Out of function    |
| `<leader>dC`           | Run to cursor     | Continue to cursor |
| `<leader>dt`           | Terminate         | Stop debugging     |
| `<leader>dr`           | Restart           | Restart session    |
| `<leader>dp`           | Pause             | Pause execution    |

#### Breakpoints

| Key          | Action                 | Description       |
| ------------ | ---------------------- | ----------------- |
| `<leader>db` | Toggle breakpoint      | Simple breakpoint |
| `<leader>dB` | Conditional breakpoint | With condition    |
| `<leader>dL` | List breakpoints       | Show all          |
| `<leader>dX` | Clear all breakpoints  | Remove all        |

#### Debug UI

| Key          | Action        | Description     |
| ------------ | ------------- | --------------- |
| `<leader>du` | Toggle DAP UI | Show/hide UI    |
| `<leader>de` | Evaluate      | Expression eval |
| `<leader>dR` | Toggle REPL   | Debug REPL      |
| `<leader>df` | Focus frame   | Current frame   |
| `<leader>dj` | Stack down    | Down stack      |
| `<leader>dk` | Stack up      | Up stack        |

### Multiple Cursors (Visual Multi)

| Key        | Action            | Description         |
| ---------- | ----------------- | ------------------- |
| `<C-q>`    | Add cursor        | Word under cursor   |
| `<C-Down>` | Add cursor down   | Line below          |
| `<C-Up>`   | Add cursor up     | Line above          |
| `\\`       | Add cursor at pos | At position         |
| `n`        | Find next         | Next occurrence     |
| `N`        | Find previous     | Previous occurrence |
| `q`        | Skip region       | Skip current        |
| `Q`        | Remove region     | Remove current      |

### Todo Comments

| Key          | Action        | Description      |
| ------------ | ------------- | ---------------- |
| `]t`         | Next todo     | Jump to next     |
| `[t`         | Previous todo | Jump to previous |
| `<leader>st` | Todo list     | All todos        |
| `<leader>sT` | Todo/Fix      | Only TODO/FIX    |

### Notifications

| Key          | Action      | Description         |
| ------------ | ----------- | ------------------- |
| `<leader>un` | Dismiss all | Clear notifications |
| `<leader>nh` | History     | Show history        |

### Miscellaneous

| Key          | Action         | Description         |
| ------------ | -------------- | ------------------- |
| `<leader>L`  | Lazy           | Plugin manager      |
| `<leader>M`  | Mason          | LSP installer       |
| `<leader>sk` | Show keys      | Display keypresses  |
| `<leader>?`  | Buffer keymaps | Current buffer keys |

---

## Color & Themes

### Theme Management

| Key          | Action              | Description        |
| ------------ | ------------------- | ------------------ |
| `<leader>th` | Theme selector      | Pick theme         |
| `<leader>tt` | Toggle theme        | Between configured |
| `<leader>ui` | Toggle transparency | Enable/disable     |
| `<leader>cr` | Reload colorscheme  | Refresh theme      |

### Color Tools

| Key          | Action           | Description            |
| ------------ | ---------------- | ---------------------- |
| `<leader>ch` | Huefy            | HSL color picker       |
| `<leader>cs` | Shades           | Shade generator        |
| `<leader>cS` | Shades (cursor)  | For color under cursor |
| `<leader>tc` | Toggle colorizer | Show/hide colors       |
| `<leader>rc` | Reload colorizer | Refresh                |

### Color Utilities

| Key          | Action            | Description          |
| ------------ | ----------------- | -------------------- |
| `<leader>cp` | Preview color     | Color under cursor   |
| `<leader>ci` | Inspect highlight | Show highlight group |
| `<leader>cI` | Browse highlights | All highlight groups |
| `<leader>cH` | Hex to RGB        | Convert hex          |
| `<leader>cR` | RGB to Hex        | Convert RGB          |

---

## Menu System

### Primary Access

| Key            | Context | Action                |
| -------------- | ------- | --------------------- |
| `<C-Space>`    | Any     | Context-aware menu    |
| `<RightMouse>` | Any     | Context menu at mouse |
| `<leader>m`    | Any     | Open context menu     |

### Direct Menu Access

| Key          | Action        | Description       |
| ------------ | ------------- | ----------------- |
| `<leader>md` | Debug menu    | DAP controls      |
| `<leader>mg` | Git menu      | Git operations    |
| `<leader>mc` | Colors menu   | Color tools       |
| `<leader>mm` | Markdown menu | Markdown/Obsidian |
| `<leader>mw` | Web dev menu  | Live server, etc. |

### Menu Navigation

Inside any menu:

| Key       | Action            |
| --------- | ----------------- |
| `j` / `↓` | Move down         |
| `k` / `↑` | Move up           |
| `h`       | Previous menu     |
| `l`       | Next menu/execute |
| `<CR>`    | Select item       |
| `q`       | Close menu        |

---

## Cheat Sheet

### Most Used Bindings

```
General:
  <Space>ff  - Find files
  <Space>fw  - Search in files
  <C-n>      - File explorer
  <C-Space>  - Context menu
  <C-s>      - Save

LSP:
  gd         - Go to definition
  gr         - Show references
  K          - Documentation
  <Space>ca  - Code actions
  <Space>cr  - Rename
  <Space>cf  - Format

Git:
  <Space>gg  - LazyGit
  ]h / [h    - Next/prev hunk
  <Space>gs  - Stage hunk
  <Space>gb  - Blame

Buffers:
  <A-,>      - Previous buffer
  <A-.>      - Next buffer
  <A-1..9>   - Go to buffer N
  <A-c>      - Close buffer

Windows:
  <C-h/j/k/l> - Navigate
  <Space>-    - Split below
  <Space>|    - Split right
```

### By Category

**Files:** `<Space>f` + key  
**Git:** `<Space>g` + key  
**Code:** `<Space>c` + key  
**LSP:** `<Space>l` + key  
**Terminal:** `<Space>t` + key  
**Window:** `<Space>w` + key  
**UI Toggles:** `<Space>u` + key  
**Debugging:** `<Space>d` + key  
**AI:** `<Space>a` + key  
**Obsidian:** `<Space>o` + key  
**Menu:** `<Space>m` + key

---

## Tips & Tricks

### Discovering Keys

1. **Press leader and wait** - Which-key will show available keys
2. **Press `<Space>fk`** - Browse all keymaps
3. **Press `<Space>?`** - Show buffer-specific keys
4. **Use `<C-Space>`** - Context menu shows relevant actions

### Custom Workflows

**Quick file editing:**

```
<Space>ff → type filename → <CR> → edit → <C-s> → <A-c>
```

**Git workflow:**

```
<Space>gg → stage/commit in LazyGit → q → continue editing
```

**LSP exploration:**

```
gd (definition) → K (docs) → gD (declaration) → gr (references)
```

**AI assistance:**

```
Visual select code → <Space>aa → choose action
```

### Productivity Boosters

1. **Use Flash (`s`)** - Fastest way to jump anywhere
2. **Buffer numbers (`<A-1..9>`)** - Instant buffer switching
3. **Context menu (`<C-Space>`)** - Right action at right time
4. **LazyGit (`<Space>gg`)** - Full git power
5. **Telescope (`<Space>ff/fw`)** - Find anything fast

---

## Customization

### Adding Custom Keys

Create `lua/keymaps/custom.lua`:

```lua
local map = vim.keymap.set

-- Your custom mappings
map("n", "<leader>x", "<cmd>YourCommand<cr>", { desc = "Description" })
```

Then load it in `lua/keymaps/init.lua`:

```lua
require "keymaps.custom"
```

### Overriding Keys

Same file, just remap:

```lua
-- Override existing mapping
map("n", "<leader>ff", "<cmd>YourFinder<cr>", { desc = "Custom finder" })
```

### Disabling Keys

```lua
-- Disable a mapping
vim.keymap.del("n", "<leader>unwanted")
```

---

## Troubleshooting

### Key Not Working

1. Check if it's mapped:

   ```vim
   :verbose map <your-key>
   ```

2. Check for conflicts:

   ```lua
   require("keymaps.utils").show_conflicts("n")
   ```

3. Check which-key:
   ```vim
   :WhichKey
   ```

### Terminal Keys Not Working

Ensure your terminal:

- Supports Alt/Meta keys
- Doesn't intercept the keys
- Has correct `$TERM` value

### Tmux Integration Issues

Add to `~/.tmux.conf`:

```tmux
# Allow Neovim to change cursor shape
set -g -a terminal-overrides ',*:Ss=\E[%p1%d q:Se=\E[2 q'

# Enable RGB color
set -g default-terminal "screen-256color"
set -ga terminal-overrides ",*256col*:Tc"
```

---

For more information, see:

- [Menu System](menus.md) - Context-aware menu documentation
- [Plugin Guide](plugins.md) - Plugin-specific features
- [Customization](customization.md) - Extend and modify
