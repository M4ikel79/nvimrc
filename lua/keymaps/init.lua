-- lua/keymaps/init.lua
-- Master keymap loader
-- This file orchestrates loading of all keymap modules
require "nvchad.mappings"
-- Load core editing mappings (uses mini.keymap)
require "keymaps.core"

-- Load plugin-specific mappings (uses vim.keymap.set)
require "keymaps.lsp"
require "keymaps.git"
require "keymaps.term"
require "keymaps.colors"
require "keymaps.plugins"

-- Load utility functions
local utils = require "keymaps.utils"

-- Export utilities for use elsewhere
return utils
