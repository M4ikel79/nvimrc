-- Choose ONE of these based on your preference:

-- Option 1: giuxtaposition/blink-cmp-copilot (Recommended)
return {
  "giuxtaposition/blink-cmp-copilot",
  dependencies = {
    "zbirenbaum/copilot.lua",
  },
  opts = {},
  config = function()
    require("blink-cmp-copilot").setup()
  end,
}

-- Option 2: fang2hou/blink-copilot (Alternative with some differences)
-- {
--   "fang2hou/blink-copilot",
--   dependencies = {
--     "zbirenbaum/copilot.lua",
--   },
--   opts = {},
-- }

-- Then add to your blink.cmp sources configuration:
-- In your blink.cmp setup, add this to sources:
--
-- sources = {
--   default = { "lsp", "path", "snippets", "buffer", "copilot" },
--   providers = {
--     copilot = {
--       name = "copilot",
--       module = "blink-cmp-copilot", -- or "blink-copilot" depending on which you chose
--       score_offset = 100, -- Prioritize copilot suggestions
--       async = true,
--     },
--   },
-- }
