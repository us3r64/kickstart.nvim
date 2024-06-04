return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('neo-tree').setup {
      close_if_last_window = true,
      window = {
        position = 'left',
        width = 25,
      },
      filesystem = {
        follow_current_file = {
          enabled = true,
        },
      },
      event_handlers = {

        {
          event = 'file_opened',
          handler = function(file_path)
            -- auto close
            -- vimc.cmd("Neotree close")
            -- OR
            require('neo-tree.command').execute { action = 'close' }
          end,
        },
      },
    }

    -- Keybindings
    vim.keymap.set('n', '<leader>n', '<cmd>Neotree toggle<cr>', { desc = 'Toggle Explorer' })
    vim.keymap.set('n', '<leader>nf', '<cmd>Neotree reveal<cr>', { desc = 'Reveal Explorer' })
  end,
}
