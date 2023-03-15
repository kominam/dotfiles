local plugins = {
  { "folke/lazy.nvim", tag = "stable" },
  {
    "folke/which-key.nvim",
    config = true,
  },
  {
    "navarasu/onedark.nvim",
    config = function()
      vim.cmd.colorscheme 'onedark'
    end,
  },
  { "nvim-lua/plenary.nvim", cmd = { "PlenaryBustedFile", "PlenaryBustedDirectory" }, lazy = true },
  {
    "nvim-telescope/telescope.nvim",
    config = true,
    dependencies = { "telescope-fzf-native.nvim" },
    lazy = true,
    cmd = "Telescope",
    endabled = true,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    lazy = true,
    endabled = true,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    endabled = true,
    config = true,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = true,
    cmd = {
      "TSInstall",
      "TSUninstall",
      "TSUpdate",
      "TSUpdateSync",
      "TSInstallInfo",
      "TSInstallSync",
      "TSInstallFromGrammar",
    },
    event = "User FileOpened",
  },
  {
    "kyazdani42/nvim-tree.lua",
    config = true,
    endabled = true,
    cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus", "NvimTreeFindFileToggle" },
  },
  {
    "numToStr/Comment.nvim",
    config = true,
    keys = { { "gc", mode = { "n", "v" } }, { "gb", mode = { "n", "v" } } },
    event = "User FileOpened",
    endabled = true,
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    endabled = true,
  },
  {
    "akinsho/bufferline.nvim",
    config = true,
    branch = "main",
    event = "User FileOpened",
    endabled = true,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function ()
      require("indent_blankline").setup {
        show_end_of_line = true,
        show_current_context = true,
        show_first_indent_level = false,
        show_trailing_blankline_indent = false,
        char = "▏",
        use_treesitter = true,
      }
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    config = true,
    event = "VimEnter",
    enabled = true,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = true,
    event = "User FileOpened",
    cmd = "Gitsigns",
    enabled = true,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    dependencies = "mason-lspconfig.nvim",
  },
  { "jose-elias-alvarez/null-ls.nvim", lazy = true },
  {
    "williamboman/mason.nvim",
    config = true,
    cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
    lazy = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    cmd = { "LspInstall", "LspUninstall" },
    config = true,
    lazy = true,
    dependencies = "mason.nvim",
  },
  {
    "hrsh7th/nvim-cmp",
    config = true,
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "cmp-nvim-lsp",
      "cmp_luasnip",
      "cmp-buffer",
      "cmp-path",
      "cmp-cmdline",
    },
  },
  { "hrsh7th/cmp-nvim-lsp", lazy = true },
  { "saadparwaiz1/cmp_luasnip", lazy = true },
  { "hrsh7th/cmp-buffer", lazy = true },
  { "hrsh7th/cmp-path", lazy = true },
  {
    "hrsh7th/cmp-cmdline",
    lazy = true,
    enabled = true,
  },
  {
    "L3MON4D3/LuaSnip",
    config = true,
    event = "InsertEnter",
    dependencies = {
      "friendly-snippets",
    },
  },
  {
    "rafamadriz/friendly-snippets",
    lazy = true,
  }
}

local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazy_path) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazy_path,
  })
end

vim.opt.rtp:prepend(lazy_path)

require("lazy").setup(plugins)
