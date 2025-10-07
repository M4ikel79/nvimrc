-- FILE: lua/menus/empty.lua
-- Empty buffer menu - quick navigation

return {
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

  {
    name = " File Explorer",
    cmd = "NvimTreeToggle",
    rtxt = "<C-n>",
  },
  {
    name = " Terminal",
    cmd = function()
      require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
    end,
    rtxt = "<C-\\>",
  },

  { name = "separator" },

  {
    name = " LazyGit",
    cmd = "LazyGit",
    rtxt = "<leader>gg",
  },
}
