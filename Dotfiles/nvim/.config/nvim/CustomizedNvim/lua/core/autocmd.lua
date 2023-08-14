-- Non editable buffer options
vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = { 'Jaq', 'qf', 'help', 'man', 'lspinfo', 'spectre_panel', 'lir', 'DressingSelect', 'tsplayground' },
  callback = function()
    vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]])
  end,
})

-- Terminal buffer options
vim.api.nvim_create_autocmd({ 'BufEnter' }, {
  pattern = { 'term://*' },
  callback = function()
    vim.cmd('startinsert!')
    vim.cmd('set cmdheight=1')
  end,
})

-- Enable spellcheck on gitcommit and markdown
vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = { 'gitcommit', 'markdown' },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Strip trailing spaces before write
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  pattern = { '*' },
  callback = function()
    vim.cmd([[ %s/\s\+$//e ]])
  end,
})

vim.cmd([[
    " Have Vim jump to the last position when reopening a file
    if has("autocmd")
        au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\""
    endif
]])

-- Change cursor colors
vim.cmd([[
    highlight Cursor guifg=blue guibg=blue
    highlight Cursor2 guifg=red guibg=red
]])

-- Leap search custom grey and red colors
vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })    -- or some grey
vim.api.nvim_set_hl(0, 'LeapMatch', { fg = 'white', bold = true, nocombine = true, })
-- Of course, specify some nicer shades instead of the default "red" and "blue".
vim.api.nvim_set_hl(0, 'LeapLabelPrimary', { fg = 'red', bold = true, nocombine = true, })
vim.api.nvim_set_hl(0, 'LeapLabelSecondary', { fg = 'blue', bold = true, nocombine = true, })
