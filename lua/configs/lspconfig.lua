-- Modern LSP config for Neovim 0.11+
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

-- Server configurations
local servers = {
	html = {},
	cssls = {},
	emmet_ls = {
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
		init_options = {
			html = { options = { ["bem.enabled"] = true } },
		},
	},
	rust_analyzer = {
		settings = {
			["rust-analyzer"] = {
				cargo = { allFeatures = true },
				checkOnSave = { command = "clippy" },
			},
		},
	},
	jdtls = {},
	ts_ls = {}, -- Note: renamed from tsserver in 0.11
	pyright = {
		settings = {
			python = {
				analysis = {
					typeCheckingMode = "basic",
					autoSearchPaths = true,
					useLibraryCodeForTypes = true,
				},
			},
		},
	},
}

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
