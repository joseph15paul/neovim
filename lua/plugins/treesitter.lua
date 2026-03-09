return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  lazy = false,
  config = function()
    require('nvim-treesitter').setup {
      install_dir = vim.fn.stdpath 'data' .. '/site',
      auto_install = true,
      ensure_installed = {
        'lua',
        'python',
        'c',
        'cpp',
        'c_sharp',
        'dockerfile',
        'vimdoc',
        'markdown',
        'markdown_inline',
      },
      highlight = {
        enable = true,
      },
    }
  end,
}
