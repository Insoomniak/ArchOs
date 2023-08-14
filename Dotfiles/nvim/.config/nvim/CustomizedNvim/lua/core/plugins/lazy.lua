local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system(
    { "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath })
end
vim.opt.rtp:prepend(lazypath)

local status_ok, lazy = pcall(require, 'lazy')
if not status_ok then
  return
end

local plugins = {
  -- Dependencies ----
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-tree/nvim-web-devicons' },
  { 'MunifTanjim/nui.nvim' },
  -- Theme ----
  { 'catppuccin/nvim' },
  -- Lsp
  {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'folke/trouble.nvim',
      'Maan2003/lsp_lines.nvim',
      'ray-x/lsp_signature.nvim',
      'glepnir/lspsaga.nvim',
    },
    lazy = true,
  },

  -- Completion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
    },
  },
  -- for formatters and linters
  { "jose-elias-alvarez/null-ls.nvim" },
  -- File explorer ----
  { 'nvim-neo-tree/neo-tree.nvim',    cmd = "Neotree", },
  -- info line
  { 'nvim-lualine/lualine.nvim' },
  -- Finder ----
  'nvim-telescope/telescope.nvim',
  -- Highlighting ----
  { 'nvim-treesitter/nvim-treesitter',    build = ':TSUpdate', },
  -- Key finder helper
  { 'folke/which-key.nvim',               lazy = true },
  -- Copilot
  { 'zbirenbaum/copilot.lua' },
  -- Auto pair brackets
  { 'windwp/nvim-autopairs' },
  -- Jump to any word in the current buffer
  { 'ggandor/leap.nvim' },
  -- Comment fast
  { 'numToStr/Comment.nvim' },
  -- Indent lines
  { 'lukas-reineke/indent-blankline.nvim' },
  -- bufferline and tabs
  { 'akinsho/bufferline.nvim',            dependencies = 'nvim-tree/nvim-web-devicons' },
  -- Terminal
  { 'akinsho/toggleterm.nvim' },
  -- colorizer
  { 'norcalli/nvim-colorizer.lua' },



  -- {
  --   'mfussenegger/nvim-dap',
  --   dependencies = { 'rcarriga/nvim-dap-ui', },
  --   cmd = 'DapToggleBreakpoint',
  -- },
}

lazy.setup({
  -- leave nil when passing the spec as the first argument to setup()
  spec = plugins,
  -- Defining the root directory where plugins will be installed
  root = vim.fn.stdpath('data') .. '/lazy',
  -- Defining the default options for the plugins
  defaults = {
    -- Lazy to false if we whant to load all plugin on startup
    lazy = true,
  },
  -- Defining root lockfile generated after running update.
  lockfile = vim.fn.stdpath('config') .. '/lua/core/plugins/lock.json',
  -- Defining the maximum amount of concurrent tasks
  concurrency = nil, ---@type number limit the maximum amount of concurrent tasks
  -- Defining the git options
  git = {
    -- get logs for the last 3 days
    log = { '--since=3 days ago' },
    -- kill processes that take more than 2 minutes
    timeout = 120,
    -- url format for the git clone command
    url_format = 'https://github.com/%s.git',
    filter = true
  },
  -- Defining the plugin manager geneal options
  install = {
    -- install missing plugins on startup. This doesn't increase startup time.
    missing = true,
    -- try to load one of these colorschemes when starting an installation during startup
    colorscheme = { 'onedark' }
  },
  ui = {
    -- a number <1 is a percentage., >1 is a fixed size
    size = {
      width = 0.9,
      height = 0.8
    },
    -- wrap the lines in the ui
    wrap = true,
    -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
    border = 'rounded',
    icons = {
      cmd = ' ',
      config = '',
      event = '',
      ft = ' ',
      init = ' ',
      import = ' ',
      keys = ' ',
      lazy = '󰒲 ',
      loaded = '●',
      not_loaded = '○',
      plugin = ' ',
      runtime = ' ',
      source = ' ',
      start = '',
      task = '✔ ',
      list = { '●', '➜', '★', '‒' }
    },
    -- leave nil, to automatically select a browser depending on your OS.
    -- If you want to use a specific browser, you can define it here
    browser = nil, ---@type string?
    -- how frequently should the ui process render events
    throttle = 20,
    -- you can define custom key maps here.
    -- To disable one of the defaults, set it to false
    custom_keys = {
      -- open lazygit log
      ['<localleader>l'] = function(plugin)
        require('lazy.util').float_term({ 'lazygit', 'log' }, {
          cwd = plugin.dir
        })
      end,
      -- open a terminal for the plugin dir
      ['<localleader>t'] = function(plugin)
        require('lazy.util').float_term(nil, {
          cwd = plugin.dir
        })
      end
    }
  },
  diff = {
    -- diff command <d> can be one of:
    -- * browser: opens the github compare view. Note that this is always mapped to <K> as well,
    --   so you can have a different command for diff <d>
    -- * git: will run git diff and open a buffer with filetype git
    -- * terminal_git: will open a pseudo terminal with git diff
    -- * diffview.nvim: will open Diffview to show the diff
    cmd = 'git'
  },
  checker = {
    -- automatically check for plugin updates
    enabled = false,
    concurrency = nil, ---@type number? set to 1 to check for updates very slowly
    notify = true,   -- get a notification when new updates are found
    frequency = 3600 -- check for updates every hour
  },
  change_detection = {
    -- automatically check for config file changes and reload the ui
    enabled = true,
    notify = true -- get a notification when changes are found
  },
  performance = {
    cache = {
      enabled = true
    },
    reset_packpath = true, -- reset the package path to improve startup time
    rtp = {
      reset = true,        -- reset the runtime path to $VIMRUNTIME and your config directory
      ---@type string[]
      paths = {},          -- add any custom paths here that you want to includes in the rtp
      ---@type string[] list any plugins you want to disable here
      disabled_plugins = {
        -- 'gzip',
        -- 'matchit',
        -- 'matchparen',
        -- 'netrwPlugin',
        -- 'tarPlugin',
        -- 'tohtml',
        -- 'tutor',
        -- 'zipPlugin',
      }
    }
  },
  -- lazy can generate helptags from the headings in markdown readme files,
  -- so :help works even for plugins that don't have vim docs.
  -- when the readme opens with :help it will be correctly displayed as markdown
  readme = {
    root = vim.fn.stdpath('state') .. '/lazy/readme',
    files = { 'README.md', 'lua/**/README.md' },
    -- only generate markdown helptags for plugins that dont have docs
    skip_if_doc_exists = true
  },
  state = vim.fn.stdpath('state') .. '/lazy/state.json' -- state info for checker and other things
})
