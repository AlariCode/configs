vim.api.nvim_set_keymap(
  'n',
  '<leader>qq',
  [[<CMD>lua require('close_buffers').delete({type = 'this'})<CR>]],
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  'n',
  '<leader>qa',
  [[<CMD>lua require('close_buffers').delete({type = 'other'})<CR>]],
  { noremap = true, silent = true }
)