return {
  "mg979/vim-visual-multi",
  branch = "master",
  event = "VeryLazy", -- Better than keys for this plugin
  init = function()
    -- MUST be set before plugin loads
    vim.g.VM_default_mappings = 0
    vim.g.VM_theme = "iceblue"
    vim.g.VM_highlight_matches = "underline"
    vim.g.VM_silent_exit = 1

    -- Custom mappings
    vim.g.VM_maps = {
      -- Find/Select
      ["Find Under"] = "<C-q>",
      ["Find Subword Under"] = "<C-q>",
      ["Select All"] = "\\A", -- Keep default or change if you want
      ["Skip Region"] = "q",
      ["Remove Region"] = "Q",

      -- Navigate between regions
      ["Find Next"] = "n",
      ["Find Prev"] = "N",
      ["Goto Next"] = "]",
      ["Goto Prev"] = "[",

      -- Add cursors vertically
      ["Add Cursor Down"] = "<C-Down>",
      ["Add Cursor Up"] = "<C-Up>",
      ["Add Cursor At Pos"] = "\\\\",

      -- Visual mode
      ["Visual Regex"] = "\\/",
      ["Visual All"] = "\\A",
      ["Visual Add"] = "\\a",
      ["Visual Find"] = "\\f",
      ["Visual Cursors"] = "\\c",

      -- Alignment
      ["Align"] = "\\a",
      ["Align Char"] = "\\<",
      ["Align Regex"] = "\\>",

      -- Case conversion
      ["Switch Case"] = "\\C",

      -- Selection expansion
      ["Select l"] = "<S-Right>",
      ["Select h"] = "<S-Left>",

      -- Undo/Redo
      ["Undo"] = "u",
      ["Redo"] = "<C-r>",
    }

    -- Mouse support (optional)
    vim.g.VM_mouse_mappings = 1

    -- Other settings
    vim.g.VM_show_warnings = 1
    vim.g.VM_set_statusline = 0 -- Let your statusline plugin handle it
  end,
}
