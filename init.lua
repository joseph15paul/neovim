require("vim-options")
require("config.lazy")

vim.keymap.set('n', '<leader>fs', ':Neotree filesystem reveal left <CR>', {})

require'nvim-treesitter'.setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath('data') .. '/site'
}

require'nvim-treesitter'.install { 'lua','python', 'c', 'cpp', 'c_sharp', 'docker_file', 'rust', 'javascript', 'zig' }
