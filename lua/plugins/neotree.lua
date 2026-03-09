return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'nvim-tree/nvim-web-devicons', -- optional, but recommended
  },
  config = function()
    require('neo-tree').setup {
      filesystem = {
        filtered_items = {
          hide_hidden = false, -- Set this to false to show hidden files
          hide_dotfiles = false, -- Set this to false to show dotfiles
        },
      },
    }

    vim.keymap.set('n', '<leader>fs', function()
      vim.cmd 'Neotree filesystem reveal left'
    end, { desc = 'File [S]ystem (Neo-tree)' })
  end,
}
