require('core.options')
require("core.keymaps")
require('core.functions')
require('core.autocmd')



local plugins = {
  -- Plugin manager ----
  'lazy',
  -- Dependencies ----
  'plenary',
  'nvim-web-devicons',
  -- Theme ----
  'catppuccin',
  -- Lsp
  'lsp-zero',
  -- Autocompletion
  'nvim-cmp',
  -- Formatting
  'null-ls',
  -- Github copilot
  'copilot',




  -- File explorer ----
  'neotree',
  -- Finder ----
  'telescope',
  -- Highlighting ----
  'treesitter',
  -- Key finder helper
  'which-key',


  -- Auto pair brackets
  'autopairs',
  -- Jump fast Search in file
  'leap',
  -- Comment fast
  'comment',
  -- Status bar
  'lualine',
  -- Indent lines
  'indentline',
  -- bufferline
  'bufferline',
  -- Terminal integration
  -- 'toggleterm',
  -- colorizer
  'colorizer',

}

-- Load plugins and display errors
local errors = {}
local error_plugins = {}
for _, plugin in pairs(plugins) do
  local status_ok, err_msg = pcall(require, 'core.plugins.' .. plugin)
  if not status_ok then
    table.insert(errors, err_msg)
    table.insert(error_plugins, plugin)
  end
end
for i, err_msg in pairs(errors) do
  vim.notify(err_msg, vim.log.levels.ERROR, {
    title = 'Error loading : ' .. error_plugins[i],
  })
end
