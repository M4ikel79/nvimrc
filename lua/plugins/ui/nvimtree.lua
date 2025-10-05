-- lua/plugins/nvimtree.lua
return {
	"nvim-tree/nvim-tree.lua",
	opts = {
		filters = { dotfiles = false },
		disable_netrw = true,
		hijack_cursor = true,
		sync_root_with_cwd = true,
		update_focused_file = {
			enable = true,
			update_root = false,
		},
		live_filter = {
			prefix = "[ ] :",
			always_show_folders = true,
		},
		view = {
			width = 30,
			preserve_window_proportions = true,
		},
	},
	config = function(_, opts)
		local nvimtree = require("nvim-tree")
		nvimtree.setup(opts)

		local api = require("nvim-tree.api")
		local function on_attach(bufnr)
			api.config.mappings.default_on_attach(bufnr)
			local function map(lhs, rhs, desc)
				vim.keymap.set("n", lhs, rhs, { buffer = bufnr, noremap = true, silent = true, desc = desc })
			end
			map("h", api.node.navigate.parent_close, "Close Directory")
			map("l", api.node.open.edit, "Open")
		end
		nvimtree.setup(vim.tbl_extend("force", opts, { on_attach = on_attach }))
	end,
}
