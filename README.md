# NvimRC - Personal Neovim Configuration

A highly customized Neovim configuration built on NvChad v2.5, featuring extensive plugin integrations, AI-powered coding assistance, and carefully crafted keybindings for an enhanced development experience.

## Overview

This configuration transforms Neovim into a powerful, modern IDE while maintaining the speed and efficiency that makes Vim-based editors exceptional. It includes intelligent code completion, LSP integration for multiple languages, debugging capabilities, AI assistance through CodeCompanion, and numerous quality-of-life improvements.

## Installation

### Prerequisites

- **Neovim** version 0.10.0 or higher
- **Git** for version control
- **Nerd Font** installed and configured in your terminal
- **Node.js and npm** for LSP servers and live-server
- **Ripgrep (rg)** for enhanced search capabilities
- **Python, Rust, Java** runtimes for respective language servers

### Installation Steps

1. **Clone the repository:**
```bash
git clone https://github.com/M4ikel79/nvimrc.git ~/.config/nvimrc
```

2. **Set up shell alias:**

Add to your `~/.bashrc` or `~/.zshrc`:
```bash
alias vi='NVIM_APPNAME=nvimrc nvim'
```

3. **Reload your shell:**
```bash
source ~/.bashrc  # or source ~/.zshrc
```

4. **Launch Neovim:**
```bash
vi
```

On first launch, lazy.nvim will automatically install all plugins. This may take a few minutes.

## Core Features

### Language Support

**Pre-configured LSP servers:**
- HTML, CSS, Emmet (web development)
- Rust (rust-analyzer)
- Java (jdtls)
- JavaScript/TypeScript (tsserver)
- Python (pyright)

**Formatters:**
- Stylua (Lua)
- Black + isort (Python)
- Prettier/Prettierd (web technologies)
- Rustfmt (Rust)
- Google Java Format (Java)

### Smart Key Mappings

**Insert Mode Intelligence:**
- `Tab` - Navigate completion menu or insert tab
- `Shift-Tab` - Navigate completion backwards
- `Enter` - Accept completion or insert newline
- `jk` / `kj` - Quick escape to normal mode

### Navigation

**Buffer Navigation:**
- `Alt-,` / `Alt-.` - Previous/Next buffer
- `Alt-1` through `Alt-9` - Jump to specific buffer
- `Alt-0` - Last buffer
- `Alt-c` - Close current buffer
- `Ctrl-p` - Fuzzy buffer picker

**Window Navigation:**
- `Ctrl-h/j/k/l` - Navigate between windows (tmux compatible)
- `Ctrl-Up/Down` - Resize height
- `Ctrl-Left/Right` - Resize width

### Essential Keybindings

#### Leader Key Mappings

| Prefix | Category | Example |
|--------|----------|---------|
| `<leader>b` | Buffer operations | `<leader>bd` - Delete buffer |
| `<leader>c` | Code operations | `<leader>cf` - Format code |
| `<leader>d` | Debugging (DAP) | `<leader>db` - Toggle breakpoint |
| `<leader>f` | Find/Search (Telescope) | `<leader>ff` - Find files |
| `<leader>g` | Git operations | `<leader>gg` - LazyGit |
| `<leader>l` | LSP operations | `<leader>la` - Code actions |
| `<leader>n` | Notifications | `<leader>nh` - Notification history |
| `<leader>s` | Search/Replace | `<leader>sk` - Show keys |
| `<leader>t` | Tab management | `<leader>tn` - New tab |
| `<leader>u` | UI toggles | `<leader>ut` - Toggle theme |
| `<leader>x` | Diagnostics (Trouble) | `<leader>xx` - Document diagnostics |
| `<leader>z` | Zen/Focus modes | `<leader>z` - Zen mode |
| `<leader>a` | AI (CodeCompanion) | `<leader>aa` - AI actions |

#### Motion and Editing

- `s` - Flash jump (quick navigation)
- `S` - Flash treesitter jump
- `gsa` - Add surrounding (mini.surround)
- `gsd` - Delete surrounding
- `gsr` - Replace surrounding
- `Shift-h/j/k/l` - Move lines/visual selection

### AI Integration (CodeCompanion)

Configure your OpenRouter API key:
```bash
export OPENROUTER_API_KEY="your-key-here"
```

**AI Commands:**
- `<leader>aa` - AI actions menu
- `<leader>ac` - Toggle AI chat
- `<leader>ai` - Inline AI completion
- `ga` (visual mode) - Add selection to AI chat

### Development Tools

**Git Integration:**
- `<leader>gg` - LazyGit interface
- `<leader>gl` - Git log
- `<leader>gf` - File history
- Inline change indicators via gitsigns

**Live Server:**
- `<leader>ls` - Start development server
- `<leader>lS` - Stop server

**Debugging (DAP):**
- `<leader>dc` - Continue/Start
- `<leader>db` - Toggle breakpoint
- `<leader>di/o/O` - Step into/over/out
- `<leader>du` - Toggle debug UI

**Diagnostics (Trouble):**
- `<leader>xx` - Document diagnostics
- `<leader>xq` - Quickfix list
- `]q` / `[q` - Next/Previous quickfix

### Focus Modes

- `<leader>z` - Zen Mode (distraction-free)
- `<leader>zf` - Twilight (dim surrounding code)

### Theme Management

**Default Themes:**
- bearded-arc (default)
- Dracula Pro (custom)
- Monokai Pro (custom)

**Theme Commands:**
- `<leader>uh` - Open theme selector
- `<leader>ut` - Toggle between configured themes
- `<leader>ui` - Toggle transparency

## Plugin Highlights

### Editor Enhancements
- **flash.nvim** - Lightning-fast cursor movement
- **mini.nvim** - Swiss army knife (surround, move, align, ai, splitjoin)
- **nvim-origami** - Intelligent code folding with LSP
- **vim-visual-multi** - Multiple cursors support
- **nvim-ts-autotag** - Auto-close and rename HTML/JSX tags

### Code Intelligence
- **nvim-lspconfig** - LSP client configurations
- **conform.nvim** - Code formatting
- **nvim-treesitter** - Advanced syntax highlighting
- **codecompanion.nvim** - AI coding assistant

### UI Improvements
- **noice.nvim** - Modern UI for messages and cmdline
- **nvim-notify** - Beautiful notifications
- **which-key.nvim** - Keybinding discovery
- **trouble.nvim** - Pretty diagnostics list

### Utilities
- **lazygit.nvim** - Git TUI integration
- **live-server.nvim** - Local development server
- **nvim-dap** - Debug adapter protocol
- **telescope.nvim** - Fuzzy finder (via NvChad)

## Customization

### Adding LSP Servers

Edit `lua/configs/lspconfig.lua` and add your server to the `servers` table:

```lua
local servers = {
  -- existing servers...
  your_server = {
    settings = {
      -- server-specific settings
    },
  },
}
```

Install the server via Mason: `:Mason`

### Adding Formatters

Edit `lua/configs/conform.lua`:

```lua
formatters_by_ft = {
  your_filetype = { "your_formatter" },
}
```

Install the formatter via Mason: `:Mason`

### Disabling Format on Save

For specific buffers:
```vim
:FormatDisable
```

For all buffers:
```vim
:FormatDisable!
```

Re-enable:
```vim
:FormatEnable
```

### Custom Keybindings

Add your keybindings to `lua/mappings.lua`:

```lua
local map = vim.keymap.set

map("n", "<your-key>", "<your-action>", { desc = "Description" })
```

### Adding Plugins

Create a new file in `lua/plugins/` directory:

```lua
-- lua/plugins/your-plugin.lua
return {
  "author/plugin-name",
  event = "VeryLazy",  -- or other loading trigger
  opts = {
    -- plugin options
  },
}
```

## File Structure

```
~/.config/nvimrc/
├── init.lua                    # Entry point
├── lua/
│   ├── options.lua            # Neovim options
│   ├── autocmds.lua           # Autocommands
│   ├── mappings.lua           # Keybindings
│   ├── chadrc.lua             # NvChad configuration
│   ├── configs/               # Plugin configurations
│   │   ├── lazy.lua
│   │   ├── lspconfig.lua
│   │   ├── conform.lua
│   │   └── companion.lua
│   ├── plugins/               # Plugin specifications
│   │   ├── init.lua
│   │   ├── flash.lua
│   │   ├── mini.lua
│   │   └── ...
│   ├── themes/                # Custom themes
│   │   ├── dracula-pro.lua
│   │   └── monokai-pro.lua
│   └── utils/                 # Utility functions
│       ├── buffers.lua
│       └── code_folds.lua
└── stylua.toml                # Lua formatter config
```

## Performance

**Startup Time:** < 50ms (core loading)
**Full Load:** < 100ms (with lazy-loading)

**Optimization Features:**
- Lazy-loading for all non-essential plugins
- Event-based plugin initialization
- Disabled unnecessary default Vim plugins
- Minimal statusline and UI overhead

## Troubleshooting

### Plugins Not Loading

```vim
:Lazy sync
:Lazy profile
```

### LSP Issues

```vim
:LspInfo
:Mason
```

Check language server installation and file type associations.

### Formatting Not Working

1. Verify formatter is installed: `:Mason`
2. Check configuration: `:ConformInfo`
3. Test manual formatting: `<leader>cf`
4. Check format-on-save status

### Keybinding Conflicts

```vim
:verbose map <your-key>
```

Shows all mappings for the key and where they're defined.

### General Diagnostics

```vim
:checkhealth
```

Provides comprehensive system diagnostics.

## Commands Reference

### Plugin Management
- `:Lazy` - Plugin manager UI
- `:Lazy sync` - Update all plugins
- `:Lazy clean` - Remove unused plugins
- `:Mason` - LSP/formatter installer

### LSP
- `:LspInfo` - Show LSP status
- `:LspRestart` - Restart LSP servers

### Formatting
- `:ConformInfo` - Show formatter info
- `:FormatDisable` / `:FormatEnable` - Toggle format-on-save

### Debugging
- `:DapContinue` - Start/continue debugging
- `:DapToggleBreakpoint` - Toggle breakpoint

### Theme
- `<leader>uh` - Theme selector
- `<leader>ut` - Toggle theme
- `<leader>ui` - Toggle transparency

## Tips and Tricks

### Quick Navigation
1. Use `s` + two characters to jump anywhere on screen
2. Use `Alt-1` through `Alt-9` for instant buffer switching
3. Use `<leader>ff` for fuzzy file finding
4. Use `gd` to jump to definition (LSP)

### Efficient Editing
1. Use `gsa"` to add quotes around text
2. Use `Shift-j/k` to move lines up/down
3. Use `<leader>cf` to format entire file
4. Use `Ctrl-q` to start multiple cursors

### Git Workflow
1. Use `<leader>gg` for full Git UI (lazygit)
2. Use gitsigns bracket commands `]c` / `[c` for hunk navigation
3. Use `<leader>gf` to see file history

### Focus and Productivity
1. Use `<leader>z` for distraction-free writing
2. Use `<leader>zf` to dim surrounding code
3. Use `<leader>sk` to see your keypresses (for recording)

## Known Issues

### Windows Compatibility
Long file paths may cause issues. Enable git longpaths:
```bash
git config --system core.longpaths true
```

### Terminal Emulator
Ensure your terminal supports:
- True color (24-bit)
- Nerd Font rendering
- Alt/Meta key bindings

### Node.js Requirement
Some features require Node.js:
- LSP servers (tsserver, emmet-ls)
- Live-server
- Some formatters (prettier)

## Contributing

This is a personal configuration, but suggestions and improvements are welcome!

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## Acknowledgments

Built on the excellent foundation of:
- [NvChad](https://github.com/NvChad/NvChad) - Base configuration framework
- [lazy.nvim](https://github.com/folke/lazy.nvim) - Plugin manager
- All plugin authors whose work makes this possible

## License

This configuration is free to use and modify for personal use.

---

**Happy Coding with NvimRC!**

For more information, see `:help nvimrc` or explore the `lua/` directory.
