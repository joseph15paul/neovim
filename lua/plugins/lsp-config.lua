return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "lua_ls", "clangd" },
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
  },
  {
    "mason-org/mason.nvim",
    opts = {}
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.enable('lus_ls')
      vim.lsp.enable('clangd')
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
    end
  }
}

