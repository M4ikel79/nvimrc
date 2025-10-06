-- lua/menus/files.lua
-- File operations and search menu

return {
  -- ============================================================================
  -- Find Files
  -- ============================================================================
  {
    name = " Find Files",
    cmd = "Telescope find_files",
    rtxt = "<leader>ff",
  },
  {
    name = " Find All Files",
    cmd = function()
      require("telescope.builtin").find_files { hidden = true, no_ignore = true }
    end,
    rtxt = "<leader>fa",
  },
  {
    name = " Recent Files",
    cmd = "Telescope oldfiles",
    rtxt = "<leader>fr",
  },

  { name = "separator" },

  -- ============================================================================
  -- Search
  -- ============================================================================
  {
    name = " Live Grep",
    cmd = "Telescope live_grep",
    rtxt = "<leader>fw",
  },
  {
    name = " Grep String",
    cmd = "Telescope grep_string",
    rtxt = "<leader>fg",
  },
  {
    name = " Search Word",
    cmd = function()
      local word = vim.fn.expand "<cword>"
      require("telescope.builtin").grep_string { search = word }
    end,
    rtxt = "<leader>fG",
  },

  { name = "separator" },

  -- ============================================================================
  -- File Explorer
  -- ============================================================================
  {
    name = " Toggle Explorer",
    cmd = "NvimTreeToggle",
    rtxt = "<C-n>",
  },
  {
    name = " Find in Explorer",
    cmd = "NvimTreeFindFile",
    rtxt = "<leader>E",
  },
  {
    name = " Focus Explorer",
    cmd = "NvimTreeFocus",
    rtxt = "<leader>eo",
  },
  {
    name = " Refresh Explorer",
    cmd = "NvimTreeRefresh",
    rtxt = "<leader>er",
  },

  { name = "separator" },

  -- ============================================================================
  -- File Operations
  -- ============================================================================
  {
    name = "󰈔 Copy File Path",
    items = {
      {
        name = "Copy Absolute Path",
        cmd = function()
          local path = vim.fn.expand "%:p"
          vim.fn.setreg("+", path)
          vim.notify("Copied: " .. path, vim.log.levels.INFO)
        end,
        rtxt = "ca",
      },
      {
        name = "Copy Relative Path",
        cmd = function()
          local path = vim.fn.expand "%:."
          vim.fn.setreg("+", path)
          vim.notify("Copied: " .. path, vim.log.levels.INFO)
        end,
        rtxt = "cr",
      },
      {
        name = "Copy File Name",
        cmd = function()
          local path = vim.fn.expand "%:t"
          vim.fn.setreg("+", path)
          vim.notify("Copied: " .. path, vim.log.levels.INFO)
        end,
        rtxt = "cn",
      },
    },
  },
  {
    name = " Open in System",
    cmd = function()
      local path = vim.api.nvim_buf_get_name(0)
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

  -- ============================================================================
  -- More Options
  -- ============================================================================
  {
    name = " Buffers",
    cmd = "Telescope buffers",
    rtxt = "<C-p>",
  },
  {
    name = "󰋚 Marks",
    cmd = "Telescope marks",
    rtxt = "<leader>fm",
  },
  {
    name = " Jumplist",
    cmd = "Telescope jumplist",
    rtxt = "<leader>fj",
  },
  {
    name = " Registers",
    cmd = "Telescope registers",
    rtxt = "<leader>fR",
  },
}
