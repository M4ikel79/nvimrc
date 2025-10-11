-- lua/configs/languages/init.lua
-- Centralized language configuration system
-- This module automatically loads language configs and integrates them with your setup

local M = {}

-- Storage for all language configurations
M.languages = {}

-- Register a language configuration
function M.register(lang_config)
  local name = lang_config.name
  if not name then
    vim.notify("Language config must have a 'name' field", vim.log.levels.ERROR)
    return
  end

  M.languages[name] = lang_config
  vim.notify("Registered language: " .. name, vim.log.levels.DEBUG)
end

-- Load all language configurations from lua/configs/languages/langs/*.lua
function M.load_all()
  local config_path = vim.fn.stdpath "config" .. "/lua/configs/languages/langs"

  -- Create directory if it doesn't exist
  if vim.fn.isdirectory(config_path) == 0 then
    vim.fn.mkdir(config_path, "p")
    vim.notify("Created language configs directory: " .. config_path, vim.log.levels.INFO)
    return
  end

  -- Load all .lua files from the langs directory
  local files = vim.fn.glob(config_path .. "/*.lua", false, true)

  for _, file in ipairs(files) do
    local module_name = vim.fn.fnamemodify(file, ":t:r")
    local ok, lang_config = pcall(require, "configs.languages.langs." .. module_name)

    if ok and type(lang_config) == "table" then
      M.register(lang_config)
    else
      vim.notify("Failed to load language config: " .. module_name, vim.log.levels.WARN)
    end
  end

  vim.notify("Loaded " .. vim.tbl_count(M.languages) .. " language configurations", vim.log.levels.INFO)
end

-- Get Mason packages to install from all language configs
function M.get_mason_packages()
  local packages = {}

  for _, lang in pairs(M.languages) do
    -- Add LSP servers
    if lang.lsp then
      if type(lang.lsp) == "string" then
        table.insert(packages, lang.lsp)
      elseif type(lang.lsp) == "table" and lang.lsp.server then
        table.insert(packages, lang.lsp.server)
      end
    end

    -- Add formatters
    if lang.formatters then
      for _, formatter in ipairs(lang.formatters) do
        table.insert(packages, formatter)
      end
    end

    -- Add linters
    if lang.linters then
      for _, linter in ipairs(lang.linters) do
        table.insert(packages, linter)
      end
    end

    -- Add DAP adapters
    if lang.dap and lang.dap.adapter then
      table.insert(packages, lang.dap.adapter)
    end
  end

  return packages
end

-- Get LSP configurations for all languages
function M.get_lsp_configs()
  local configs = {}

  for _, lang in pairs(M.languages) do
    if lang.lsp then
      local lsp_config = {}

      if type(lang.lsp) == "string" then
        -- Simple case: just the server name
        configs[lang.lsp] = {}
      elseif type(lang.lsp) == "table" then
        -- Complex case: server name + settings
        local server = lang.lsp.server
        lsp_config = vim.tbl_deep_extend("force", {}, lang.lsp.settings or {})
        configs[server] = lsp_config
      end
    end
  end

  return configs
end

-- Get formatter configurations for conform.nvim
function M.get_formatter_configs()
  local formatters_by_ft = {}

  for _, lang in pairs(M.languages) do
    if lang.formatters and lang.filetypes then
      for _, ft in ipairs(lang.filetypes) do
        formatters_by_ft[ft] = lang.formatters
      end
    end
  end

  return formatters_by_ft
end

-- Get linter configurations for nvim-lint
function M.get_linter_configs()
  local linters_by_ft = {}

  for _, lang in pairs(M.languages) do
    if lang.linters and lang.filetypes then
      for _, ft in ipairs(lang.filetypes) do
        linters_by_ft[ft] = lang.linters
      end
    end
  end

  return linters_by_ft
end

-- Setup autocmds for all languages
function M.setup_autocmds()
  local augroup = vim.api.nvim_create_augroup("LanguageConfigs", { clear = true })

  for _, lang in pairs(M.languages) do
    if lang.autocmds and lang.filetypes then
      for _, ft in ipairs(lang.filetypes) do
        for _, autocmd_config in ipairs(lang.autocmds) do
          vim.api.nvim_create_autocmd("FileType", {
            group = augroup,
            pattern = ft,
            callback = autocmd_config.callback or function()
              if autocmd_config.command then
                vim.cmd(autocmd_config.command)
              end
            end,
            desc = autocmd_config.desc or ("Language config for " .. lang.name),
          })
        end
      end
    end
  end
end

-- Setup keymaps for all languages
function M.setup_keymaps()
  for _, lang in pairs(M.languages) do
    if lang.keymaps and lang.filetypes then
      for _, ft in ipairs(lang.filetypes) do
        vim.api.nvim_create_autocmd("FileType", {
          pattern = ft,
          callback = function(ev)
            for _, keymap in ipairs(lang.keymaps) do
              vim.keymap.set(
                keymap.mode or "n",
                keymap.lhs,
                keymap.rhs,
                vim.tbl_extend("force", { buffer = ev.buf }, keymap.opts or {})
              )
            end
          end,
        })
      end
    end
  end
end

-- Setup snippets for all languages
function M.setup_snippets()
  local snippets_by_ft = {}

  for _, lang in pairs(M.languages) do
    if lang.snippets and lang.filetypes then
      for _, ft in ipairs(lang.filetypes) do
        snippets_by_ft[ft] = snippets_by_ft[ft] or {}
        vim.list_extend(snippets_by_ft[ft], lang.snippets)
      end
    end
  end

  -- Load snippets into LuaSnip
  local ok, luasnip = pcall(require, "luasnip")
  if ok then
    for ft, snippets in pairs(snippets_by_ft) do
      luasnip.add_snippets(ft, snippets)
    end
  end
end

-- Initialize the entire language configuration system
function M.setup()
  -- Load all language configurations
  M.load_all()

  -- Setup autocmds
  M.setup_autocmds()

  -- Setup keymaps
  M.setup_keymaps()

  -- Setup snippets
  M.setup_snippets()

  vim.notify("Language configuration system initialized", vim.log.levels.INFO)
end

return M
