-- lua/menus/debug.lua
-- Debugging menu with DAP controls

local dap = require "dap"
local dapui = require "dapui"

return {
  {
    name = " Debug",
    title = true,
    hl = "ExRed",
  },

  { name = "separator" },

  -- Session Control
  {
    name = " Continue/Start",
    cmd = dap.continue,
    rtxt = "<leader>dc",
  },

  {
    name = " Run to Cursor",
    cmd = dap.run_to_cursor,
    rtxt = "<leader>dC",
  },

  {
    name = "󰜉 Restart Session",
    cmd = dap.restart,
    rtxt = "<leader>dr",
  },

  {
    name = "󰜚 Terminate",
    cmd = dap.terminate,
    rtxt = "<leader>dt",
  },

  {
    name = "󰏤 Pause",
    cmd = dap.pause,
    rtxt = "<leader>dp",
  },

  { name = "separator" },

  -- Breakpoints submenu
  {
    name = " Breakpoints",
    items = {
      {
        name = "Toggle Breakpoint",
        cmd = dap.toggle_breakpoint,
        rtxt = "<leader>db",
      },
      {
        name = "Conditional Breakpoint",
        cmd = function()
          dap.set_breakpoint(vim.fn.input "Breakpoint condition: ")
        end,
        rtxt = "<leader>dB",
      },
      {
        name = "List Breakpoints",
        cmd = dap.list_breakpoints,
        rtxt = "<leader>dL",
      },
      {
        name = "Clear All Breakpoints",
        cmd = dap.clear_breakpoints,
        rtxt = "<leader>dX",
      },
    },
  },

  { name = "separator" },

  -- Step Controls
  {
    name = " Step Into",
    cmd = dap.step_into,
    rtxt = "<leader>di",
  },

  {
    name = " Step Over",
    cmd = dap.step_over,
    rtxt = "<leader>do",
  },

  {
    name = " Step Out",
    cmd = dap.step_out,
    rtxt = "<leader>dO",
  },

  {
    name = " Stack Down",
    cmd = dap.down,
    rtxt = "<leader>dj",
  },

  {
    name = " Stack Up",
    cmd = dap.up,
    rtxt = "<leader>dk",
  },

  { name = "separator" },

  -- UI Controls
  {
    name = " Toggle DAP UI",
    cmd = dapui.toggle,
    rtxt = "<leader>du",
  },

  {
    name = " Evaluate Expression",
    cmd = dapui.eval,
    rtxt = "<leader>de",
  },

  {
    name = " Toggle REPL",
    cmd = dap.repl.toggle,
    rtxt = "<leader>dR",
  },

  {
    name = " Focus Frame",
    cmd = dap.focus_frame,
    rtxt = "<leader>df",
  },
}
