vim.opt.signcolumn = 'yes' -- Reserve space for diagnostic icons

local status_ok, lsp = pcall(require, 'lsp-zero')
if not status_ok then
  return
end
lsp.preset('recommended')

-- Disable lsp keybinding
lsp.set_preferences({
  set_lsp_keymaps = false
})

lsp.ensure_installed({
  'lua_ls',
  'html',
  'cssls',
  'jsonls',
  'tsserver',
  'tailwindcss',
  'eslint',
})

lsp.nvim_workspace()

lsp.setup()
