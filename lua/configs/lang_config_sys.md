# Language Configuration System - Integration Guide

This guide shows you how to integrate the new language configuration system into your existing setup.

## 1. Create the Directory Structure

```bash
cd ~/.config/nvimrc
mkdir -p lua/configs/languages/langs
```

## 2. Update Your `init.lua`

Add this line near the top, after lazy.nvim setup but before loading keymaps:

```lua
-- In your init.lua, add after require("lazy").setup() but before require "keymaps"

-- Load language configuration system
require("configs.languages").setup()
```

## 3. Update `lua/plugins/init.lua`

Replace your Mason configuration with this:

```lua
{
  "williamboman/mason.nvim",
  opts = function()
    -- Get packages from language configs
    local lang_packages = require("configs.languages").get_mason_packages()
    
    -- Merge with any manually specified packages
    local manual_packages = {
      -- Add any additional packages here that aren't in language configs
    }
    
    return {
      ensure_installed = vim.list_extend(lang_packages, manual_packages),
    }
  end,
},
```

## 4. Update `lua/configs/lspconfig.lua`

Replace with this version that loads from language configs:

```lua
-- lua/configs/lspconfig.lua
-- Modern LSP config for Neovim 0.11+ with language configs integration

if vim.fn.has("nvim-0.11") == 0 then
  vim.notify("LSP config requires Neovim 0.11+", vim.log.levels.WARN)
  return
end

-- Common capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = { "documentation", "detail", "additionalTextEdits" },
  },
}

-- Get server configurations from language configs
local servers = require("configs.languages").get_lsp_configs()

-- Setup each server using new API
for server, config in pairs(servers) do
  vim.lsp.config(
    server,
    vim.tbl_extend("force", {
      capabilities = capabilities,
    }, config)
  )
end

-- Enable servers
vim.lsp.enable(vim.tbl_keys(servers))
```

## 5. Update `lua/configs/conform.lua`

Replace the formatters_by_ft section:

```lua
local options = {
  formatters_by_ft = require("configs.languages").get_formatter_configs(),
  
  format_on_save = function(bufnr)
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end
    return {
      timeout_ms = 500,
      lsp_fallback = true,
    }
  end,
  
  formatters = {
    shfmt = {
      prepend_args = { "-i", "2" },
    },
  },
}

return options
```

## 6. Update `lua/plugins/coding/nvim-lint.lua`

Replace with:

```lua
-- lua/plugins/coding/nvim-lint.lua
return {
  "mfussenegger/nvim-lint",
  config = function()
    require("lint").linters_by_ft = require("configs.languages").get_linter_configs()
    
    vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
```

## 7. Add Language Configurations

Now you can add new languages easily! Just create a file in `lua/configs/languages/langs/`:

### Example: Go

```lua
-- lua/configs/languages/langs/go.lua
return {
  name = "go",
  filetypes = { "go" },
  
  lsp = {
    server = "gopls",
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
  },
  
  formatters = { "gofmt", "goimports" },
  linters = { "golangci-lint" },
  
  autocmds = {
    {
      desc = "Go-specific settings",
      callback = function()
        vim.opt_local.expandtab = false
        vim.opt_local.shiftwidth = 4
        vim.opt_local.tabstop = 4
      end,
    },
  },
  
  keymaps = {
    {
      mode = "n",
      lhs = "<leader>rg",
      rhs = function()
        require("nvchad.term").send("go run .", "horizontal")
      end,
      opts = { desc = "Go run" },
    },
    {
      mode = "n",
      lhs = "<leader>rt",
      rhs = function()
        require("nvchad.term").send("go test ./...", "horizontal")
      end,
      opts = { desc = "Go test" },
    },
  },
}
```

## 8. Usage

After setting everything up:

1. **Add a new language**: Just create a file in `lua/configs/languages/langs/`
2. **Reload config**: `:source %` or restart Neovim
3. **Install tools**: `:MasonInstall` (if needed)
4. **That's it!** All LSP, formatting, linting, keymaps, and autocmds are automatically configured

## Benefits

✅ **One file per language** - All configuration in one place  
✅ **Automatic integration** - Works with Mason, LSP, formatters, linters  
✅ **No duplication** - Define once, use everywhere  
✅ **Easy to maintain** - Add/remove languages by adding/removing files  
✅ **Shareable** - Share language configs between projects  
✅ **Type safety** - Clear structure for each language  

## Template for New Languages

```lua
-- lua/configs/languages/langs/YOUR_LANGUAGE.lua
return {
  name = "YOUR_LANGUAGE",
  filetypes = { "YOUR_FILETYPE" },
  
  lsp = {
    server = "your_lsp_server",
    settings = {
      -- LSP-specific settings
    },
  },
  
  formatters = { "formatter1", "formatter2" },
  linters = { "linter1" },
  
  dap = {
    adapter = "debugpy",  -- if debugging support needed
    config = function()
      -- DAP configuration
    end,
  },
  
  snippets = {
    -- LuaSnip snippets
  },
  
  autocmds = {
    {
      desc = "Description",
      callback = function()
        -- Your autocmd logic
      end,
    },
  },
  
  keymaps = {
    {
      mode = "n",
      lhs = "<leader>key",
      rhs = function() end,
      opts = { desc = "Description" },
    },
  },
}
```
