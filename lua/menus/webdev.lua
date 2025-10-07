-- lua/menus/webdev.lua
-- Web development tools menu (HTML, CSS, JS, TS, React)

return {
  {
    name = " Web Development",
    title = true,
    hl = "ExCyan",
  },

  { name = "separator" },

  -- Live Server Controls
  {
    name = " Live Server",
    items = {
      {
        name = "Start Server",
        cmd = "LiveServerStart",
        rtxt = "<leader>ls",
      },
      {
        name = "Stop Server",
        cmd = "LiveServerStop",
        rtxt = "<leader>lS",
      },
    },
  },

  { name = "separator" },

  -- Code Actions
  {
    name = "󰌵 Code Actions",
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
    name = " Goto Definition",
    cmd = vim.lsp.buf.definition,
    rtxt = "gd",
  },

  {
    name = " Show References",
    cmd = "Telescope lsp_references",
    rtxt = "gr",
  },

  { name = "separator" },

  -- Browser Tools
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

  -- Component Tools (for React/Vue/Svelte)
  {
    name = " Component Tools",
    items = {
      {
        name = "Go to Component Definition",
        cmd = vim.lsp.buf.definition,
        rtxt = "gd",
      },
      {
        name = "Find Component Usage",
        cmd = "Telescope lsp_references",
        rtxt = "gr",
      },
      {
        name = "Rename Component",
        cmd = vim.lsp.buf.rename,
        rtxt = "<leader>rn",
      },
    },
  },

  { name = "separator" },

  -- Package Management
  {
    name = "󰯁 Package Scripts",
    items = {
      {
        name = "Run Dev Server",
        cmd = function()
          require("nvchad.term").send("npm run dev", "horizontal")
        end,
      },
      {
        name = "Run Build",
        cmd = function()
          require("nvchad.term").send("npm run build", "horizontal")
        end,
      },
      {
        name = "Run Tests",
        cmd = function()
          require("nvchad.term").send("npm test", "horizontal")
        end,
      },
      {
        name = "Install Dependencies",
        cmd = function()
          require("nvchad.term").send("npm install", "horizontal")
        end,
      },
    },
  },

  { name = "separator" },

  -- Color Tools
  {
    name = " Color Picker",
    cmd = function()
      require("minty.huefy").open()
    end,
    rtxt = "<leader>ch",
  },

  {
    name = " ESLint Fix",
    cmd = function()
      vim.cmd "!eslint --fix %"
    end,
  },
}
