-- ============================================================================
-- FILE: lua/menus/git.lua
-- DESCRIPTION: Git operations menu
-- ============================================================================

return {
  -- LazyGit
  {
    name = " LazyGit",
    cmd = "LazyGit",
    rtxt = "<leader>gg",
  },
  {
    name = " Git Log",
    cmd = "LazyGitLog",
    rtxt = "<leader>gl",
  },

  { name = "separator" },

  -- Hunk Operations
  {
    name = " Stage Hunk",
    cmd = function()
      require("gitsigns").stage_hunk()
    end,
    rtxt = "<leader>gs",
  },
  {
    name = " Reset Hunk",
    cmd = function()
      require("gitsigns").reset_hunk()
    end,
    rtxt = "<leader>gr",
  },
  {
    name = " Preview Hunk",
    cmd = function()
      require("gitsigns").preview_hunk()
    end,
    rtxt = "<leader>gp",
  },

  { name = "separator" },

  -- Blame & Diff
  {
    name = " Blame Line",
    cmd = function()
      require("gitsigns").blame_line { full = true }
    end,
    rtxt = "<leader>gb",
  },
  {
    name = " Diff This",
    cmd = function()
      require("gitsigns").diffthis()
    end,
    rtxt = "<leader>gd",
  },

  { name = "separator" },

  -- Telescope Git
  {
    name = " Git Status",
    cmd = "Telescope git_status",
    rtxt = "<leader>gt",
  },
  {
    name = " Git Commits",
    cmd = "Telescope git_commits",
    rtxt = "<leader>gm",
  },
}
