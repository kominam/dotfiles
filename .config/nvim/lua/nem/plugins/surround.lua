return {
  "kylechui/nvim-surround",
  event = { "BufReadPre", "BufNewFile" },
  version = "^3.0.0",
  config = function()
    require("nvim-surround").setup({
      keymaps = {
        normal = "ys",
        normal_line = "yss",
        visual = "S",
        visual_line = "yS",
        delete = "ds",
        change = "cs",
      },
      aliases = {
        ["b"] = { "(", ")" },
        ["B"] = { "{", "}" },
        ["p"] = { "[", "]" },
        ["q"] = { '"', '"' },
        ["Q"] = { "'", "'" },
      },
    })
  end,
}
