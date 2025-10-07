# Frequently Asked Questions

Common questions and solutions for NvimRC.

## Table of Contents

- [General](#general)
- [Installation](#installation)
- [Keybindings](#keybindings)
- [Plugins](#plugins)
- [LSP](#lsp)
- [Performance](#performance)
- [Customization](#customization)
- [Troubleshooting](#troubleshooting)

---

## General

### What is NvimRC?

NvimRC is a modern, feature-rich Neovim configuration built on top of NvChad v2.5. It provides intelligent keymaps, context-aware menus, AI assistance, and extensive plugin integration for an enhanced development experience.

### Do I need to uninstall my current Neovim config?

No! NvimRC uses the `NVIM_APPNAME` environment variable to keep configurations separate. Your existing config remains at `~/.config/nvim`, while NvimRC lives at `~/.config/nvimrc`.

**Access NvimRC:** `NVIM_APPNAME=nvimrc nvim` or use the alias: `vi`  
**Access original:** `nvim`

### What's the difference between NvimRC and NvChad?

NvimRC is built on NvChad v2.5 and extends it with:

- Modular keymap system using mini.keymap
- Context-aware menu system
- 10 custom themes
- AI integration (CodeCompanion)
- Enhanced LSP configuration
- Additional plugins (60+ total)
- Comprehensive documentation

### What version of Neovim do I need?

Neovim 0.10.0 or higher is required. Some features may require 0.10.2+.

Check version: `nvim --version`

### Is this configuration suitable for beginners?

Yes and no:

- **Yes:** Extensive documentation, discoverable menus, sensible defaults
- **No:** Many features to learn, requires understanding of Vim motions

**Recommendation:** Start with basic Vim tutorial (`:Tutor`), then explore NvimRC features gradually.

---

## Installation

### How do I update NvimRC?

```bash
cd ~/.config/nvimrc
git pull
nvim
# Run :Lazy sync
```

### Can I use this on Windows?

Yes! NvimRC works on Windows with some caveats:

- Use PowerShell or Windows Terminal
- Install dependencies via Chocolatey or Scoop
- Some Unix-specific features may not work
- See [Installation Guide](installation.md#windows) for details

### Why is my first launch so slow?

First launch downloads and installs all plugins (60+). This is normal and only happens once. Subsequent launches are <100ms.

### Do I need to install all language servers?

No! Install only what you need:

```vim
:Mason
```

Press `i` to install servers for languages you use.

### Can I use my existing Neovim plugins?

Not directly. NvimRC is a complete configuration. However, you can:

1. Add plugins to `lua/plugins/` directory
2. Port your existing plugin configs

See [Customization Guide](customization.md) for details.

---

## Keybindings

### What's the leader key?

`<Space>` (spacebar)

### How do I discover keybindings?

1. **Press `<Space>` and wait** - Which-key shows available keys
2. **Press `<C-Space>`** - Context menu with relevant actions
3. **Press `<Space>fk`** - Browse all keymaps with Telescope
4. **Read [Keybindings Reference](keybindings.md)**

### Why don't my Alt/Meta keys work?

**Terminal issue:** Ensure your terminal sends Alt keys correctly.

**iTerm2 (macOS):**

- Preferences → Profiles → Keys → Left/Right Option key → Esc+

**Windows Terminal:**

```json
"altGrAliasing": false
```

**Tmux:**

```tmux
set -s escape-time 0
```

### Can I change keybindings?

Yes! See [Customization Guide](customization.md#keybindings).

Quick example:

```lua
-- lua/keymaps/custom.lua
local map = vim.keymap.set
map("n", "<leader>x", "<cmd>YourCommand<cr>", { desc = "Description" })
```

### What's the difference between `jk` and `<Esc>`?

Both exit insert mode, but `jk` (or `kj`) is faster to type since you don't leave home row. It's a common Vim optimization.

---

## Plugins

### How do I update plugins?

```vim
:Lazy sync      " Update all
:Lazy update    " Update without removing/cleaning
:Lazy clean     " Remove unused plugins
```

### How do I disable a plugin?

Add `enabled = false` to plugin spec:

```lua
-- lua/plugins/unwanted.lua
return {
  "author/plugin",
  enabled = false,
}
```

### Why is [plugin] not working?

1. **Check if installed:**

   ```vim
   :Lazy
   ```

2. **Check plugin status:**
   Look for error messages in Lazy UI

3. **Check dependencies:**
   Some plugins require external tools

4. **Check logs:**
   ```vim
   :messages
   :Lazy log
   ```

### How do I add a new plugin?

Create file in `lua/plugins/`:

```lua
-- lua/plugins/my-plugin.lua
return {
  "author/plugin-name",
  event = "VeryLazy",  -- Lazy load
  opts = {
    -- options
  },
}
```

Restart Neovim or `:Lazy sync`

### What's the difference between lazy-loading events?

```lua
event = "VeryLazy"      -- After startup
event = "BufReadPost"   -- After opening file
event = "InsertEnter"   -- Entering insert mode
cmd = "Command"         -- When command is used
ft = "filetype"         -- For specific filetype
keys = "<leader>x"      -- When key is pressed
```

---

## LSP

### Why isn't LSP working for my language?

1. **Install language server:**

   ```vim
   :Mason
   ```

   Press `i` on the server you need

2. **Check if attached:**

   ```vim
   :LspInfo
   ```

3. **Restart LSP:**

   ```vim
   :LspRestart
   ```

4. **Check logs:**
   ```vim
   :LspLog
   ```

### How do I add a new language server?

Edit `lua/configs/lspconfig.lua`:

```lua
local servers = {
  -- Add your server
  your_server = {
    settings = {
      -- server-specific settings
    },
  },
}
```

Install via Mason, then restart Neovim.

### Why is formatting not working?

1. **Check formatter installed:**

   ```vim
   :Mason
   ```

2. **Check Conform config:**

   ```vim
   :ConformInfo
   ```

3. **Check if disabled:**

   ```vim
   :lua print(vim.b.disable_autoformat or vim.g.disable_autoformat)
   ```

4. **Enable format on save:**
   ```vim
   :FormatEnable
   ```

### How do I disable format on save?

**Current buffer only:**

```vim
:FormatDisable
```

**All buffers:**

```vim
:FormatDisable!
```

**Re-enable:**

```vim
:FormatEnable
```

### Can I use multiple formatters?

Yes! Edit `lua/configs/conform.lua`:

```lua
formatters_by_ft = {
  python = { "isort", "black" },  -- Runs in order
  javascript = { "prettierd", "prettier", stop_after_first = true },  -- First available
}
```

---

## Performance

### Why is Neovim slow?

Common causes:

1. **Too many plugins loading at startup**
   - Check: `:Lazy profile`
   - Fix: Add lazy-loading triggers

2. **Large files**
   - Treesitter can slow down large files
   - Disable: `:TSDisable highlight`

3. **Too many LSP servers**
   - Only install what you need

4. **Slow network** (first install)
   - Plugin downloads take time initially

### How can I improve startup time?

1. **Profile startup:**

   ```vim
   :Lazy profile
   ```

2. **Lazy-load more plugins:**

   ```lua
   event = "VeryLazy"  -- Instead of lazy = false
   ```

3. **Disable unused plugins:**

   ```lua
   enabled = false
   ```

4. **Reduce plugin count:**
   Remove plugins you don't use

### What's a good startup time?

- **<50ms** - Excellent
- **50-100ms** - Good
- **100-200ms** - Acceptable
- **>200ms** - Time to optimize

NvimRC targets <100ms with lazy-loading.

---

## Customization

### How do I change the theme?

**Temporarily:**

```vim
:colorscheme theme-name
```

**Permanently:**
Edit `lua/chadrc.lua`:

```lua
base46 = {
  theme = "dracula-pro",
}
```

**See available themes:**

```vim
<Space>th  " Theme selector
```

### How do I change indentation?

**Global (all files):**
Edit `lua/options.lua`:

```lua
vim.o.shiftwidth = 4
vim.o.tabstop = 4
```

**Per filetype:**

```lua
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
  end,
})
```

### Can I use my own snippets?

Yes! NvimRC uses LuaSnip. Add snippets to:

```
~/.config/nvimrc/snippets/
```

Or use existing snippets in `friendly-snippets`.

### How do I add custom commands?

```lua
-- lua/autocmds.lua or custom file
vim.api.nvim_create_user_command("MyCommand", function()
  -- Your code
end, {
  desc = "Description",
})
```

Usage: `:MyCommand`

---

## Troubleshooting

### Icons appear as boxes or question marks

**Problem:** Nerd Font not installed or not configured in terminal.

**Solution:**

1. Install a Nerd Font (e.g., JetBrainsMono Nerd Font)
2. Configure terminal to use it
3. Restart terminal

See [Installation Guide](installation.md#prerequisites) for details.

### Plugins won't install

**Try:**

```vim
:Lazy sync
:Lazy clean
:Lazy restore
```

**Still failing:**

```bash
rm ~/.config/nvimrc/lazy-lock.json
rm -rf ~/.local/share/nvimrc
vi
```

### Git integration not working

1. **Check LazyGit installed:**

   ```bash
   which lazygit
   ```

2. **Check in git repo:**

   ```bash
   git status
   ```

3. **Check Gitsigns:**
   ```vim
   :Gitsigns toggle_signs
   ```

### Terminal mode keys don't work

**Problem:** Terminal intercepts certain keys.

**Solution:**

- Check terminal key bindings
- Disable terminal shortcuts that conflict
- Use alternative keys (e.g., `<C-x>` instead of `<C-/>`)

### Clipboard not working

**Linux:** Install xclip or xsel:

```bash
sudo apt install xclip
# or
sudo apt install xsel
```

**WSL:** Install win32yank:

```bash
curl -sLo /tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe
chmod +x /tmp/win32yank.exe
sudo mv /tmp/win32yank.exe /usr/local/bin/
```

**macOS:** Should work out of the box.

### Telescope is slow

**For large projects:**

```lua
-- Add to Telescope config
require("telescope").setup {
  defaults = {
    file_ignore_patterns = { "node_modules", ".git" },
  },
}
```

**Use ripgrep:**
Ensure ripgrep is installed for faster searching.

### Mason tools not found

**Problem:** PATH not set correctly.

**Solution:**
Add to shell config:

```bash
export PATH="$HOME/.local/share/nvimrc/mason/bin:$PATH"
```

---

## AI Integration

### How do I configure CodeCompanion?

1. Get API key from [OpenRouter](https://openrouter.ai/)

2. Add to shell config:

   ```bash
   export OPENROUTER_API_KEY="your-key"
   ```

3. Restart shell

4. Test in Neovim:
   ```vim
   :CodeCompanionChat
   ```

### Can I use a different AI provider?

Yes! Edit `lua/configs/companion.lua`:

```lua
adapters = {
  http = {
    your_provider = function()
      return require("codecompanion.adapters").extend("openai", {
        name = "your_provider",
        url = "your-api-url",
        -- ... your config
      })
    end,
  },
},
```

### AI commands not working

1. **Check API key set:**

   ```bash
   echo $OPENROUTER_API_KEY
   ```

2. **Check plugin loaded:**

   ```vim
   :Lazy
   ```

   Look for codecompanion

3. **Check logs:**
   ```vim
   :messages
   ```

---

## Miscellaneous

### How do I uninstall NvimRC?

```bash
rm -rf ~/.config/nvimrc
rm -rf ~/.local/share/nvimrc
rm -rf ~/.cache/nvimrc
```

Remove alias from shell config.

### Can I contribute?

Yes! See main [README.md](../README.md#contributing) for guidelines.

### Where can I get help?

- **Documentation:** Check `docs/` directory
- **GitHub Issues:** [Report bugs](https://github.com/M4ikel79/nvimrc/issues)
- **GitHub Discussions:** [Ask questions](https://github.com/M4ikel79/nvimrc/discussions)
- **Neovim community:** [Reddit](https://reddit.com/r/neovim), [Discord](https://discord.gg/neovim)

### How do I report a bug?

1. Check if it's already reported
2. Include:
   - Neovim version (`:version`)
   - OS and terminal
   - Steps to reproduce
   - Error messages (`:messages`)
   - Minimal config if possible

### Is there a video tutorial?

Not yet! But the documentation is comprehensive. Start with:

1. [Installation Guide](installation.md)
2. [Keybindings Reference](keybindings.md)
3. Try `:Tutor` for Vim basics

---

## Tips & Tricks

### Useful Commands

```vim
:checkhealth         " System diagnostics
:Lazy profile        " Startup time analysis
:LspInfo            " LSP status
:Mason              " Install tools
:ConformInfo        " Formatter status
:messages           " Recent messages
:Telescope keymaps  " Browse all keys
```

### Emergency Recovery

**Config broken? Start fresh:**

```bash
# Backup current config
mv ~/.config/nvimrc ~/.config/nvimrc.backup

# Clone fresh copy
git clone https://github.com/M4ikel79/nvimrc.git ~/.config/nvimrc

# Launch
vi
```

**Still broken? Reset everything:**

```bash
rm -rf ~/.config/nvimrc
rm -rf ~/.local/share/nvimrc
rm -rf ~/.cache/nvimrc

# Start fresh installation
```

---

## Still Need Help?

If your question isn't answered here:

1. Search the [documentation](.)
2. Check [GitHub Issues](https://github.com/M4ikel79/nvimrc/issues)
3. Ask in [GitHub Discussions](https://github.com/M4ikel79/nvimrc/discussions)
4. Join [Neovim Discord](https://discord.gg/neovim) #config-help channel

Happy coding! 🚀
