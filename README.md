# NvimRC - Modern Neovim Configuration

<div align="center">

![Neovim](https://img.shields.io/badge/Neovim-0.10+-green.svg?style=for-the-badge&logo=neovim)
![License](https://img.shields.io/badge/License-MIT-blue.svg?style=for-the-badge)
![Platform](https://img.shields.io/badge/Platform-Linux%20%7C%20macOS%20%7C%20Windows-lightgrey?style=for-the-badge)

**A powerful, modern Neovim configuration built on NvChad v2.5**

Featuring intelligent keymaps, context-aware menus, AI assistance, and extensive plugin integration for an enhanced development experience.

[Features](#-features) • [Installation](#-installation) • [Documentation](#-documentation) • [Keybindings](#-keybindings) • [Customization](#-customization)

</div>

---

## ✨ Features

### 🎯 Core Capabilities

- **🧠 Intelligent Keymap System** - Modular keymap architecture using `mini.keymap` for smart context-aware bindings
- **📋 Context-Aware Menus** - Right-click menus that adapt to your current context (file type, git repo, debug mode, etc.)
- **🤖 AI Integration** - Built-in CodeCompanion with OpenRouter API support for AI-assisted coding
- **🎨 10 Custom Themes** - Carefully crafted color schemes including Dracula Pro, Monokai Pro, Aurora, and more
- **⚡ Blazing Fast** - Optimized lazy-loading with <50ms startup time

### 🛠️ Development Tools

- **LSP Support** - Pre-configured for HTML, CSS, JavaScript/TypeScript, Python, Rust, Java, Lua
- **Code Formatting** - Automatic formatting with Conform.nvim (Prettier, Black, Stylua, etc.)
- **Git Integration** - LazyGit UI, inline Gitsigns, and comprehensive git operations
- **Debugging** - Full DAP integration with nvim-dap and dap-ui
- **Live Development** - Built-in live server for web development
- **Terminal Management** - Smart terminal handling with multiple layouts and runners

### 🎨 UI & Experience

- **Smart Completion** - Blink.cmp with intelligent Tab/Enter behavior
- **Flash Navigation** - Lightning-fast cursor movement with flash.nvim
- **Color Tools** - Interactive color pickers (Huefy) and shade generators
- **Markdown Support** - Full Obsidian integration with live preview
- **Focus Modes** - Zen mode and Twilight for distraction-free coding
- **Beautiful Notifications** - Modern UI with Noice.nvim and nvim-notify

---

## 📦 Installation

### Prerequisites

Ensure you have the following installed:

- **Neovim** 0.10.0 or higher
- **Git** for version control
- **Node.js** and npm (for LSP servers and live-server)
- **Ripgrep** (rg) for enhanced search
- A **Nerd Font** (recommended: JetBrainsMono, FiraCode, or Hack)
- **Python**, **Rust**, **Java** runtimes (for respective language servers)

### Quick Start

1. **Clone the repository:**

   ```bash
   git clone https://github.com/M4ikel79/nvimrc.git ~/.config/nvimrc
   ```

2. **Set up shell alias:**

   Add to your `~/.bashrc` or `~/.zshrc`:

   ```bash
   alias vi='NVIM_APPNAME=nvimrc nvim'
   ```

3. **Reload shell configuration:**

   ```bash
   source ~/.bashrc  # or source ~/.zshrc
   ```

4. **Launch Neovim:**

   ```bash
   vi
   ```

   On first launch, lazy.nvim will automatically install all plugins. This may take a few minutes.

5. **Configure AI Assistant (Optional):**

   If you want to use the AI features:

   ```bash
   export OPENROUTER_API_KEY="your-api-key-here"
   ```

---

## 📚 Documentation

Comprehensive documentation is available in the `docs/` directory:

| Document                                         | Description                                            |
| ------------------------------------------------ | ------------------------------------------------------ |
| **[Installation Guide](docs/installation.md)**   | Detailed installation instructions and troubleshooting |
| **[Keybindings Reference](docs/keybindings.md)** | Complete keymap documentation with examples            |
| **[Menu System](docs/menus.md)**                 | Context-aware menu system guide                        |
| **[Plugin Guide](docs/plugins.md)**              | Overview of all installed plugins                      |
| **[Theme Gallery](docs/themes.md)**              | Preview and customize themes                           |
| **[LSP Configuration](docs/lsp.md)**             | Language server setup and configuration                |
| **[Options Reference](docs/options.md)**         | Vim options and settings explained                     |
| **[Customization Guide](docs/customization.md)** | How to customize and extend                            |
| **[FAQ](docs/faq.md)**                           | Frequently asked questions                             |

---

## ⌨️ Keybindings

### Quick Reference

Leader key is `<Space>`

#### Essential Bindings

| Key            | Action               | Context       |
| -------------- | -------------------- | ------------- |
| `<Space>ff`    | Find files           | Normal        |
| `<Space>fw`    | Live grep            | Normal        |
| `<C-n>`        | Toggle file explorer | Normal        |
| `<C-Space>`    | Context menu         | Normal/Visual |
| `<RightMouse>` | Context menu         | Normal/Visual |
| `<Space>gg`    | LazyGit              | Normal        |
| `<Space>aa`    | AI actions           | Normal/Visual |
| `<Space>cf`    | Format buffer        | Normal/Visual |
| `gd`           | Go to definition     | Normal        |
| `K`            | Hover documentation  | Normal        |

#### Buffer Navigation

| Key                    | Action               |
| ---------------------- | -------------------- |
| `<Alt-,>` / `<Alt-.>`  | Previous/Next buffer |
| `<Alt-1>` to `<Alt-9>` | Jump to buffer 1-9   |
| `<Alt-0>`              | Last buffer          |
| `<Alt-c>`              | Close buffer         |
| `<C-p>`                | Buffer picker        |

#### Window Management

| Key                | Action           |
| ------------------ | ---------------- |
| `<C-h/j/k/l>`      | Navigate windows |
| `<Alt-Up/Down>`    | Resize height    |
| `<Alt-Left/Right>` | Resize width     |
| `<Space>-`         | Split below      |
| `<Space>\|`        | Split right      |

For complete keybinding documentation, see **[Keybindings Reference](docs/keybindings.md)**.

---

## 🎨 Themes

NvimRC includes 10 custom themes:

| Theme              | Type  | Description                             |
| ------------------ | ----- | --------------------------------------- |
| **Dracula Pro**    | Dark  | Classic Dracula Pro with vibrant colors |
| **Monokai Pro**    | Dark  | Warm Monokai Pro variant                |
| **Aurora**         | Dark  | Pink/Purple aurora borealis inspired    |
| **Tokyo Rain**     | Dark  | Neon-lit rainy Tokyo night              |
| **Ocean Depths**   | Dark  | Deep blue/teal ocean theme              |
| **Cyberpunk Neon** | Dark  | Bright cyberpunk neon colors            |
| **Matrix Code**    | Dark  | Green terminal matrix style             |
| **Retro Wave**     | Dark  | 80s synthwave aesthetic                 |
| **Volcanic Ash**   | Dark  | Red/orange volcanic colors              |
| **Cherry Blossom** | Light | Soft Japanese sakura inspired           |
| **Pastel Dream**   | Light | Soft pastel colors                      |

**Switch themes:** `<Space>th` (theme selector) or `<Space>tt` (toggle between configured themes)

See **[Theme Gallery](docs/themes.md)** for screenshots and customization.

---

## 🔧 Customization

### Quick Customization

**Edit configuration:**

```vim
:e ~/.config/nvimrc/init.lua
```

**Key areas to customize:**

1. **Keymaps** - `lua/keymaps/` directory
2. **Plugin options** - `lua/plugins/` directory
3. **LSP servers** - `lua/configs/lspconfig.lua`
4. **Formatters** - `lua/configs/conform.lua`
5. **Theme settings** - `lua/chadrc.lua`
6. **Options** - `lua/options.lua`

### Adding Custom Keymaps

```lua
-- lua/keymaps/custom.lua
local map = vim.keymap.set

map("n", "<your-key>", "<your-action>", { desc = "Description" })
```

Then require it in `lua/keymaps/init.lua`:

```lua
require "keymaps.custom"
```

### Adding Plugins

Create a new file in `lua/plugins/`:

```lua
-- lua/plugins/my-plugin.lua
return {
  "author/plugin-name",
  event = "VeryLazy",
  opts = {
    -- plugin options
  },
}
```

See **[Customization Guide](docs/customization.md)** for detailed instructions.

---

## 📁 Project Structure

```
~/.config/nvimrc/
├── init.lua                 # Entry point
├── stylua.toml             # Lua formatter config
├── lua/
│   ├── options.lua         # Neovim options
│   ├── autocmds.lua        # Autocommands
│   ├── chadrc.lua          # NvChad configuration
│   ├── configs/            # Plugin configurations
│   │   ├── lazy.lua
│   │   ├── lspconfig.lua
│   │   ├── conform.lua
│   │   ├── companion.lua
│   │   └── menu_manager.lua
│   ├── keymaps/            # Modular keymaps
│   │   ├── init.lua
│   │   ├── core.lua        # Core editing
│   │   ├── lsp.lua         # LSP operations
│   │   ├── git.lua         # Git operations
│   │   ├── term.lua        # Terminal
│   │   ├── colors.lua      # Color tools
│   │   ├── plugins.lua     # Plugin-specific
│   │   └── utils.lua       # Utilities
│   ├── plugins/            # Plugin specifications
│   │   ├── init.lua
│   │   ├── coding/         # Completion, LSP, etc.
│   │   ├── editor/         # Navigation, editing
│   │   ├── tools/          # Git, debug, etc.
│   │   └── ui/             # UI enhancements
│   ├── menus/              # Context menus
│   │   ├── main.lua
│   │   ├── git.lua
│   │   ├── debug.lua
│   │   ├── colors.lua
│   │   ├── markdown.lua
│   │   └── webdev.lua
│   ├── themes/             # Custom themes
│   │   ├── dracula_pro.lua
│   │   ├── monokai_pro.lua
│   │   └── [8 more themes]
│   └── utils/              # Utility functions
│       ├── buffers.lua
│       └── code_folds.lua
└── docs/                   # Documentation
    ├── installation.md
    ├── keybindings.md
    ├── menus.md
    └── [more docs]
```

---

## 🚀 Performance

- **Startup Time:** < 50ms (core loading)
- **Full Load:** < 100ms (with lazy-loading)
- **Plugin Count:** 60+ (all lazy-loaded)
- **Memory Usage:** ~80MB (after startup)

**Optimization features:**

- Lazy-loading for all non-essential plugins
- Event-based plugin initialization
- Disabled unnecessary default Vim plugins
- Minimal statusline overhead

---

## 🤝 Contributing

Contributions are welcome! This is a personal configuration, but improvements and suggestions are appreciated.

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

## 🐛 Troubleshooting

### Common Issues

**Plugins not loading:**

```vim
:Lazy sync
:Lazy profile
```

**LSP not working:**

```vim
:LspInfo
:Mason
```

**Formatting issues:**

```vim
:ConformInfo
```

**General diagnostics:**

```vim
:checkhealth
```

For more help, see **[FAQ](docs/faq.md)** or open an issue.

---

## 📝 Acknowledgments

Built on the shoulders of giants:

- [NvChad](https://github.com/NvChad/NvChad) - Excellent base configuration
- [lazy.nvim](https://github.com/folke/lazy.nvim) - Modern plugin manager
- [mini.nvim](https://github.com/echasnovski/mini.nvim) - Swiss army knife
- All plugin authors whose amazing work makes this possible

Special thanks to the Neovim community for continuous inspiration.

---

## 📄 License

This configuration is free to use and modify for personal use.

---

## 🔗 Links

- **Repository:** [github.com/M4ikel79/nvimrc](https://github.com/M4ikel79/nvimrc)
- **Issues:** [Report a bug](https://github.com/M4ikel79/nvimrc/issues)
- **Discussions:** [Join the conversation](https://github.com/M4ikel79/nvimrc/discussions)

---

<div align="center">

**Happy Coding with NvimRC! 🚀**

Made with ❤️ by [M4ikel79](https://github.com/M4ikel79)

</div>
