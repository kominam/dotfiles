local wk = require("which-key")

local function telescope(provider) return "<CMD>Telescope " .. provider .. "<CR>" end

wk.register {
  ["<Leader>"] = {
    e = { ":NvimTreeToggle<CR>", "Toggle NvimTree" },
    -- telescope
    f = {
      name  = "Find",
      f     = { telescope("find_files")   , "Files"           },
      s     = { telescope("live_grep")    , "Grep"            },
      j     = { telescope("jumplist")     , "Jumps"           },
      h     = { telescope("oldfiles")     , "File history"    },
      fg    = { telescope("git_files")    , "Git files"       },
    },
    b = {
      name  = "Buffer",
      f     = { telescope("buffers")          , "Buffer Files" },
      b     = { "<cmd>BufferLineCyclePrev<cr>", "Previous"     },
      n     = { "<cmd>BufferLineCycleNext<cr>", "Next"         },
    },
    s = { ":w<CR>", "Save buffer" },
    w = { ":q<CR>", "Quit buffer" }
  },
  ["<esc>"] = { ":noh<CR>", "Remove search highlights" },
  -- Window movement
  ["<c-h>"] = { "<c-w>h", "Move to left window" },
  ["<c-j>"] = { "<c-w>j", "Move to down window" },
  ["<c-k>"] = { "<c-w>k", "Move to top window" },
  ["<c-l>"] = { "<c-w>l", "Move to right window" },
  -- Resize window
  ['<C-w><left>'] = { "<C-w><" },
  ['<C-w><right>'] = { "<C-w>>" },
  ['<C-w><up>'] = { "<C-w>+" },
  ['<C-w><down>'] = { "<C-w>-" },
}
