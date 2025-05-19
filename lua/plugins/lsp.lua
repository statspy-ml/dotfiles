-- Em seu arquivo de configuração (geralmente ~/.config/nvim/lua/plugins/lsp.lua)
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Adicione pyright ou outro servidor LSP Python completo
        pyright = {
          enabled = true,
        },
      },
    },
  },
}
