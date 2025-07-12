return {
  "olimorris/codecompanion.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    enabled = true,
    display = {
      chat = {
        window = {
          position = "right",
          width = 100,
        },
      },
    },
    strategies = {
      chat = {
        adapter = "copilot",
        model = "claude-sonnet-4-20250514",
      },
      agent = {
        adapter = "copilot",
      },
      inline = {
        adapter = "copilot"
      }
    },
  },
  keys = {
    {
      "<leader>aa",
      "<cmd>CodeCompanionActions<cr>",
      mode = { "n", "v" },
      noremap = true,
      silent = true,
      desc = "CodeCompanion actions",
    },
    {
      "<leader>ac",
      "<cmd>CodeCompanionChat Toggle<cr>",
      mode = { "n", "v" },
      noremap = true,
      silent = true,
      desc = "CodeCompanion chat",
    },
    {
      "<leader>ai",
      "<cmd>CodeCompanionInline Toggle<cr>",
      mode = { "n", "v" },
      noremap = true,
      silent = true,
      desc = "CodeCompanion inline",
    },
  }
}
