-- lua/menus/webdev.lua
-- Web development menu (HTML, CSS, JavaScript, TypeScript, React)

return {
  -- Live preview
  {
    name = " Start Live Server",
    cmd = "LiveServerStart",
    rtxt = "<leader>ls",
  },
  {
    name = " Stop Live Server",
    cmd = "LiveServerStop",
    rtxt = "<leader>lS",
  },

  { name = "separator" },

  -- Code actions
  {
    name = "󰌵 Code Action",
    cmd = vim.lsp.buf.code_action,
    rtxt = "<leader>ca",
  },
  {
    name = " Rename",
    cmd = vim.lsp.buf.rename,
    rtxt = "<leader>rn",
  },
  {
    name = " Format",
    cmd = function()
      require("conform").format { async = true, lsp_fallback = true }
    end,
    rtxt = "<leader>fm",
  },

  { name = "separator" },

  -- Navigation
  {
    name = " Definition",
    cmd = vim.lsp.buf.definition,
    rtxt = "gd",
  },
  {
    name = " References",
    cmd = "Telescope lsp_references",
    rtxt = "gr",
  },

  { name = "separator" },

  -- Browser tools
  {
    name = " Open in Browser",
    cmd = function()
      local path = vim.fn.expand "%:p"
      local cmd
      if vim.fn.has "mac" == 1 then
        cmd = "open"
      elseif vim.fn.has "unix" == 1 then
        cmd = "xdg-open"
      elseif vim.fn.has "win32" == 1 then
        cmd = "start"
      end
      if cmd then
        vim.fn.jobstart({ cmd, path }, { detach = true })
      end
    end,
  },

  { name = "separator" },

  -- Quick actions
  {
    name = " Color Picker",
    cmd = function()
      require("minty.huefy").open()
    end,
  },
}
