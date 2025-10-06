-- lua/menus/session.lua
-- Session management and workspace menu

return {
  -- ============================================================================
  -- Session Operations
  -- ============================================================================
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
        local session_name = vim.fn.fnamemodify(session, ":t:r")
        table.insert(session_names, session_name)
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
  {
    name = " Delete Session",
    cmd = function()
      local session_dir = vim.fn.stdpath "data" .. "/sessions"
      local sessions = vim.fn.glob(session_dir .. "/*.vim", false, true)

      if #sessions == 0 then
        vim.notify("No sessions found", vim.log.levels.WARN)
        return
      end

      local session_names = {}
      for _, session in ipairs(sessions) do
        local session_name = vim.fn.fnamemodify(session, ":t:r")
        table.insert(session_names, session_name)
      end

      vim.ui.select(session_names, { prompt = "Delete session:" }, function(choice)
        if choice then
          local session_file = session_dir .. "/" .. choice .. ".vim"
          vim.fn.delete(session_file)
          vim.notify("Session deleted: " .. choice, vim.log.levels.INFO)
        end
      end)
    end,
  },

  { name = "separator" },

  -- ============================================================================
  -- Workspace
  -- ============================================================================
  {
    name = " Change to Project Root",
    cmd = function()
      local function get_git_root()
        local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
        if vim.v.shell_error == 0 then
          return git_root
        end
        return nil
      end

      local function get_project_root()
        local git_root = get_git_root()
        if git_root then
          return git_root
        end

        local markers = { "package.json", "Cargo.toml", "go.mod", "pom.xml", "Makefile" }
        local current_dir = vim.fn.expand "%:p:h"

        while current_dir ~= "/" do
          for _, marker in ipairs(markers) do
            if vim.fn.filereadable(current_dir .. "/" .. marker) == 1 then
              return current_dir
            end
          end
          current_dir = vim.fn.fnamemodify(current_dir, ":h")
        end
        return nil
      end

      local root = get_project_root()
      if root then
        vim.cmd("cd " .. root)
        vim.notify("Changed to: " .. root, vim.log.levels.INFO)
      else
        vim.notify("No project root found", vim.log.levels.WARN)
      end
    end,
  },
  {
    name = " Change Directory",
    cmd = function()
      local dir = vim.fn.input("Change to: ", vim.fn.getcwd(), "dir")
      if dir ~= "" then
        vim.cmd("cd " .. dir)
        vim.notify("Changed to: " .. dir, vim.log.levels.INFO)
      end
    end,
  },
  {
    name = " Show Current Directory",
    cmd = function()
      vim.notify("Current: " .. vim.fn.getcwd(), vim.log.levels.INFO)
    end,
  },

  { name = "separator" },

  -- ============================================================================
  -- Workspace Folders (LSP)
  -- ============================================================================
  {
    name = " Add Workspace Folder",
    cmd = vim.lsp.buf.add_workspace_folder,
    rtxt = "<leader>wa",
  },
  {
    name = " Remove Workspace Folder",
    cmd = vim.lsp.buf.remove_workspace_folder,
    rtxt = "<leader>wr",
  },
  {
    name = " List Workspace Folders",
    cmd = function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end,
    rtxt = "<leader>wl",
  },

  { name = "separator" },

  -- ============================================================================
  -- Project Files
  -- ============================================================================
  {
    name = " Find Project Files",
    cmd = "Telescope find_files",
    rtxt = "<leader>ff",
  },
  {
    name = " Search in Project",
    cmd = "Telescope live_grep",
    rtxt = "<leader>fw",
  },
}
