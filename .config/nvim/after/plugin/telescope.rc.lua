local status, telescope = pcall(require, 'telescope')
if (not status) then return end

telescope.setup {
  defaults = {
    initial_mode = 'insert',
    selection_strategy = 'reset',
    sorting_strategy = nil,
    layout_strategy = nil,
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
    path_display = { 'smart' },
    color_devicons = true,
  },
  pickers = {
    find_files = {
    },
    live_grep = {
      only_sort_text = true,
    },
    grep_string = {
      only_sort_text = true,
    },
    git_files = {
      hidden = true,
      show_untracked = true,
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = 'smart_case',
      },
    },
  }
}

telescope.load_extension('fzf')
