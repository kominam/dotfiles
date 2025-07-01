return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      separator_style = "thin",
      offset = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          highlight = "Directory",
        }
      },
      enforce_regular_tabs = false,
      always_show_bufferline = false,
      show_close_icon = false,
    },
  },
}
