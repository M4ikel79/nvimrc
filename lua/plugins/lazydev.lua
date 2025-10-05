-- lua/plugins/lazydev.lua
return {
  "folke/lazydev.nvim",
  ft = "lua",
  opts = {
    library = {
      { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      { path = "NvChad", words = { "NvChad" } },
      { path = "lazy.nvim", words = { "lazy" } },
    },
    enabled = function(root_dir)
      if vim.uv.fs_stat(root_dir .. "/.luarc.json") then
        return false
      end
      return vim.g.lazydev_enabled == nil and true or vim.g.lazydev_enabled
    end,
  },
}
