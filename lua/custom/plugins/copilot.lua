return {
  'github/copilot.vim',
  config = function()
    vim.g.copilot_no_tab_map = true
    vim.api.nvim_set_keymap('i', '<C-J>', 'copilot#Accept("<CR>")', { desc = 'Copilot accept', silent = true, expr = true })
    vim.api.nvim_set_keymap('i', '<C-H>', 'copilot#Previous()', { desc = 'Copilot prev', silent = true, expr = true })
    vim.api.nvim_set_keymap('i', '<C-K>', 'copilot#Next()', { desc = 'Copilot next', silent = true, expr = true })
    vim.g.copilot_filetypes = {
      ['*'] = false,
      ['javascript'] = true,
      ['typescript'] = true,
      ['lua'] = false,
      ['rust'] = true,
      ['c'] = true,
      ['c#'] = true,
      ['c++'] = true,
      ['go'] = true,
      ['python'] = true,
    }
  end,
}

