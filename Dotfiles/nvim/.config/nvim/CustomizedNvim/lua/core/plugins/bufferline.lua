local status_ok, bufferline = pcall(require, 'bufferline')
if not status_ok then
  return
end

bufferline.setup({
  options = {
    mode = 'buffers', -- set to "tabs" to only show tabpages instead
    -- style_preset = bufferline.style_preset.padded_slant,
    numbers = 'ordinal',
    buffer_close_icon = '',
    close_icon = '',
    modified_icon = '●',
    left_trunc_marker = '',
    right_trunc_marker = '',
    --- name_formatter can be used to change the buffer's label in the bufferline.
    name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
      -- remove extension from markdown files for example
      if buf.name:match('%.md') then
        return vim.fn.fnamemodify(buf.name, ':t:r')
      end
    end,
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    tab_size = 10,
    diagnostics = 'nvim_lsp',
    diagnostics_update_in_insert = false,
    -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
    diagnostics_indicator = function(count)
      return '(' .. count .. ')'
    end,
    offsets = { { text_align = 'left' } },

    color_icons = true,       -- whether or not to add the filetype icon highlights
    show_buffer_icons = true, -- disable filetype icons for buffers
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = true,
    sort_by = 'insert_after_current',
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    separator_style = 'slant',
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    groups = {
      options = {
        toggle_hidden_on_enter = true, -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
      },
      items = {
        {
          name = 'Tests',                                    -- Mandatory
          highlight = { gui = 'underline', guisp = 'blue' }, -- Optional
          priority = 2,                                      -- determines where it will appear relative to other groups (Optional)
          icon = '',                                      -- Optional
          matcher = function(buf)                            -- Mandatory
            return buf.name:match('%_test') or buf.name:match('%_spec')
          end,
        },
        {
          name = 'Docs',
          highlight = { gui = 'undercurl', guisp = 'green' },
          auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
          matcher = function(buf)
            return buf.name:match('%.md') or buf.name:match('%.txt')
          end,
          separator = { -- Optional
            style = require('bufferline.groups').separator.tab,
          },
        },
      },
    },
  },
})
