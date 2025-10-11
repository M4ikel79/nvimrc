return {
  "stevearc/aerial.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    -- Priority list of preferred backends for aerial
    backends = { "treesitter", "lsp", "markdown", "asciidoc", "man" },

    layout = {
      max_width = { 40, 0.2 }, -- Max 40 columns or 20% of screen
      width = nil,
      min_width = 20,
      win_opts = {},
      default_direction = "prefer_right",
      placement = "window",
      resize_to_content = true,
      preserve_equality = false,
    },

    attach_mode = "window",

    -- Close aerial automatically when switching buffers
    close_automatic_events = { "unsupported" },

    -- Keymaps in aerial window
    keymaps = {
      ["?"] = "actions.show_help",
      ["<CR>"] = "actions.jump",
      ["<2-LeftMouse>"] = "actions.jump",
      ["<C-v>"] = "actions.jump_vsplit",
      ["<C-s>"] = "actions.jump_split",
      ["p"] = "actions.scroll",
      ["<C-j>"] = "actions.down_and_scroll",
      ["<C-k>"] = "actions.up_and_scroll",
      ["{"] = "actions.prev",
      ["}"] = "actions.next",
      ["[["] = "actions.prev_up",
      ["]]"] = "actions.next_up",
      ["q"] = "actions.close",
      ["o"] = "actions.tree_toggle",
      ["za"] = "actions.tree_toggle",
      ["O"] = "actions.tree_toggle_recursive",
      ["zA"] = "actions.tree_toggle_recursive",
      ["l"] = "actions.tree_open",
      ["zo"] = "actions.tree_open",
      ["L"] = "actions.tree_open_recursive",
      ["zO"] = "actions.tree_open_recursive",
      ["h"] = "actions.tree_close",
      ["zc"] = "actions.tree_close",
      ["H"] = "actions.tree_close_recursive",
      ["zC"] = "actions.tree_close_recursive",
      ["zr"] = "actions.tree_increase_fold_level",
      ["zR"] = "actions.tree_open_all",
      ["zm"] = "actions.tree_decrease_fold_level",
      ["zM"] = "actions.tree_close_all",
      ["zx"] = "actions.tree_sync_folds",
    },

    lazy_load = true,

    -- Disable aerial on very large files
    disable_max_lines = 10000,
    disable_max_size = 2000000, -- 2MB

    -- Filter which symbols to show
    filter_kind = {
      "Class",
      "Constructor",
      "Enum",
      "Function",
      "Interface",
      "Module",
      "Method",
      "Struct",
      "Variable", -- Added for more visibility
      "Constant", -- Added for more visibility
    },

    -- Highlight settings
    highlight_mode = "split_width",
    highlight_closest = true,
    highlight_on_hover = false,
    highlight_on_jump = 300,

    -- Don't jump automatically when moving cursor
    autojump = false,

    -- Use nerd font icons
    nerd_font = "auto",

    -- Manage code folding based on symbol tree
    manage_folds = false,
    link_folds_to_tree = false,
    link_tree_to_folds = true,

    -- Center cursor after jumping to symbol
    post_jump_cmd = "normal! zz",

    -- Don't close on select
    close_on_select = false,

    -- Show tree guides
    show_guides = true,
    guides = {
      mid_item = "├─",
      last_item = "└─",
      nested_top = "│ ",
      whitespace = "  ",
    },

    -- Float window settings
    float = {
      border = "rounded",
      relative = "cursor",
      max_height = 0.9,
      height = nil,
      min_height = { 8, 0.1 },
    },

    -- Nav window settings (floating preview)
    nav = {
      border = "rounded",
      max_height = 0.9,
      min_height = { 10, 0.1 },
      max_width = 0.5,
      min_width = { 0.2, 20 },
      win_opts = {
        cursorline = true,
        winblend = 10,
      },
      autojump = false,
      preview = true, -- Show code preview
      keymaps = {
        ["<CR>"] = "actions.jump",
        ["<2-LeftMouse>"] = "actions.jump",
        ["<C-v>"] = "actions.jump_vsplit",
        ["<C-s>"] = "actions.jump_split",
        ["h"] = "actions.left",
        ["l"] = "actions.right",
        ["<C-c>"] = "actions.close",
        ["q"] = "actions.close",
      },
    },

    lsp = {
      diagnostics_trigger_update = false,
      update_when_errors = true,
      update_delay = 300,
    },

    treesitter = {
      update_delay = 300,
    },
  },

  config = function(_, opts)
    require("aerial").setup(opts)

    -- Global keymaps
    local keymap = vim.keymap.set

    -- Toggle aerial window
    keymap("n", "<leader>a", "<cmd>AerialToggle!<CR>", { desc = "Aerial Toggle" })

    -- Open aerial in float
    keymap("n", "<leader>af", "<cmd>AerialToggle float<CR>", { desc = "Aerial Float" })

    -- Navigate symbols in current buffer
    keymap("n", "{", "<cmd>AerialPrev<CR>", { desc = "Aerial Prev" })
    keymap("n", "}", "<cmd>AerialNext<CR>", { desc = "Aerial Next" })

    -- Jump up in symbol tree
    keymap("n", "[[", "<cmd>AerialPrevUp<CR>", { desc = "Aerial Prev Up" })
    keymap("n", "]]", "<cmd>AerialNextUp<CR>", { desc = "Aerial Next Up" })

    -- Open aerial nav (floating preview window)
    keymap("n", "<leader>an", "<cmd>AerialNavToggle<CR>", { desc = "Aerial Nav" })

    -- Info command
    keymap("n", "<leader>ai", "<cmd>AerialInfo<CR>", { desc = "Aerial Info" })

    -- Telescope integration (if available)
    local has_telescope, telescope = pcall(require, "telescope")
    if has_telescope then
      telescope.load_extension "aerial"
      keymap("n", "<leader>as", "<cmd>Telescope aerial<CR>", { desc = "Aerial Search (Telescope)" })
    end
  end,
}
