-- lua/menus/git.lua
-- Git operations menu with Gitsigns and LazyGit integration

local gitsigns = require "gitsigns"

return {
  {
    name = " Git Operations",
    title = true,
    hl = "ExCyan",
  },

  { name = "separator" },

  -- LazyGit
  {
    name = " Open LazyGit",
    cmd = "LazyGit",
    rtxt = "<leader>gg",
  },

  {
    name = " Git Log",
    cmd = "LazyGitLog",
    rtxt = "<leader>gl",
  },

  { name = "separator" },

  -- Hunk Operations submenu
  {
    name = "󰦖 Hunk Operations",
    items = {
      {
        name = "Stage Hunk",
        cmd = gitsigns.stage_hunk,
        rtxt = "<leader>gs",
      },
      {
        name = "Reset Hunk",
        cmd = gitsigns.reset_hunk,
        rtxt = "<leader>gr",
      },
      {
        name = "Undo Stage Hunk",
        cmd = gitsigns.undo_stage_hunk,
        rtxt = "<leader>gu",
      },
      {
        name = "Preview Hunk",
        cmd = gitsigns.preview_hunk,
        rtxt = "<leader>gp",
      },
      {
        name = "Preview Inline",
        cmd = gitsigns.preview_hunk_inline,
        rtxt = "<leader>gP",
      },
      { name = "separator" },
      {
        name = "Next Hunk",
        cmd = function()
          gitsigns.nav_hunk "next"
        end,
        rtxt = "]h",
      },
      {
        name = "Previous Hunk",
        cmd = function()
          gitsigns.nav_hunk "prev"
        end,
        rtxt = "[h",
      },
    },
  },

  { name = "separator" },

  -- Buffer Operations
  {
    name = " Stage Buffer",
    cmd = gitsigns.stage_buffer,
    rtxt = "<leader>gS",
  },

  {
    name = " Reset Buffer",
    cmd = gitsigns.reset_buffer,
    rtxt = "<leader>gR",
  },

  { name = "separator" },

  -- Blame & Diff submenu
  {
    name = " Blame & Diff",
    items = {
      {
        name = "Blame Line",
        cmd = function()
          gitsigns.blame_line { full = true }
        end,
        rtxt = "<leader>gb",
      },
      {
        name = "Toggle Line Blame",
        cmd = gitsigns.toggle_current_line_blame,
        rtxt = "<leader>gB",
      },
      { name = "separator" },
      {
        name = "Diff This",
        cmd = gitsigns.diffthis,
        rtxt = "<leader>gd",
      },
      {
        name = "Diff This ~",
        cmd = function()
          gitsigns.diffthis "~"
        end,
        rtxt = "<leader>gD",
      },
    },
  },

  { name = "separator" },

  -- Toggle Options submenu
  {
    name = "  Toggle Display",
    items = {
      {
        name = "Toggle Deleted",
        cmd = gitsigns.toggle_deleted,
        rtxt = "<leader>gtd",
      },
      {
        name = "Toggle Word Diff",
        cmd = gitsigns.toggle_word_diff,
        rtxt = "<leader>gtw",
      },
      {
        name = "Toggle Line Highlight",
        cmd = gitsigns.toggle_linehl,
        rtxt = "<leader>gtl",
      },
      {
        name = "Toggle Number Highlight",
        cmd = gitsigns.toggle_numhl,
        rtxt = "<leader>gtn",
      },
      {
        name = "Toggle Signs",
        cmd = gitsigns.toggle_signs,
        rtxt = "<leader>gts",
      },
    },
  },

  { name = "separator" },

  -- Telescope Git Integration
  {
    name = " Browse",
    items = {
      {
        name = "Git Status",
        cmd = "Telescope git_status",
        rtxt = "<leader>gt",
      },
      {
        name = "Git Commits",
        cmd = "Telescope git_commits",
        rtxt = "<leader>gm",
      },
      {
        name = "Buffer Commits",
        cmd = "Telescope git_bcommits",
        rtxt = "<leader>gM",
      },
      {
        name = "Git Branches",
        cmd = "Telescope git_branches",
        rtxt = "<leader>gT",
      },
      {
        name = "Git Stash",
        cmd = "Telescope git_stash",
        rtxt = "<leader>go",
      },
    },
  },
}
