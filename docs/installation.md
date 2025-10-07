# Installation Guide

Complete installation instructions for NvimRC across different platforms.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Platform-Specific Setup](#platform-specific-setup)
  - [Linux](#linux)
  - [macOS](#macos)
  - [Windows](#windows)
- [Quick Installation](#quick-installation)
- [Post-Installation](#post-installation)
- [Optional Dependencies](#optional-dependencies)
- [Troubleshooting](#troubleshooting)

---

## Prerequisites

### Required

1. **Neovim 0.10.0+**
   - Check version: `nvim --version`
   - [Download Latest](https://github.com/neovim/neovim/releases)

2. **Git**
   - Check version: `git --version`
   - Required for plugin management

3. **A Nerd Font**
   - Required for icons and symbols
   - Recommended: [JetBrainsMono Nerd Font](https://www.nerdfonts.com/font-downloads)

### Recommended

4. **Node.js & npm**
   - Required for: LSP servers, live-server, prettier
   - Check: `node --version && npm --version`
   - [Download](https://nodejs.org/)

5. **Ripgrep (rg)**
   - Required for: Fast searching, live grep
   - Check: `rg --version`
   - [Install](https://github.com/BurntSushi/ripgrep#installation)

6. **Language Runtimes**
   - Python 3.8+ (for pyright, black)
   - Rust (for rust-analyzer)
   - Java 17+ (for jdtls)

---

## Platform-Specific Setup

### Linux

#### Debian/Ubuntu

```bash
# Update package list
sudo apt update

# Install Neovim (use PPA for latest version)
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim

# Install dependencies
sudo apt install git nodejs npm ripgrep python3 python3-pip

# Install a Nerd Font
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/JetBrainsMono.zip
unzip JetBrainsMono.zip
fc-cache -fv
```

#### Arch Linux

```bash
# Install Neovim and dependencies
sudo pacman -S neovim git nodejs npm ripgrep python python-pip

# Install Nerd Font
yay -S ttf-jetbrains-mono-nerd
# or
paru -S ttf-jetbrains-mono-nerd
```

#### Fedora

```bash
# Install Neovim and dependencies
sudo dnf install neovim git nodejs npm ripgrep python3 python3-pip

# Install Nerd Font
sudo dnf install jetbrains-mono-fonts-all
```

### macOS

```bash
# Using Homebrew
brew install neovim git node ripgrep python

# Install Nerd Font
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font

# Or manually download and install from:
# https://www.nerdfonts.com/font-downloads
```

### Windows

#### Using Chocolatey

```powershell
# Install Chocolatey first (if not installed)
# See: https://chocolatey.org/install

# Install Neovim and dependencies
choco install neovim git nodejs ripgrep python

# Install Nerd Font
choco install nerdfont-hack
```

#### Using Scoop

```powershell
# Install Scoop first (if not installed)
# See: https://scoop.sh/

# Install Neovim and dependencies
scoop install neovim git nodejs ripgrep python

# Install Nerd Font
scoop bucket add nerd-fonts
scoop install JetBrains-Mono-NF
```

#### Manual Installation

1. **Neovim**: Download from [neovim/releases](https://github.com/neovim/neovim/releases)
2. **Git**: Download from [git-scm.com](https://git-scm.com/download/win)
3. **Node.js**: Download from [nodejs.org](https://nodejs.org/)
4. **Ripgrep**: Download from [ripgrep releases](https://github.com/BurntSushi/ripgrep/releases)
5. **Python**: Download from [python.org](https://www.python.org/downloads/)

---

## Quick Installation

### 1. Clone the Repository

```bash
git clone https://github.com/M4ikel79/nvimrc.git ~/.config/nvimrc
```

**Windows (PowerShell):**

```powershell
git clone https://github.com/M4ikel79/nvimrc.git $env:LOCALAPPDATA\nvimrc
```

### 2. Set Up Shell Alias

**Linux/macOS (Bash):**

```bash
echo "alias vi='NVIM_APPNAME=nvimrc nvim'" >> ~/.bashrc
source ~/.bashrc
```

**Linux/macOS (Zsh):**

```bash
echo "alias vi='NVIM_APPNAME=nvimrc nvim'" >> ~/.zshrc
source ~/.zshrc
```

**Linux/macOS (Fish):**

```fish
echo "alias vi='NVIM_APPNAME=nvimrc nvim'" >> ~/.config/fish/config.fish
source ~/.config/fish/config.fish
```

**Windows (PowerShell):**

```powershell
# Add to your PowerShell profile
notepad $PROFILE

# Add this line:
function vi { & nvim.exe --cmd "let g:config_dir='nvimrc'" $args }
```

### 3. First Launch

```bash
vi
```

On first launch:

1. Lazy.nvim will automatically install
2. All plugins will be downloaded and installed
3. This process takes 2-5 minutes depending on your internet connection
4. You may see some error messages - this is normal during first install
5. Once complete, restart Neovim

### 4. Verify Installation

```vim
:checkhealth
```

Look for any errors or warnings and address them.

---

## Post-Installation

### Install LSP Servers

After first launch, install language servers:

```vim
:Mason
```

In Mason, press `i` to install:

- `html-lsp`, `css-lsp`, `emmet-ls` (web development)
- `typescript-language-server` (JavaScript/TypeScript)
- `pyright` (Python)
- `rust-analyzer` (Rust)
- `jdtls` (Java)
- `lua-language-server` (Lua)

### Install Formatters

Also in Mason, install formatters:

- `prettier`, `prettierd` (web)
- `black`, `isort` (Python)
- `stylua` (Lua)
- `rustfmt` (Rust)
- `google-java-format` (Java)

### Configure Your Terminal

1. **Set your terminal font** to a Nerd Font
   - **iTerm2**: Preferences → Profiles → Text → Font
   - **Windows Terminal**: Settings → Profiles → Appearance → Font face
   - **GNOME Terminal**: Preferences → Profile → Text → Font
   - **Alacritty**: Edit `~/.config/alacritty/alacritty.yml`
   - **Kitty**: Edit `~/.config/kitty/kitty.conf`

2. **Enable true color support**
   - Add to your shell config:
     ```bash
     export TERM=xterm-256color
     ```

3. **Configure cursor shape** (optional)
   - Most modern terminals support Neovim's cursor shape changes
   - Check terminal documentation if cursor doesn't change shape

### Configure AI Assistant (Optional)

If you want to use CodeCompanion AI features:

1. Get an API key from [OpenRouter](https://openrouter.ai/)

2. Add to your shell configuration:

   ```bash
   export OPENROUTER_API_KEY="your-key-here"
   ```

3. Restart your shell or source the config

4. Test in Neovim:
   ```vim
   :CodeCompanionChat
   ```

---

## Optional Dependencies

### Enhanced Terminal Support

```bash
# Tmux (for tmux navigation integration)
sudo apt install tmux  # Debian/Ubuntu
brew install tmux      # macOS
choco install tmux     # Windows

# LazyGit (for git TUI)
sudo apt install lazygit  # Debian/Ubuntu (may need PPA)
brew install lazygit      # macOS
scoop install lazygit     # Windows
```

### Additional Language Support

**Go:**

```bash
# Install Go
# Download from: https://golang.org/dl/

# Mason will install gopls (LSP)
:Mason
# Install: gopls, gofmt
```

**Rust:**

```bash
# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Mason will install rust-analyzer
```

**Java:**

```bash
# Install JDK 17+
sudo apt install openjdk-17-jdk  # Linux
brew install openjdk@17          # macOS

# Mason will install jdtls
```

### Web Development

```bash
# Install live-server globally
npm install -g live-server

# Or use the plugin's built-in installation
# It will run: pnpm add -g live-server
```

---

## Troubleshooting

### Neovim Version Too Old

**Problem:** "Neovim 0.10+ required"

**Solution:**

- **Linux:** Use Neovim PPA or AppImage
  ```bash
  sudo add-apt-repository ppa:neovim-ppa/unstable
  sudo apt update && sudo apt install neovim
  ```
- **macOS:** Use Homebrew
  ```bash
  brew upgrade neovim
  ```
- **Windows:** Download latest release from GitHub

### Plugins Not Installing

**Problem:** Plugins fail to install on first launch

**Solution:**

```vim
:Lazy sync
:Lazy clean
:Lazy restore
```

If still failing:

```bash
# Remove lazy-lock.json and try again
rm ~/.config/nvimrc/lazy-lock.json
vi
```

### LSP Not Working

**Problem:** LSP features not working

**Solution:**

1. Check if LSP server is installed:

   ```vim
   :Mason
   ```

2. Check LSP status:

   ```vim
   :LspInfo
   ```

3. Check logs:

   ```vim
   :LspLog
   ```

4. Reinstall server in Mason (press `X` then `i`)

### Icons Not Showing

**Problem:** Icons appear as boxes or question marks

**Solution:**

1. Ensure Nerd Font is installed
2. Configure terminal to use the Nerd Font
3. Restart terminal
4. Check font in Neovim:
   ```vim
   :set guifont?
   ```

### Mason Path Issues (Windows)

**Problem:** Mason can't find installed tools

**Solution:**
Add Mason bin to PATH:

```powershell
# PowerShell Profile
$env:PATH += ";$env:LOCALAPPDATA\nvim-data\mason\bin"
```

### Git Clone Fails

**Problem:** "Failed to clone repository"

**Solution:**

- Check internet connection
- Try HTTPS instead of SSH:
  ```bash
  git clone https://github.com/M4ikel79/nvimrc.git ~/.config/nvimrc
  ```
- Check firewall/proxy settings

### Performance Issues

**Problem:** Neovim feels slow

**Solution:**

1. Check startup time:

   ```vim
   :Lazy profile
   ```

2. Disable heavy plugins temporarily:

   ```lua
   -- In lua/plugins/[plugin].lua
   return {
     "plugin/name",
     enabled = false,  -- Add this line
   }
   ```

3. Check for conflicting plugins:
   ```vim
   :checkhealth lazy
   ```

### Windows Long Path Issues

**Problem:** "Path too long" errors on Windows

**Solution:**

```powershell
# Enable long paths (Administrator PowerShell)
git config --system core.longpaths true
```

### Python Provider Issues

**Problem:** "Python provider not found"

**Solution:**

```bash
# Install pynvim
pip3 install pynvim

# Or in Neovim
:checkhealth provider
```

---

## Verifying Installation

Run these checks to ensure everything is working:

```vim
" Check Neovim health
:checkhealth

" Check plugin status
:Lazy

" Check LSP servers
:Mason

" Check formatters
:ConformInfo

" Check git integration
:LazyGit

" Test AI (if configured)
:CodeCompanionChat
```

All checks should pass or show minor warnings. Critical errors should be addressed.

---

## Next Steps

After successful installation:

1. Read the [Keybindings Reference](keybindings.md)
2. Explore the [Menu System](menus.md)
3. Check out available [Themes](themes.md)
4. Review [Plugin Guide](plugins.md) for features
5. Start coding! 🚀

---

## Getting Help

- **Documentation:** Check other docs in `docs/` directory
- **FAQ:** See [FAQ.md](faq.md)
- **Issues:** [GitHub Issues](https://github.com/M4ikel79/nvimrc/issues)
- **Discussions:** [GitHub Discussions](https://github.com/M4ikel79/nvimrc/discussions)
