return {
  'ray-x/go.nvim',
  requires = {
    'ray-x/guihua.lua',
    'neovim/nvim-lspconfig',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('go').setup {
      -- goimports = 'goimports',
    }

    vim.cmd [[
    autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
    ]]

    local format_sync_grp = vim.api.nvim_create_augroup('GoFormat', {})
    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = '*.go',
      callback = function()
        require('go.format').goimports()
      end,
      group = format_sync_grp,
    })

    -- local format_sync_grp = vim.api.nvim_create_augroup('GoFormat', {})
    -- vim.api.nvim_create_autocmd('BufWritePre', {
    --   pattern = '*.go',
    --   callback = function()
    --     require('go.format').goimports()
    --   end,
    --   group = format_sync_grp,
    -- })
  end,
  event = { 'CmdlineEnter' },
  ft = { 'go', 'gomod' },
  build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}
