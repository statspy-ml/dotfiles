return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Adiciona suporte ao Ruff LSP
      { "neovim/nvim-lspconfig", opts = {} },
      { "mason-org/mason.nvim" },
      { "mason-org/mason-lspconfig.nvim" },
    },
    opts = {
      servers = {
        ruff_lsp = {
          -- Configuração do Ruff LSP
          init_options = {
            settings = {
              -- Habilita a execução do ruff em tempo real
              args = { "--fix" },
            },
          },
        },
        pyright = {
          enabled = true,
        },
      },
      -- Configuração para instalar o Ruff LSP automaticamente
      setup = {
        ruff_lsp = function()
          require("lspconfig").ruff_lsp.setup({
            on_attach = function(client, bufnr)
              -- Desativa o highlight de referências para melhor performance
              client.server_capabilities.documentHighlightProvider = false
            end,
          })
        end,
      },
    },
  },
  -- Adiciona o Ruff como um linter
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        python = { "ruff_fix" },
      },
    },
  },
}
