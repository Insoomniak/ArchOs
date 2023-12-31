local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
  return
end

local actions = require('telescope.actions')

telescope.setup({
  defaults = {
    layout_config = {
      bottom_pane = {
        height = 0.5,
        preview_width = 0.6,
        preview_cutoff = 120,
        prompt_position = 'top',
      },
      center = {
        height = 0.4,
        preview_cutoff = 40,
        prompt_position = 'top',
        width = 0.9,
      },
      cursor = {
        height = 0.9,
        preview_cutoff = 40,
        preview_width = 0.6,
        width = 0.9,
      },
      horizontal = {
        height = 0.9,
        width = 0.95,
        preview_width = 0.7,
        preview_cutoff = 120,
        prompt_position = 'top',
      },
      vertical = {
        height = 0.9,
        preview_cutoff = 40,
        prompt_position = 'bottom',
        width = 0.9,
      },
      -- other layout configuration here
    },
    prompt_prefix = ' ',
    selection_caret = ' ',
    path_display = { 'smart' },

    mappings = {
      n = {
        ['q'] = actions.close,
        ['<esc>'] = actions.close,
        ['<CR>'] = actions.select_default,
        -- ['<C-x>'] = actions.select_horizontal,
        ['v'] = actions.select_vertical,
        ['t'] = actions.select_tab,
        -- ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
        -- ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
        -- ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
        -- ['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
        ['i'] = actions.move_selection_previous,
        ['k'] = actions.move_selection_next,
        -- ['I'] = actions.move_to_top,
        -- ['K'] = actions.move_to_bottom,

        -- ['<Down>'] = actions.move_selection_next,
        -- ['<Up>'] = actions.move_selection_previous,


        ['I'] = actions.preview_scrolling_up,
        ['K'] = actions.preview_scrolling_down,

        -- ['<PageUp>'] = actions.results_scrolling_up,
        -- ['<PageDown>'] = actions.results_scrolling_down,

        ['?'] = actions.which_key,
      },
      i = {
        -- ['<esc>'] = actions.close,
        -- ['<C-n>'] = actions.cycle_history_next,
        -- ['<C-p>'] = actions.cycle_history_prev,

        -- ['<C-j>'] = actions.move_selection_next,
        -- ['<C-k>'] = actions.move_selection_previous,

        -- ['<C-c>'] = actions.close,

        -- ['<Down>'] = actions.move_selection_next,
        -- ['<Up>'] = actions.move_selection_previous,

        -- ['<CR>'] = actions.select_default,
        -- ['<C-x>'] = actions.select_horizontal,
        -- ['<C-v>'] = actions.select_vertical,
        -- ['<C-t>'] = actions.select_tab,

        -- ['<C-u>'] = actions.preview_scrolling_up,
        -- ['<C-d>'] = actions.preview_scrolling_down,

        -- ['<PageUp>'] = actions.results_scrolling_up,
        -- ['<PageDown>'] = actions.results_scrolling_down,

        -- ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
        -- ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
        -- ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
        -- ['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
        -- ['<C-l>'] = actions.complete_tag,
        -- ['<C-_>'] = actions.which_key, -- keys from pressing <C-/>
        -- -- custom hop loop to multi selects and sending selected entries to quickfix list
      },

    },
  },
  extensions = {
    file_browser = {
      theme = 'ivy',
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ['i'] = {
          -- your custom insert mode mappings
        },
        ['n'] = {
          -- your custom normal mode mappings
        },
      },
    },
    fzf = {
      fuzzy = true,                         -- false will only do exact matching
      override_generic_sorter = true,       -- override the generic sorter
      override_file_sorter = true,          -- override the file sorter
      case_mode = 'smart_case',             -- or "ignore_case" or "respect_case"
    },
    hop = {
      -- the shown `keys` are the defaults, no need to set `keys` if defaults work for you ;)
      keys = {
        'a',
        's',
        'd',
        'f',
        'g',
        'h',
        'j',
        'k',
        'l',
        ';',
        'q',
        'w',
        'e',
        'r',
        't',
        'y',
        'u',
        'i',
        'o',
        'p',
        'A',
        'S',
        'D',
        'F',
        'G',
        'H',
        'J',
        'K',
        'L',
        ':',
        'Q',
        'W',
        'E',
        'R',
        'T',
        'Y',
        'U',
        'I',
        'O',
        'P',
      },
      -- Highlight groups to link to signs and lines; the below configuration refers to demo
      -- sign_hl typically only defines foreground to possibly be combined with line_hl
      sign_hl = { 'WarningMsg', 'Title' },
      -- optional, typically a table of two highlight groups that are alternated between
      line_hl = { 'CursorLine', 'Normal' },
      -- options specific to `hop_loop`
      -- true temporarily disables Telescope selection highlighting
      clear_selection_hl = false,
      -- highlight hopped to entry with telescope selection highlight
      -- note: mutually exclusive with `clear_selection_hl`
      trace_entry = true,
      -- jump to entry where hoop loop was started from
      reset_selection = true,
    },
    frecency = {
      -- db_root = "home/my_username/path/to/db_root",
      show_scores = false,
      show_unindexed = true,
      ignore_patterns = { '*.git/*', '*/tmp/*' },
      disable_devicons = false,
      -- workspaces = {
      --   ["Projects"] = "/home/abhishek/Projects",
      -- }
    },
  },
})
