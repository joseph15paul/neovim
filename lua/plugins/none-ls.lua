return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'nvimtools/none-ls-extras.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function()
    require('mason-tool-installer').setup {
      ensure_installed = {
        'clang-format',
        'cpplint',
      },
      auto_update = true,
      run_on_start = true,
      start_delay = 3000, -- 3 second delay
    }

    local null_ls = require 'null-ls'
    null_ls.setup {
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.completion.spell,
        null_ls.builtins.diagnostics.gccdiag,
        null_ls.builtins.formatting.clang_format.with {
          filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
          -- optional: specify a style
          extra_args = { '--style=Google' }, -- or LLVM, Mozilla, WebKit, file
        },
        require 'none-ls.diagnostics.cpplint',
      },
    }
    vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, {})
  end,
}
