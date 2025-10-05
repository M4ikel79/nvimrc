-- lua/plugins/visual-multi.lua
return {
  "mg979/vim-visual-multi",
  branch = "master",
  event = "VeryLazy",
  init = function()
    vim.g.VM_default_mappings = 0
    vim.g.VM_theme = "iceblue"
    vim.g.VM_highlight_matches = "underline"
    vim.g.VM_silent_exit = 1
    vim.g.VM_maps = {
      ["Find Under"] = "<C-q>",
      ["Find Subword Under"] = "<C-q>",
      ["Select All"] = "\\A",
      ["Skip Region"] = "q",
      ["Remove Region"] = "Q",
      ["Find Next"] = "n",
      ["Find Prev"] = "N",
      ["Goto Next"] = "]",
      ["Goto Prev"] = "[",
      ["Add Cursor Down"] = "<C-Down>",
      ["Add Cursor Up"] = "<C-Up>",
      ["Add Cursor At Pos"] = "\\\\",
      ["Visual Regex"] = "\\/",
      ["Visual All"] = "\\A",
      ["Visual Add"] = "\\a",
      ["Visual Find"] = "\\f",
      ["Visual Cursors"] = "\\c",
      ["Align"] = "\\a",
      ["Align Char"] = "\\<",
      ["Align Regex"] = "\\>",
      ["Switch Case"] = "\\C",
      ["Select l"] = "<S-Right>",
      ["Select h"] = "<S-Left>",
      ["Undo"] = "u",
      ["Redo"] = "<C-r>",
    }
    vim.g.VM_mouse_mappings = 1
    vim.g.VM_show_warnings = 1
    vim.g.VM_set_statusline = 0
  end,
}
