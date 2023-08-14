local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
  return
end

lualine.setup(
  {
    options = {
      icons_enabled = true,
      theme = 'auto',
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
      disabled_filetypes = {
        statusline = {},
        winbar = {},
        dashboard = {},
        alpha = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = true,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      }
    },
    sections = {
      lualine_a = {
        {
          'mode',
          icons_enabled = true, -- Enables the display of icons alongside the component.
          -- icon = { '', align = 'right', color = { fg = 'green' } },
          separator = { left = '', right = '' },
          cond = nil,         -- Condition function, the component is loaded when the function returns `true`.
          draw_empty = false, -- Whether to draw component even if it's empty. Might be useful if you want just the separator.
          color = nil,        -- The default is your theme's color for that section and mode.
          -- color = { fg = '#ffaa88', bg = 'grey', gui='italic,bold' },
          padding = { left = 1, right = 1 },
        }
      },
      lualine_b = {
        {
          'branch',
          separator = { left = '', right = '' },
        },
        -- {
        --   'buffers',
        --
        -- separator = { left = '', right = '' },
        --   show_filename_only = true,       -- Shows shortened relative path when set to false.
        --   hide_filename_extension = false, -- Hide filename extension when set to true.
        --   show_modified_status = true,     -- Shows indicator when the buffer is modified.
        --   mode = 0,                        -- 0: Shows buffer name
        --   -- 1: Shows buffer index
        --   -- 2: Shows buffer name + buffer index
        --   -- 3: Shows buffer number
        --   -- 4: Shows buffer name + buffer number
        --   max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
        --   -- filetype_names = {
        --   --   TelescopePrompt = 'Telescope',
        --   --   dashboard = 'Dashboard',
        --   --   packer = 'Packer',
        --   --   fzf = 'FZF',
        --   --   alpha = 'Alpha'
        --   -- }, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )
        --   --
        --   -- buffers_color = {
        --   --   active = {
        --   --     fg = 'blue',
        --   --     bg = 'red'
        --   --   },
        --   --   inactive = {
        --   --     fg = 'blue',
        --   --     bg = 'green'
        --   --   },
        --   -- },
        --   symbols = {
        --     modified = ' U',       -- Text to show when the buffer is modified
        --     alternate_file = '#', -- Text to show to identify the alternate file
        --     directory = '',    -- Text to show when the buffer is a directory
        --   },
        -- },
        {
          'diff',
          separator = { left = '', right = '' },
          colored = true, -- Displays a colored diff status if set to true
          -- diff_color = {
          --   -- Same color values as the general color option can be used here.
          --   added    = 'DiffAdd',                             -- Changes the diff's added color
          --   modified = 'DiffChange',                          -- Changes the diff's modified color
          --   removed  = 'DiffDelete',                          -- Changes the diff's removed color you
          -- },
          symbols = { added = '+', modified = '~', removed = '-' }, -- Changes the symbols used by the diff.
          source = nil,                                             -- A function that works as a data source for diff.
          -- It must return a table as such:
          --   { added = add_count, modified = modified_count, removed = removed_count }
          -- or nil on failure. count <= 0 won't be displayed.
        },
        {
          'diagnostics',
          sections = { 'error', 'warn', 'info', 'hint' },
          diagnostics_color = {
            error = 'DiagnosticError', -- Changes diagnostics' error color.
            warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
            info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
            hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
          },
          colored = true,              -- Displays diagnostics status in color if set to true.
          symbols = { error = 'E:', warn = 'W:', info = 'I:', hint = 'H:' },
          update_in_insert = false,    -- Update diagnostics in insert mode.
          always_visible = false,      -- Show diagnostics even if there are none.
        }
      },
      lualine_c = {
        {
          'filename',
          -- separator = { left = '', right = '' },
          file_status = true,     -- Displays file status (readonly status, modified status)
          newfile_status = false, -- Display new file status (new file means no write after created)
          path = 0,               -- 0: Just the filename
          -- 1: Relative path
          -- 2: Absolute path
          -- 3: Absolute path, with tilde as the home directory
          -- 4: Filename and parent dir, with tilde as the home directory
          shorting_target = 40, -- Shortens path to leave 40 spaces in the window
          -- for other components. (terrible name, any suggestions?)
          symbols = {
            modified = '[+]',      -- Text to show when the file is modified.
            readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
            unnamed = '[No Name]', -- Text to show for unnamed buffers.
            newfile = '[New]',     -- Text to show for newly created file before first write
          }
        }
      },
      lualine_x = {
        {
          'filetype',
          colored = true,    -- Displays filetype icon in color if set to true
          icon_only = false, -- Display only an icon for filetype
          -- icon = { align = 'right' }, -- Display filetype icon on the right hand side
          -- icon =    {'X', align='right'}
          -- Icon string ^ in table is ignored in filetype component
        }
      },
      lualine_y = {
        {
          'progress',
          separator = { left = '', right = '' },
        },
      },
      lualine_z = {
        {
          'location',
          separator = { left = '', right = '' },
        },
      },
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = { "fzf", "lazy", "fugitive", "man", "neo-tree", "toggleterm", "trouble" },
  }
)
