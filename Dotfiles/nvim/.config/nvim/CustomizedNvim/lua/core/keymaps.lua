local opts = {
  noremap = true,
  silent = true
}
-- local keymap = vim.api.nvim_set_keymap

-- Space as leader
vim.api.nvim_set_keymap('n', '<Space>', '', opts)
vim.api.nvim_set_keymap('v', '<Space>', '', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local customKeymap = {
  normal_mode = {
    -- Escape
    ["hh"] = "<Esc>",
    -- Enter insert mode before cursor
    ["h"] = "i",
    -- Enter insert mode after cursor
    ["H"] = "a",
    -- Enter visual mode
    ["v"] = "v",
    -- Enter visual line mode
    ["vv"] = "V",
    -- Navigate with ijkl
    ["i"] = "k",
    ["k"] = "j",
    ["j"] = "h",
    ["l"] = "l",
    -- Navigate to start of file
    ["I"] = "gg",
    -- Navigate to end of file
    ["K"] = "G",
    -- Navigate to start of line
    ["J"] = "^",
    -- Navigate to end of line
    ["L"] = "$",
    -- Undo
    ["u"] = "u",
    -- Redo
    ["U"] = "<C-r>",
    -- Copy current word
    ["c"] = "yiw",
    -- Cut current word
    ["x"] = "diw",
    -- Paste
    ["p"] = "p",
    -- Delete one char
    ["d"] = "x",
    -- Delete current word
    ["dd"] = "diw",
    -- Search with leap plugin
    ["f"] = ":lua require('leap').leap { target_windows = { vim.fn.win_getid() } }<cr>",
    -- Comment the current line
    ["C"] = ":lua require('Comment.api').toggle.linewise.current()<CR>",
    -- Move to left bufferline tab
    ["<A-j>"] = ":BufferLineCyclePrev<CR>",
    -- Move to right bufferline tab
    ["<A-l>"] = ":BufferLineCycleNext<CR>",
    -- Close current buffer
    ["<A-k>"] = ":bdelete<CR>",
    -- new buffer
    ["<A-i>"] = ":enew<CR>",
    -- Open file explorer
    ["e"] = ":NeoTreeFocusToggle<CR>",
    ["t"] = ":ToggleTerm<CR>",
  },
  insert_mode = {
    -- Escape
    ["hh"] = "<Esc>"
  },
  term_mode = {
    -- Escape
    ["hh"] = "<Esc>"
  },
  visual_mode = {
    -- Escape
    ["hh"] = "<Esc>",
  },
  visual_block_mode = {
    -- Escape
    ["hh"] = "<Esc>",
    -- Navigate with ijkl
    ["i"] = "k",
    ["k"] = "j",
    ["j"] = "h",
    ["l"] = "l",
    -- Navigate to start of file
    ["I"] = "gg",
    -- Navigate to end of file
    ["K"] = "G",
    -- Navigate to start of line
    ["J"] = "^",
    -- Navigate to end of line
    ["L"] = "$",
    -- Comment the current line or selected lines with
    ["C"] = ":lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
    -- Copy selection
    ["c"] = "y",
    -- Cut selection
    ["x"] = "x",
    -- Paste selection
    ["p"] = "p",
    -- Delete selection
    ["d"] = "d",
    -- Move the current line or selected lines up with
    ["<A-i>"] = ":move \'<-2<CR>gv",
    -- Move the current line or selected lines down with
    ["<A-k>"] = ":move \'>+1<CR>gv",
    -- Unindent the current line or selected lines to the left with
    ["<A-j>"] = "<gv",
    -- Indent the current line or selected lines to the right with
    ["<A-l>"] = ">gv"
  },
  command_mode = {
    -- Escape
    ["hh"] = "<Esc>"
  }
}

local mode_adapters = {
  insert_mode = "i",
  normal_mode = "n",
  term_mode = "t",
  visual_mode = "v",
  visual_block_mode = "x",
  command_mode = "c",
  operator_pending_mode = "o"
}

for mode, mapping in pairs(customKeymap) do
  mode = mode_adapters[mode] or mode
  for key, value in pairs(mapping) do
    if type(value) == "table" then
      opts = value[2]
      value = value[1]
    end
    if value then
      vim.keymap.set(mode, key, value, opts)
    else
      pcall(vim.api.nvim_del_keymap, mode, key)
    end
  end
end
