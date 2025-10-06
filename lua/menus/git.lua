-- lua/menus/git.lua
-- Git operations menu (LazyGit + Gitsigns)

return {
  -- ============================================================================
  -- LazyGit
  -- ============================================================================
  {
    name = " LazyGit",
    cmd = "LazyGit",
    rtxt = "<leader>gg",
  },
  {
    name = " LazyGit (Tab)",
    cmd = "tabnew | LazyGit",
    rtxt = "<leader>gG",
  },
  {
    name = " Git Log",
    cmd = "LazyGitLog",
    rtxt = "<leader>gl",
  },
  {
    name = " File History",
    cmd = "LazyGitFilterCurrentFile",
    rtxt = "<leader>gf",
  },

  { name = "separator" },

  -- ============================================================================
  -- Hunk Operations
  -- ============================================================================
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
  {
    name = " Undo Stage Hunk",
    cmd = function()
      require("gitsigns").undo_stage_hunk()
    end,
    rtxt = "<leader>gu",
  },

  { name = "separator" },

  -- ============================================================================
  -- Buffer Operations
  -- ============================================================================
  {
    name = " Stage Buffer",
    cmd = function()
      require("gitsigns").stage_buffer()
    end,
    rtxt = "<leader>gS",
  },
  {
    name = " Reset Buffer",
    cmd = function()
      require("gitsigns").reset_buffer()
    end,
    rtxt = "<leader>gR",
  },

  { name = "separator" },

  -- ============================================================================
  -- Blame & Diff
  -- ============================================================================
  {
    name = " Blame Line",
    cmd = function()
      require("gitsigns").blame_line { full = true }
    end,
    rtxt = "<leader>gb",
  },
  {
    name = " Toggle Line Blame",
    cmd = function()
      require("gitsigns").toggle_current_line_blame()
    end,
    rtxt = "<leader>gB",
  },
  {
    name = " Diff This",
    cmd = function()
      require("gitsigns").diffthis()
    end,
    rtxt = "<leader>gd",
  },
  {
    name = " Diff This ~",
    cmd = function()
      require("gitsigns").diffthis "~"
    end,
    rtxt = "<leader>gD",
  },

  { name = "separator" },

  -- ============================================================================
  -- Navigation
  -- ============================================================================
  {
    name = " Next Hunk",
    cmd = function()
      require("gitsigns").nav_hunk "next"
    end,
    rtxt = "]h",
  },
  {
    name = " Previous Hunk",
    cmd = function()
      require("gitsigns").nav_hunk "prev"
    end,
    rtxt = "[h",
  },

  { name = "separator" },

  -- ============================================================================
  -- Telescope Git
  -- ============================================================================
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
  {
    name = " Buffer Commits",
    cmd = "Telescope git_bcommits",
    rtxt = "<leader>gM",
  },
  {
    name = " Git Branches",
    cmd = "Telescope git_branches",
    rtxt = "<leader>gT",
  },
  {
    name = " Git Stash",
    cmd = "Telescope git_stash",
    rtxt = "<leader>go",
  },

  { name = "separator" },

  -- ============================================================================
  -- Toggle Options
  -- ============================================================================
  {
    name = " Toggles",
    items = {
      {
        name = "Toggle Deleted Lines",
        cmd = function()
          require("gitsigns").toggle_deleted()
        end,
        rtxt = "<leader>gtd",
      },
      {
        name = "Toggle Word Diff",
        cmd = function()
          require("gitsigns").toggle_word_diff()
        end,
        rtxt = "<leader>gtw",
      },
      {
        name = "Toggle Line Highlight",
        cmd = function()
          require("gitsigns").toggle_linehl()
        end,
        rtxt = "<leader>gtl",
      },
      {
        name = "Toggle Number Highlight",
        cmd = function()
          require("gitsigns").toggle_numhl()
        end,
        rtxt = "<leader>gtn",
      },
      {
        name = "Toggle Signs",
        cmd = function()
          require("gitsigns").toggle_signs()
        end,
        rtxt = "<leader>gts",
      },
    },
  },
}
