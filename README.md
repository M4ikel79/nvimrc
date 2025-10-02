# NvimRC - Personal Neovim Configuration

A highly customized Neovim configuration built on top of NvChad v2.5, featuring extensive plugin integrations, AI-powered coding assistance, and carefully crafted keybindings for an enhanced development experience.

## Overview

This configuration transforms Neovim into a powerful, modern IDE while maintaining the speed and efficiency that makes Vim-based editors exceptional. It includes intelligent code completion, LSP integration, debugging capabilities, AI assistance through CodeCompanion, and numerous quality-of-life improvements for daily coding tasks.

## Installation

### Prerequisites

Before installing this configuration, ensure you have the following installed on your system:

- Neovim version 0.10.0 or higher (required for modern plugin compatibility)
- Git for version control operations
- A Nerd Font installed and configured in your terminal for proper icon display
- Node.js and npm (required for certain LSP servers and live-server functionality)
- Ripgrep (rg) for enhanced search capabilities

### Installation Steps

First, clone this repository into your Neovim configuration directory. The configuration uses the `NVIM_APPNAME` environment variable, which allows you to maintain multiple Neovim configurations simultaneously without conflicts:

```bash
git clone https://github.com/M4ikel79/nvimrc.git ~/.config/nvimrc
```

Next, set up a convenient alias for launching this configuration. Add the following line to your shell configuration file, which could be `~/.bashrc` for Bash users, `~/.zshrc` for Zsh users, or the appropriate file for your shell:

```bash
alias vi='NVIM_APPNAME=nvimrc nvim'
```

After adding the alias, reload your shell configuration to make it available in your current session:

```bash
source ~/.bashrc  # or source ~/.zshrc, depending on your shell
```

Now you can launch Neovim with your custom configuration by simply typing the alias:

```bash
vi
```

When you launch for the first time, lazy.nvim will automatically bootstrap itself and install all configured plugins. This initial setup process may take a few minutes depending on your internet connection, as it downloads and compiles the necessary components.

## Core Features

### Theme and Appearance

The configuration defaults to the "blossom_light" theme, providing a pleasant light color scheme suitable for extended coding sessions. However, two additional custom themes are included for those who prefer different aesthetics. The Dracula Pro theme offers vibrant colors with excellent contrast, while the Monokai Pro theme provides the classic Monokai experience with enhanced readability. You can toggle between themes using the keybinding `<leader>ut`, and the transparency can be toggled with `<leader>ui` for a more integrated desktop experience.

### Plugin Management

This configuration leverages lazy.nvim as its plugin manager, which provides lazy-loading capabilities to ensure fast startup times. Plugins are only loaded when they are actually needed, either by opening specific file types, triggering certain commands, or pressing designated keybindings. This approach keeps Neovim responsive even with numerous plugins installed.

### Language Server Protocol (LSP)

Native Neovim LSP integration is configured with Mason for easy language server management. The setup currently includes HTML, CSS, and Emmet language servers out of the box, providing intelligent code completion, syntax checking, and refactoring capabilities for web development. Additional language servers can be easily installed through Mason using the `:Mason` command, giving you access to LSP support for virtually any programming language.

### Code Formatting

Conform.nvim handles automatic code formatting with support for multiple formatters per filetype. The configuration includes format-on-save functionality that can be toggled using `:FormatDisable` and `:FormatEnable` commands, allowing you to control when automatic formatting occurs. Different formatters are configured for various languages including Stylua for Lua, Black and isort for Python, Prettier for web technologies, and language-specific formatters for Rust, Go, and shell scripts.

## Plugin Highlights

### Editing and Navigation

The flash.nvim plugin revolutionizes how you navigate through your code by providing lightning-fast movement to any visible location on screen. Simply press `s` to activate Flash jump mode, and you can instantly move to any character position by typing a few letters. This eliminates the need for repetitive motion commands and makes navigating large files effortless.

The mini.nvim suite brings together several powerful editing features in a cohesive package. Mini.surround allows you to quickly add, change, or delete surrounding characters like quotes, brackets, and HTML tags using intuitive keybindings prefixed with `gs`. Mini.move enables you to shift lines or visual selections up, down, left, or right using Shift combined with movement keys. Mini.align helps you create perfectly aligned code blocks, while mini.comment provides intelligent commenting that respects the syntax of different file types.

The vim-visual-multi plugin brings multiple cursor functionality to Neovim, allowing you to edit multiple locations simultaneously. Press `Ctrl+q` to select the word under the cursor, then press `n` to find and select the next occurrence. This makes batch editing operations incredibly efficient, especially when refactoring code or making repetitive changes across a file.

### Code Intelligence

Treesitter provides advanced syntax highlighting that understands the structure of your code, not just pattern matching on text. This results in more accurate highlighting, better code folding, and enables advanced features like selecting entire functions or classes with text objects. The treesitter-context plugin enhances this by showing you which function, class, or block you're currently inside when scrolling through large files, providing valuable context that prevents you from getting lost in deeply nested code.

The nvim-origami plugin implements intelligent code folding based on LSP information, showing you visual indicators in the status column for foldable regions. Press Enter on a folded section to expand it, or on an expanded section to fold it again. This makes it easy to focus on specific parts of your code while hiding irrelevant details.

### AI-Powered Assistance

CodeCompanion integrates AI capabilities directly into your editing workflow through OpenRouter. You can open an AI chat window with `<leader>ac`, send code selections to the AI with `ga` in visual mode, or trigger inline completions with `<leader>ai`. The configuration uses the Qwen Coder model by default, providing intelligent code suggestions, explanations, and refactoring assistance. You will need to set up your OpenRouter API key in your environment variables as `OPENROUTER_API_KEY` to use this feature.

### User Interface Enhancements

The noice.nvim plugin completely transforms Neovim's user interface, replacing the traditional command line and message area with beautiful, modern popups. Command-line completion appears in a centered popup window, LSP progress notifications display elegantly without disrupting your workflow, and messages are shown using the notify system. This creates a cleaner, more polished editing experience while maintaining all of Neovim's functionality.

Nvim-notify provides beautiful notification windows for messages, warnings, and errors. Notifications fade in and out smoothly, stack when multiple messages appear, and automatically dismiss after a few seconds. You can view notification history with `<leader>nh` and dismiss all current notifications with `<leader>un`.

Which-key displays a popup showing available keybindings whenever you pause after pressing a prefix key like the leader key. This serves as both a learning tool for discovering keybindings and a reminder when you forget the exact key sequence. The configuration uses the "helix" preset for a modern, clean appearance.

### Development Tools

Lazygit integration provides a full-featured Git interface within Neovim. Press `<leader>lg` to open lazygit in a floating window where you can stage changes, create commits, manage branches, and perform other Git operations using an intuitive terminal UI. This eliminates the need to switch to a separate terminal for Git operations.

The live-server plugin enables rapid web development by automatically refreshing your browser when HTML, CSS, or JavaScript files change. Start the server with `<leader>ls` and stop it with `<leader>lS`. This provides instant feedback as you develop, making front-end development faster and more enjoyable.

Nvim-dap provides debugging capabilities through the Debug Adapter Protocol, supporting multiple programming languages. While adapter configurations are commented out by default, you can easily enable debugging for your preferred languages by uncommenting the relevant sections in the DAP configuration file. The debug UI includes separate windows for variables, breakpoints, call stacks, and a REPL console.

### Focus and Productivity

Zen Mode provides a distraction-free writing environment by hiding all UI elements except the code you're working on. Activate it with `<leader>z` to center your code with generous margins and dim everything else. This is particularly useful for writing documentation, focusing on complex algorithms, or simply reducing visual clutter when you need deep concentration.

The twilight plugin complements Zen Mode by dimming all code except the section around your cursor. This helps maintain focus on the immediate context while keeping surrounding code visible but de-emphasized. You can toggle twilight independently with `<leader>zf` for a gentler focus mode that doesn't hide the entire UI.

## Essential Keybindings

### The Leader Key

The leader key is mapped to the spacebar, providing easy access to numerous commands without requiring awkward finger stretches. This configuration follows the convention of grouping related commands under common prefixes, making keybindings easier to remember and discover.

### General Editing

In insert mode, typing `jk` quickly will return you to normal mode, providing a faster alternative to reaching for the Escape key. The semicolon key in normal mode enters command mode, saving you from pressing Shift+colon every time you want to run a command. The Enter key toggles fold states when pressed on a foldable line, making code folding more intuitive.

### Navigation and Movement

Flash navigation activates with `s` in normal mode, allowing you to jump to any visible location by typing characters. The `S` variant uses Treesitter to limit jumps to syntactic elements like function names or variable declarations. In operator-pending mode, `r` enables remote operations where you can jump to a location and apply an operation without moving your cursor there.

Buffer navigation uses Alt key combinations for quick switching. Press `Alt+,` and `Alt+.` to move between buffers sequentially, or use `Alt+1` through `Alt+9` to jump directly to specific buffers. Close the current buffer with `Alt+c`, and press `Ctrl+p` to open a fuzzy buffer picker.

### Window Management

Split the current window horizontally with `<leader>-` or vertically with `<leader>|`. Resize windows using Alt key combinations: `Alt+=` and `Alt+-` adjust height, while `Alt+.` and `Alt+,` adjust width. Navigate between windows using `Ctrl+h/j/k/l`, which also works seamlessly with tmux if you use the terminal multiplexer.

### Terminal Integration

Open a horizontal terminal with `<leader>h`, a vertical terminal with `<leader>v`, or a floating terminal with `Alt+i`. Inside terminal mode, press `Ctrl+x` to return to normal mode, or `Ctrl+/` to close the terminal. You can navigate between the terminal and other windows using the standard `Ctrl+h/j/k/l` navigation keys.

### Code Actions and LSP

Format the current buffer or selection with `<leader>cf`, which runs the configured formatter with LSP fallback. Access LSP-specific actions through the default NvChad keybindings, including `gd` for goto definition, `gr` for references, `K` for hover documentation, and `<leader>ca` for code actions.

Open the Trouble diagnostics window with `<leader>xx` to see all diagnostics in a organized list. Navigate through quickfix items with `]q` and `[q`, making it easy to jump between compiler errors, search results, or any other items in the quickfix list.

### AI Assistance

Trigger CodeCompanion actions with `<leader>aa` in either normal or visual mode to see available AI operations. Toggle the AI chat window with `<leader>ac`, or use inline completions with `<leader>ai`. In visual mode, press `ga` to add the selected code to your AI chat conversation for discussion or modification.

### Git Integration

Open lazygit with `<leader>lg` to access the full Git interface. Within lazygit, you can stage files, create commits, manage branches, view diffs, and perform other Git operations using keyboard shortcuts displayed in the lazygit interface.

### Theme and UI

Toggle between your configured light and dark themes with `<leader>ut`, which swaps between the themes specified in your theme_toggle configuration. Enable or disable transparency with `<leader>ui`, allowing you to see your desktop wallpaper through Neovim. Open the theme selector with `<leader>uh` to browse and preview all available themes interactively.

## Customization

This configuration is designed to be your starting point rather than a fixed setup. You can customize any aspect by editing the files in the `lua/` directory. The configuration follows a modular structure where each plugin has its own file in `lua/plugins/`, making it easy to modify or remove specific features without affecting others.

To add new plugins, create a new file in `lua/plugins/` that returns a table with the plugin specification. Lazy.nvim will automatically detect and load it on the next startup. Keybindings are defined in `lua/mappings.lua`, options are in `lua/options.lua`, and autocommands are in `lua/autocmds.lua`.

The LSP configuration in `lua/configs/lspconfig.lua` can be extended to add more language servers. Simply add the server name to the servers list and configure any server-specific options. Formatter configurations in `lua/configs/conform.lua` can be adjusted to match your code style preferences.

## Troubleshooting

If plugins fail to load, try running `:Lazy sync` to update all plugins to their latest versions. For LSP-related issues, use `:LspInfo` to check which language servers are attached to the current buffer and their status. If formatters aren't working, verify they're installed using `:Mason` and check the conform configuration for the current filetype.

The `:checkhealth` command provides diagnostic information about your Neovim setup, including whether required external programs are available and properly configured. This is often the first place to look when something isn't working as expected.

## Contributing

If you encounter issues or have suggestions for improvements, feel free to open an issue or submit a pull request on the GitHub repository. Contributions that enhance the configuration while maintaining its philosophy of being fast, functional, and user-friendly are welcome.

## License

This configuration is provided as-is for personal use and modification. Feel free to fork, modify, and adapt it to your needs.

---

**Happy coding with NvimRC!**
