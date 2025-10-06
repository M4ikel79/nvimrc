-- lua/menus/window.lua
-- Window and buffer management menu

return {
  -- ============================================================================
  -- Split Windows
  -- ============================================================================
  {
    name = " Split Below",
    cmd = function()
      vim.cmd "split"
    end,
    rtxt = "<leader>-",
  },
  {
    name = " Split Right",
    cmd = function()
      vim.cmd "vsplit"
    end,
    rtxt = "<leader>|",
  },
  {
    name = " Close Window",
    cmd = function()
      vim.cmd "close"
    end,
    rtxt = "<leader>wd",
  },
  {
    name = " Only This Window",
    cmd = function()
      vim.cmd "only"
    end,
    rtxt = "<leader>wo",
  },

  { name = "separator" },

  -- ============================================================================
  -- Window Navigation
  -- ============================================================================
  {
    name = " Focus Left",
    cmd = function()
      vim.cmd "wincmd h"
    end,
    rtxt = "<C-h>",
  },
  {
    name = " Focus Down",
    cmd = function()
      vim.cmd "wincmd j"
    end,
    rtxt = "<C-j>",
  },
  {
    name = " Focus Up",
    cmd = function()
      vim.cmd "wincmd k"
    end,
    rtxt = "<C-k>",
  },
  {
    name = " Focus Right",
    cmd = function()
      vim.cmd "wincmd l"
    end,
    rtxt = "<C-l>",
  },

  { name = "separator" },

  -- ============================================================================
  -- Window Arrangement
  -- ============================================================================
  {
    name = " Move to Far Left",
    cmd = function()
      vim.cmd "wincmd H"
    end,
    rtxt = "<leader>wh",
  },
  {
    name = " Move to Bottom",
    cmd = function()
      vim.cmd "wincmd J"
    end,
    rtxt = "<leader>wj",
  },
  {
    name = " Move to Top",
    cmd = function()
      vim.cmd "wincmd K"
    end,
    rtxt = "<leader>wk",
  },
  {
    name = " Move to Far Right",
    cmd = function()
      vim.cmd "wincmd L"
    end,
    rtxt = "<leader>wl",
  },
  {
    name = " Equalize Sizes",
    cmd = function()
      vim.cmd "wincmd ="
    end,
    rtxt = "<leader>w=",
  },

  { name = "separator" },

  -- ============================================================================
  -- Buffer Navigation
  -- ============================================================================
  {
    name = " Previous Buffer",
    cmd = "bprevious",
    rtxt = "<A-,>",
  },
  {
    name = " Next Buffer",
    cmd = "bnext",
    rtxt = "<A-.>",
  },
  {
    name = " Close Buffer",
    cmd = "Bdelete",
    rtxt = "<A-c>",
  },
  {
    name = " Buffer Picker",
    cmd = "Telescope buffers",
    rtxt = "<C-p>",
  },
  {
    name = " Close Other Buffers",
    cmd = function()
      local current = vim.api.nvim_get_current_buf()
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if buf ~= current and vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted then
          vim.api.nvim_buf_delete(buf, { force = false })
        end
      end
      vim.notify("Closed other buffers", vim.log.levels.INFO)
    end,
  },

  { name = "separator" },

  -- ============================================================================
  -- Tabs
  -- ============================================================================
  {
    name = " New Tab",
    cmd = "tabnew",
    rtxt = "<leader>tn",
  },
  {
    name = " Close Tab",
    cmd = "tabclose",
    rtxt = "<leader>tc",
  },
  {
    name = " Next Tab",
    cmd = "tabnext",
    rtxt = "<leader>tl",
  },
  {
    name = " Previous Tab",
    cmd = "tabprevious",
    rtxt = "<leader>th",
  },
  {
    name = " First Tab",
    cmd = "tabfirst",
    rtxt = "<leader>t0",
  },
  {
    name = " Last Tab",
    cmd = "tablast",
    rtxt = "<leader>t$",
  },

  { name = "separator" },

  -- ============================================================================
  -- Zoom
  -- ============================================================================
  {
    name = " Toggle Zoom",
    cmd = function()
      if vim.t.zoomed then
        vim.cmd "tabclose"
        vim.t.zoomed = false
      else
        vim.cmd "tab split"
        vim.t.zoomed = true
      end
    end,
  },
}
