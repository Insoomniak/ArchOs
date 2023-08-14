local status_ok, leap = pcall(require, 'leap')
if not status_ok then
  return
end

leap.setup({
  max_phase_one_targets = nil,
  highlight_unlabeled_phase_one_targets = false,
  max_highlighted_traversal_targets = 30,
  case_sensitive = false,
  equivalence_classes = { ' \t\r\n' },
  substitute_chars = {},
  safe_labels = { 'r', 'f', 'v', 'u', 'j', 'm', 't', 'g', 'b', 'y', 'h', 'n' },
  labels = { 'r', 'f', 'v', 'u', 'j', 'm', 't', 'g', 'b', 'y', 'h', 'n' },
  special_keys = {
    repeat_search = '<enter>',
    next_phase_one_target = '<enter>',
    next_target = { '<enter>', ';' },
    prev_target = { '<tab>', ',' },
    next_group = '<space>',
    prev_group = '<tab>',
    multi_accept = '<enter>',
    multi_revert = '<backspace>',
  },
})

-- leap.set_default_keymaps()
