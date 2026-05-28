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
        'ruff',
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
        null_ls.builtins.formatting.clang_format.with {
          filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
          -- optional: specify a style
          extra_args = { '--style=file' }, -- or LLVM, Mozilla, WebKit, file
        },
        require 'none-ls.diagnostics.cpplint',
      },
      on_attach = function(client, bufnr)
        if client.supports_method 'textDocument/formatting' then
          vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format { bufnr = bufnr }
            end,
          })
        end
      end,
    }
    vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, { desc = 'Format buffer' })
  end,
}
