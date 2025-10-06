-- ============================================================================
-- FILE: lua/menus/terminal.lua
-- DESCRIPTION: Terminal operations menu
-- ============================================================================

return {
  -- Open Terminals
  {
    name = " Floating Terminal",
    cmd = function()
      require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
    end,
    rtxt = "<leader>tf",
  },
  {
    name = " Horizontal Terminal",
    cmd = function()
      require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
    end,
    rtxt = "<leader>th",
  },
  {
    name = " Vertical Terminal",
    cmd = function()
      require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
    end,
    rtxt = "<leader>tv",
  },

  { name = "separator" },

  -- Run Commands
  {
    name = " Run Current File",
    cmd = function()
      local runners = {
        python = "python3 %",
        javascript = "node %",
        typescript = "ts-node %",
        rust = "cargo run",
        go = "go run %",
        lua = "lua %",
      }
      local ft = vim.bo.filetype
      local cmd = runners[ft]
      if cmd then
        cmd = cmd:gsub("%%", vim.fn.expand "%:p")
        require("nvchad.term").send(cmd, "horizontal")
        vim.notify("Running: " .. cmd, vim.log.levels.INFO)
      else
        vim.notify("No runner for: " .. ft, vim.log.levels.WARN)
      end
    end,
    rtxt = "<leader>tr",
  },

  { name = "separator" },

  -- Quick Tools
  {
    name = " LazyGit",
    cmd = function()
      require("nvchad.term").send("lazygit", "float")
    end,
    rtxt = "<leader>tg",
  },
}
