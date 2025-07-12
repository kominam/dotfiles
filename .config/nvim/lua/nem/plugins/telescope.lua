local finder = require("nem.plugins.telescope.finder")

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local keymap = vim.keymap

    telescope.setup({
      vimgrep_arguments = {
        'rg',
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case',
        '--hidden',
        '--glob=!.git/',
      },
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
          },
        },
        file_ignore_patterns = {
          ".DS_Store",
        },
      },
      pickers = {
        find_files = {
          hidden = true,
          theme = "dropdown",
        },
        live_grep = {
          only_sort_text = true,
        },
        grep_string = {
          only_sort_text = true,
        },
        buffers = {
          initial_mode = "normal",
          mapping = {
            i = {
              ["<C-d>"] = actions.delete_buffer,
            },
            n = {
              ["dd"] = actions.delete_buffer,
            },
          },
        },
        git_files = {
          hidden = true,
          show_untracked = true,
          theme = "dropdown",
        },
      },
    })

    telescope.load_extension("fzf")

    keymap.set("n", "<leader>f", function() finder.project_files() end, { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })

    keymap.set("n", "<leader>st", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>sc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })

    keymap.set("n", "<leader>cf", function()
      finder.find_config()
    end, { desc = "Find configuration files", silent = true })

    keymap.set("n", "<leader>sk", "<cmd>Telescope keymaps<cr>", { desc = "Keymaps" })

    -- buffer management
    keymap.set("n", "<leader>b", "<cmd>Telescope buffers previewer=false<cr>", { desc = "List open buffers" })
    keymap.set("n", "<leader>bb", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous" })
    keymap.set("n", "<leader>bn", "<cmd>BufferLineCycleNext<cr>", { desc = "Next" })
  end,
}
