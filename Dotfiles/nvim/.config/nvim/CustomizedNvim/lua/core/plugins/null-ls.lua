local status_ok, null_ls = pcall(require, 'null-ls')
if not status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
-- local hover = null_ls.builtins.hover
-- local code_actions = null_ls.builtins.code_actions
-- local completion = null_ls.builtins.completion

null_ls.setup({
  debug = false,
  border = 'rounded',
  log_level = 'error',
  diagnostics_format = '#{c} #{m} (#{s})',
  sources = {
    -- code_actions.eslint,
    -- code_actions.proselint,
    -- code_actions.refactoring,
    -- code_actions.shellcheck,
    -- completion.spell,
    -- completion.tags,
    diagnostics.eslint,
    -- diagnostics.rubocop,
    -- diagnostics.selene,
    -- diagnostics.shellcheck,
    formatting.prettier.with({
      extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote", "--tab-width 2", "--print-width 80" } }),
    formatting.eslint,
    formatting.black.with({ extra_args = { '--fast' } }),
    -- formatting.rubocop,
    -- formatting.shfmt,
    -- formatting.stylua,
    -- hover.dictionary,
    -- hover.printenv,
    -- diagnostics.cspell.with({
    --     {
    --         disabled_filetypes = { "lua" },
    --         filetypes = { "html", "json", "yaml", "markdown" },
    --         extra_args = { "--config ~/.cspell.json" },
    --     },
    -- }),
    -- code_actions.cspell.with({
    --     {
    --         disabled_filetypes = { 'lua' },
    --         filetypes = { 'html', 'json', 'yaml', 'markdown' },
    --         extra_args = { '--config ~/.cspell.json' },
    --     },
    -- }),
  },
})
