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
  { "mason-org/mason.nvim", opts = {} },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      -- Disable inlay hints globally (optional)
      vim.lsp.inlay_hint.enable(false)

      -- Setup servers (Neovim 0.11 style)
      vim.lsp.config("lua_ls", {})
      vim.lsp.enable("lua_ls")

      vim.lsp.config("clangd", {})
      vim.lsp.enable("clangd")
    end,
  },
}

