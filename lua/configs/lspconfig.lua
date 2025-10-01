-- Use native vim.lsp.config (Neovim 0.11+)
local servers = { "html", "cssls", "emmet_ls" }

-- Common capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Common on_attach function
local on_attach = function(client, bufnr)
  -- Your on_attach logic here
end

-- Setup each server using vim.lsp.config
for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    capabilities = capabilities,
    on_attach = on_attach,
  })
end

-- Extra emmet_ls config with specific filetypes and init_options
vim.lsp.config("emmet_ls", {
  filetypes = {
    "html",
    "typescriptreact",
    "javascriptreact",
    "css",
    "sass",
    "scss",
    "less",
    "svelte",
    "vue",
  },
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    html = { options = { ["bem.enabled"] = true } },
  },
})
