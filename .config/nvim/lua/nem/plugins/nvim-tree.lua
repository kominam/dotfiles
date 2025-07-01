return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")
    local keymap = vim.keymap

    -- Disable netrw completely for better performance
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      auto_reload_on_write = false,
      hijack_netrw = true,
      hijack_cursor = false,
      hijack_unnamed_buffer_when_opening = false,
      reload_on_bufenter = false,
      prefer_startup_root = false,
      sync_root_with_cwd = true,
      respect_buf_cwd = false,
      sort = {
        sorter = "name",
        folders_first = true,
        files_first = false,
      },

      view = {
        width = 30,
        side = "left",
        relativenumber = false,
        signcolumn = "yes",
        debounce_delay = 15,
        centralize_selection = true,
        cursorline = true,
        adaptive_size = false,
        preserve_window_proportions = false,
      },

      renderer = {
        root_folder_label = ":t",
        indent_width = 2,
        add_trailing = false,
        group_empty = false,
        highlight_git = "name",
        highlight_opened_files = "none",
        highlight_modified = "none",
        highlight_diagnostics = "none",
        highlight_bookmarks = "none",
        highlight_clipboard = "name",
        full_name = false,
        special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
        symlink_destination = true,
        indent_markers = {
          enable = false,
          inline_arrows = true,
          icons = {
            corner = "└",
            edge = "│",
            item = "│",
            bottom = "─",
            none = " ",
          },
        },
        icons = {
          webdev_colors = true,
          git_placement = "before",
          padding = " ",
          symlink_arrow = " ➛ ",
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
            modified = false,
            diagnostics = false,
            bookmarks = false,
          },
          glyphs = {
            default = "",
            symlink = "",
            bookmark = "",
            modified = "●",
            folder = {
              arrow_closed = "▸",
              arrow_open = "▾",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "✗",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "U",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },

      -- Disable diagnostics for performance
      diagnostics = {
        enable = false,
        show_on_dirs = false,
        show_on_open_dirs = true,
        debounce_delay = 50,
      },

      git = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
        disable_for_dirs = {},
        timeout = 400,
        cygwin_support = false,
      },

      filesystem_watchers = {
        enable = true,
        debounce_delay = 50,
        ignore_dirs = {},
      },

      actions = {
        use_system_clipboard = true,
        change_dir = {
          enable = true,
          global = false,
          restrict_above_cwd = false,
        },
        expand_all = {
          max_folder_discovery = 300,
          exclude = {},
        },
        file_popup = {
          open_win_config = {
            col = 1,
            row = 1,
            relative = "cursor",
            border = "shadow",
            style = "minimal",
          },
        },
        open_file = {
          quit_on_open = false,
          eject = true,
          resize_window = false,
          window_picker = {
            enable = true,
            picker = "default",
            chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
            exclude = {
              filetype = { "notify", "lazy", "qf", "diff", "fugitive", "fugitiveblame" },
              buftype = { "nofile", "terminal", "help" },
            },
          },
        },
        remove_file = {
          close_window = true,
        },
      },

      update_focused_file = {
        enable = true,
        update_root = {
          enable = true,
          ignore_list = {},
        },
        exclude = false,
      },

      hijack_directories = {
        enable = false,
        auto_open = true,
      },

      filters = {
        enable = true,
        dotfiles = false,
        git_clean = false,
        git_ignored = false,
        no_bookmark = false,
        no_buffer = false,
        custom = { "node_modules", "\\.cache" },
        exclude = {},
      },

      live_filter = {
        prefix = "[FILTER]: ",
        always_show_folders = true,
      },

      notify = {
        threshold = vim.log.levels.INFO,
        absolute_path = true,
      },

      ui = {
        confirm = {
          remove = true,
          trash = true,
          default_yes = false,
        },
      },
    })

    keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
  end,
}
