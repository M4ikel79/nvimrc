return {
  "folke/lazydev.nvim",
  ft = "lua", -- only load on lua files
  opts = {
    library = {
      -- Load luvit types when the `vim.uv` word is found
      { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      -- Load NvChad types
      { path = "NvChad", words = { "NvChad" } },
      -- Load lazy.nvim types
      { path = "lazy.nvim", words = { "lazy" } },
    },
    -- Enable in all Neovim config directories
    enabled = function(root_dir)
      -- Disable if .luarc.json exists (prevents conflicts)
      if vim.uv.fs_stat(root_dir .. "/.luarc.json") then
        return false
      end
      -- Otherwise respect vim.g.lazydev_enabled
      return vim.g.lazydev_enabled == nil and true or vim.g.lazydev_enabled
    end,
  },
}
