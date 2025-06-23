return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      "                                           ",
      "  ███╗   ██╗███████╗██╗███╗   ███╗         ",
      "  ████╗  ██║██╔════╝██║████╗ ████║         ",
      "  ██╔██╗ ██║█████╗  ██║██╔████╔██║         ",
      "  ██║╚██╗██║██╔══╝  ██║██║╚██╔╝██║         ",
      "  ██║ ╚████║███████╗██║██║ ╚═╝ ██║         ",
      "  ╚═╝  ╚═══╝╚══════╝╚═╝╚═╝     ╚═╝         ",
      "                                           ",
    }

    dashboard.section.buttons.val = {
      dashboard.button("e", "  File explorer", ":NvimTreeToggle <CR>"),
      dashboard.button("f", "  Find file", ":Telescope git_files <CR>"),
      dashboard.button("r", "  Recent files", ":Telescope oldfiles <CR>"),
      dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
      dashboard.button("q", "  Quit", ":qa <CR>"),
    }

    alpha.setup(dashboard.opts)
  end,
}
