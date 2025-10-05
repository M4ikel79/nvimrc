local options = {
  adapters = {
    http = {
      openrouter = function()
        return require("codecompanion.adapters").extend("openai", {
          name = "openrouter",
          url = "https://openrouter.ai/api/v1/chat/completions",
          env = {
            api_key = "OPENROUTER_API_KEY",
          },
          headers = {
            ["HTTP-Referer"] = "https://github.com/M4ikel79",
            ["X-Title"] = "Neovim CodeCompanion",
          },
          schema = {
            model = {
              default = "qwen/qwen3-coder:free",
            },
          },
        })
      end,
    },
  },

  strategies = {
    chat = {
      adapter = "openrouter",
      roles = {
        llm = "Companion",
        user = "You",
      },
    },
    inline = {
      adapter = "openrouter",
    },
    agent = {
      adapter = "openrouter",
    },
  },

  display = {
    chat = {
      window = {
        layout = "vertical",
        width = 0.45,
        height = 0.8,
        relative = "editor",
        border = "rounded",
      },
      intro_message = "Chat with CodeCompanion",
      show_settings = true,
      show_token_count = true,
    },
    inline = {
      layout = "vertical",
    },
  },

  opts = {
    log_level = "ERROR",
  },
}

return options
