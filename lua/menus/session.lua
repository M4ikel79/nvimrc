-- ============================================================================
-- FILE: lua/menus/session.lua
-- DESCRIPTION: Session management menu
-- ============================================================================

return {
  {
    name = " Save Session",
    cmd = function()
      local name = vim.fn.input("Session name: ", "", "file")
      if name ~= "" then
        local session_dir = vim.fn.stdpath "data" .. "/sessions"
        vim.fn.mkdir(session_dir, "p")
        local session_file = session_dir .. "/" .. name .. ".vim"
        vim.cmd("mksession! " .. session_file)
        vim.notify("Session saved: " .. name, vim.log.levels.INFO)
      end
    end,
  },
  {
    name = " Load Session",
    cmd = function()
      local session_dir = vim.fn.stdpath "data" .. "/sessions"
      local sessions = vim.fn.glob(session_dir .. "/*.vim", false, true)
      if #sessions == 0 then
        vim.notify("No sessions found", vim.log.levels.WARN)
        return
      end
      local session_names = {}
      for _, session in ipairs(sessions) do
        table.insert(session_names, vim.fn.fnamemodify(session, ":t:r"))
      end
      vim.ui.select(session_names, { prompt = "Select session:" }, function(choice)
        if choice then
          local session_file = session_dir .. "/" .. choice .. ".vim"
          vim.cmd("source " .. session_file)
          vim.notify("Session loaded: " .. choice, vim.log.levels.INFO)
        end
      end)
    end,
  },

  { name = "separator" },

  {
    name = " Change to Project Root",
    cmd = function()
      local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
      if vim.v.shell_error == 0 then
        vim.cmd("cd " .. git_root)
        vim.notify("Changed to: " .. git_root, vim.log.levels.INFO)
      else
        vim.notify("No git root found", vim.log.levels.WARN)
      end
    end,
  },
}
