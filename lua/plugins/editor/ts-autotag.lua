-- lua/plugins/ts-autotag.lua
return {
  "windwp/nvim-ts-autotag",
  event = "InsertEnter",
  ft = {
    "html",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "vue",
    "xml",
    "svelte",
  },
  opts = {
    opts = {
      enable_close = true,
      enable_rename = true,
      enable_close_on_slash = false,
    },
  },
}
