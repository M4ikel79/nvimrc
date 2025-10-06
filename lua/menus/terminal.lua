-- lua/menus/terminal.lua
-- Terminal operations and runners menu

return {
  -- ============================================================================
  -- Open Terminals
  -- ============================================================================
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

  -- ============================================================================
  -- Run Commands
  -- ============================================================================
  {
    name = " Run Current File",
    cmd = function()
      local runners = {
        python = "python3 %",
        javascript = "node %",
        typescript = "ts-node %",
        rust = "cargo run",
        go = "go run %",
        java = "javac % && java %:t:r",
        lua = "lua %",
        sh = "bash %",
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
  {
    name = " Build Project",
    cmd = function()
      local build_cmds = {
        rust = "cargo build",
        go = "go build",
        java = "mvn clean package",
        javascript = "npm run build",
        typescript = "npm run build",
      }
      local ft = vim.bo.filetype
      local cmd = build_cmds[ft]
      if cmd then
        require("nvchad.term").send(cmd, "horizontal")
      elseif vim.fn.filereadable "Makefile" == 1 then
        require("nvchad.term").send("make", "horizontal")
      elseif vim.fn.filereadable "package.json" == 1 then
        require("nvchad.term").send("npm run build", "horizontal")
      else
        vim.notify("No build command found", vim.log.levels.WARN)
      end
    end,
    rtxt = "<leader>tb",
  },
  {
    name = " Run Tests",
    cmd = function()
      local test_cmds = {
        rust = "cargo test",
        go = "go test ./...",
        java = "mvn test",
        javascript = "npm test",
        typescript = "npm test",
        python = "pytest",
      }
      local ft = vim.bo.filetype
      local cmd = test_cmds[ft]
      if cmd then
        require("nvchad.term").send(cmd, "horizontal")
        vim.notify("Running tests...", vim.log.levels.INFO)
      else
        vim.notify("No test command configured", vim.log.levels.WARN)
      end
    end,
    rtxt = "<leader>tt",
  },
  {
    name = " Custom Command",
    cmd = function()
      local cmd = vim.fn.input "Run command: "
      if cmd ~= "" then
        require("nvchad.term").send(cmd, "horizontal")
      end
    end,
    rtxt = "<leader>tR",
  },

  { name = "separator" },

  -- ============================================================================
  -- Quick Tools
  -- ============================================================================
  {
    name = " LazyGit",
    cmd = function()
      require("nvchad.term").send("lazygit", "float")
    end,
    rtxt = "<leader>tg",
  },
  {
    name = " LazyDocker",
    cmd = function()
      require("nvchad.term").send("lazydocker", "float")
    end,
    rtxt = "<leader>td",
  },
  {
    name = " System Monitor",
    cmd = function()
      require("nvchad.term").send("btm", "float")
    end,
    rtxt = "<leader>tn",
  },

  { name = "separator" },

  -- ============================================================================
  -- Live Server
  -- ============================================================================
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

  -- ============================================================================
  -- Floaterm Toggle
  -- ============================================================================
  {
    name = " Floaterm Toggle",
    cmd = "FloatermToggle",
  },
}
