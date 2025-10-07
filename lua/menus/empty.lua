-- lua/menus/empty.lua
-- Menu for empty/new buffers - quick navigation and file creation

return {
  {
    name = " Quick Start",
    title = true,
    hl = "ExBlue",
  },

  { name = "separator" },

  -- File Operations
  {
    name = " New File",
    cmd = "enew",
    rtxt = "<leader>fn",
  },

  {
    name = " Find Files",
    cmd = "Telescope find_files",
    rtxt = "<leader>ff",
  },

  {
    name = " Recent Files",
    cmd = "Telescope oldfiles",
    rtxt = "<leader>fr",
  },

  { name = "separator" },

  -- Navigation
  {
    name = " File Explorer",
    cmd = "NvimTreeToggle",
    rtxt = "<C-n>",
  },

  {
    name = " Buffers",
    cmd = "Telescope buffers",
    rtxt = "<C-p>",
  },

  { name = "separator" },

  -- Project Tools
  {
    name = " LazyGit",
    cmd = "LazyGit",
    rtxt = "<leader>gg",
  },

  {
    name = " Terminal",
    cmd = function()
      require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
    end,
    rtxt = "<C-\\>",
  },

  { name = "separator" },

  -- Quick Templates
  {
    name = "  Create From Template",
    items = {
      {
        name = "Python Script",
        cmd = function()
          vim.api.nvim_buf_set_lines(0, 0, -1, false, {
            "#!/usr/bin/env python3",
            "",
            "def main():",
            "    pass",
            "",
            'if __name__ == "__main__":',
            "    main()",
          })
          vim.bo.filetype = "python"
        end,
      },
      {
        name = "JavaScript/Node",
        cmd = function()
          vim.api.nvim_buf_set_lines(0, 0, -1, false, {
            "#!/usr/bin/env node",
            "",
            "function main() {",
            "  // Your code here",
            "}",
            "",
            "main();",
          })
          vim.bo.filetype = "javascript"
        end,
      },
      {
        name = "Bash Script",
        cmd = function()
          vim.api.nvim_buf_set_lines(0, 0, -1, false, {
            "#!/bin/bash",
            "",
            "set -euo pipefail",
            "",
            "main() {",
            "    # Your code here",
            "    :",
            "}",
            "",
            'main "$@"',
          })
          vim.bo.filetype = "sh"
        end,
      },
      {
        name = "HTML Document",
        cmd = function()
          vim.api.nvim_buf_set_lines(0, 0, -1, false, {
            "<!DOCTYPE html>",
            '<html lang="en">',
            "<head>",
            '    <meta charset="UTF-8">',
            '    <meta name="viewport" content="width=device-width, initial-scale=1.0">',
            "    <title>Document</title>",
            "</head>",
            "<body>",
            "    ",
            "</body>",
            "</html>",
          })
          vim.bo.filetype = "html"
        end,
      },
      {
        name = "Markdown Note",
        cmd = function()
          local date = os.date "%Y-%m-%d"
          vim.api.nvim_buf_set_lines(0, 0, -1, false, {
            "# " .. date,
            "",
            "## Notes",
            "",
            "",
          })
          vim.bo.filetype = "markdown"
        end,
      },
    },
  },

  { name = "separator" },

  -- Session Management
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
}
