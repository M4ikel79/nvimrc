# Menu System - Complete Keybind Reference

Quick reference for all menu access keybinds.

## Primary Access

| Keybind        | Action         | Notes                        |
| -------------- | -------------- | ---------------------------- |
| `<C-t>`        | Open main menu | Primary keyboard access      |
| `<RightMouse>` | Context menu   | Adapts to file type/location |

## Quick Menu Access (`<leader>m` prefix)

| Keybind      | Menu     | Description              |
| ------------ | -------- | ------------------------ |
| `<leader>mm` | Main     | Entry point to all menus |
| `<leader>mf` | Files    | File operations & search |
| `<leader>mc` | Code     | LSP, debugging, AI       |
| `<leader>mg` | Git      | Git operations           |
| `<leader>mt` | Terminal | Terminal & runners       |
| `<leader>mw` | Window   | Window/buffer management |
| `<leader>ms` | Session  | Session & workspace      |

## Context-Aware Menus

Right-click automatically shows:

| Context        | Menu Shown | When                          |
| -------------- | ---------- | ----------------------------- |
| NvimTree       | nvimtree   | In file explorer              |
| Markdown files | markdown   | \*.md files                   |
| Code files     | code       | .lua, .py, .js, .ts, .rs, .go |
| Default        | default    | Other contexts                |

## Inside Menus (Navigation)

| Key         | Action                     |
| ----------- | -------------------------- |
| `h`         | Go to previous/parent menu |
| `l`         | Go to next/submenu         |
| `j` / `↓`   | Move down                  |
| `k` / `↑`   | Move up                    |
| `Enter`     | Select item                |
| `q`         | Close menu                 |
| Letter keys | Execute action (if mapped) |

## Main Menu Actions

Quick actions from main menu:

| Action         | Keybind      | Description              |
| -------------- | ------------ | ------------------------ |
| Save File      | `<C-s>`      | Save current buffer      |
| Save All       | `<leader>W`  | Save all buffers         |
| Quit           | `<leader>q`  | Safe quit with prompt    |
| Edit Config    | `ed`         | Open init.lua in new tab |
| Reload Config  | `<leader>cr` | Reload configuration     |
| Lazy Plugins   | `<leader>L`  | Plugin manager           |
| Mason          | `<leader>M`  | LSP installer            |
| Theme Selector | `<leader>th` | Choose theme             |
| Transparency   | `<leader>ui` | Toggle transparency      |
| Color Picker   | `<leader>ch` | Open Huefy               |

## Files Menu Quick Actions

| Action           | Keybind      |
| ---------------- | ------------ |
| Find Files       | `<leader>ff` |
| Find All Files   | `<leader>fa` |
| Recent Files     | `<leader>fr` |
| Live Grep        | `<leader>fw` |
| Grep String      | `<leader>fg` |
| NvimTree Toggle  | `<C-n>`      |
| Find in Explorer | `<leader>E`  |
| Buffer Picker    | `<C-p>`      |

## Code Menu Quick Actions

| Action               | Keybind      |
| -------------------- | ------------ |
| Go to Definition     | `gd`         |
| Go to Declaration    | `gD`         |
| Go to Implementation | `gi`         |
| Show References      | `gr`         |
| Code Action          | `<leader>ca` |
| Rename Symbol        | `<leader>cr` |
| Format Buffer        | `<leader>cf` |
| Hover Documentation  | `K`          |
| Diagnostics          | `<leader>xx` |
| Document Symbols     | `<leader>cs` |
| DAP Continue         | `<leader>dc` |
| Toggle Breakpoint    | `<leader>db` |
| AI Actions           | `<leader>aa` |
| AI Chat              | `<leader>ac` |

## Git Menu Quick Actions

| Action        | Keybind      |
| ------------- | ------------ |
| LazyGit       | `<leader>gg` |
| Git Log       | `<leader>gl` |
| File History  | `<leader>gf` |
| Stage Hunk    | `<leader>gs` |
| Reset Hunk    | `<leader>gr` |
| Preview Hunk  | `<leader>gp` |
| Stage Buffer  | `<leader>gS` |
| Blame Line    | `<leader>gb` |
| Diff This     | `<leader>gd` |
| Next Hunk     | `]h`         |
| Previous Hunk | `[h`         |
| Git Status    | `<leader>gt` |

## Terminal Menu Quick Actions

| Action              | Keybind      |
| ------------------- | ------------ |
| Floating Terminal   | `<leader>tf` |
| Horizontal Terminal | `<leader>th` |
| Vertical Terminal   | `<leader>tv` |
| Run Current File    | `<leader>tr` |
| Build Project       | `<leader>tb` |
| Run Tests           | `<leader>tt` |
| Custom Command      | `<leader>tR` |
| LazyGit             | `<leader>tg` |
| Live Server Start   | `<leader>ls` |

## Window Menu Quick Actions

| Action          | Keybind      |
| --------------- | ------------ |
| Split Below     | `<leader>-`  |
| Split Right     | `<leader>\|` |
| Close Window    | `<leader>wd` |
| Previous Buffer | `<A-,>`      |
| Next Buffer     | `<A-.>`      |
| Close Buffer    | `<A-c>`      |
| Buffer Picker   | `<C-p>`      |
| New Tab         | `<leader>tn` |
| Close Tab       | `<leader>tc` |
| Next Tab        | `<leader>tl` |
| Previous Tab    | `<leader>th` |

## NvimTree Menu (Right-click in tree)

| Action             | Keybind | Description               |
| ------------------ | ------- | ------------------------- |
| Open               | `o`     | Open file/folder          |
| Vertical Split     | `v`     | Open in vsplit            |
| Horizontal Split   | `s`     | Open in split             |
| New Tab            | `t`     | Open in tab               |
| Preview            | `P`     | Preview file              |
| New File/Folder    | `a`     | Create (add / for folder) |
| Rename             | `r`     | Full rename               |
| Rename Basename    | `e`     | Rename filename only      |
| Copy               | `c`     | Copy file                 |
| Cut                | `x`     | Cut file                  |
| Paste              | `p`     | Paste file                |
| Copy Absolute Path | `gy`    | To clipboard              |
| Copy Relative Path | `Y`     | To clipboard              |
| Copy Filename      | `y`     | To clipboard              |
| Trash              | `D`     | Move to trash             |
| Delete             | `d`     | Permanent delete          |
| Parent Directory   | `P`     | Go up                     |
| Change Root        | `C`     | Set as root               |
| Find File          | `f`     | Search                    |
| Filter             | `F`     | Filter files              |
| Toggle Hidden      | `H`     | Show/hide dotfiles        |
| Refresh            | `R`     | Reload tree               |
| Collapse All       | `W`     | Collapse folders          |
| File Info          | `i`     | Show details              |
| Close              | `q`     | Close tree                |

## Markdown Menu (Right-click in .md files)

| Action           | Keybind      |
| ---------------- | ------------ |
| New Note         | `<leader>on` |
| Quick Switch     | `<leader>oq` |
| Search Notes     | `<leader>os` |
| Open in Obsidian | `<leader>oo` |
| Today's Note     | `<leader>ot` |
| Backlinks        | `<leader>ob` |
| Toggle Checkbox  | `<leader>oc` |
| Preview          | `<leader>mp` |
| Switch Workspace | `<leader>ow` |

## Help Menu Quick Actions

| Action                | Keybind      |
| --------------------- | ------------ |
| Help Tags             | `<leader>fh` |
| Show Keymaps          | `<leader>fk` |
| Buffer Keymaps        | `<leader>?`  |
| Commands              | `<leader>fc` |
| LSP Info              | `<leader>li` |
| Notification History  | `<leader>nh` |
| Dismiss Notifications | `<leader>un` |

## Tips for Learning

1. **Start with `<C-t>`** - Opens main menu, explore from there
2. **Use `<leader>m*`** - Quick access to specific menus
3. **Right-click everywhere** - Context menus adapt
4. **Look at rtxt column** - Shows associated keybind
5. **Navigate with `h`/`l`** - Move between nested menus
6. **Press `q` anytime** - Close menu

## Memory Aids

### By Leader Key Pattern

- `<leader>f*` - Find/Files operations
- `<leader>g*` - Git operations
- `<leader>c*` - Code actions
- `<leader>t*` - Terminal/Tab/Test operations
- `<leader>w*` - Window operations
- `<leader>o*` - Obsidian/notes operations
- `<leader>m*` - Menu access
- `<leader>u*` - UI toggles

### By Alt Key Pattern

- `<A-1>` through `<A-9>` - Go to buffer 1-9
- `<A-0>` - Go to last buffer
- `<A-,>` - Previous buffer
- `<A-.>` - Next buffer
- `<A-c>` - Close buffer

### By Ctrl Key Pattern

- `<C-t>` - Main menu
- `<C-n>` - Toggle NvimTree
- `<C-p>` - Buffer picker
- `<C-s>` - Save file
- `<C-h/j/k/l>` - Window navigation
