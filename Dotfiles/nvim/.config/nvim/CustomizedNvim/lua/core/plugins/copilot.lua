local status_ok, copilot = pcall(require, "copilot")
if not status_ok then
  return
end
copilot.setup {
  suggestion = {
    enabled = true,
    auto_trigger = true,
    debounce = 1,
    keymap = {
      accept = "<Tab>",
      accept_word = false,
      accept_line = false,
      next = "<C-l>",
      prev = "<C-j>",
      dismiss = "C-["
    }
  },
  panel = {
    enabled = true,
    auto_refresh = true,
    keymap = {
      jump_prev = "C-[",
      jump_next = "C-[",
      accept = "<CR>",
      refresh = "gr",
      open = "<C-Space>"
    },
    layout = {
      position = "bottom", -- | top | left | right
      ratio = 0.6
    }
  },
  filetypes = {
    yaml = false,
    markdown = false,
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    ["."] = false
  },
  copilot_node_command = 'node', -- Node.js version must be > 16.x
  server_opts_overrides = {}
}
