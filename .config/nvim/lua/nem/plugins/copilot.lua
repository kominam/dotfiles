return {
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        accept = "<Tab>",
        next = "<C-n>",
        prev = "<C-p>",
        dismiss = "<C-e>",
      },
    },
    panel = {
      enabled = false, -- Disable the Copilot panel
    },
  }
}
