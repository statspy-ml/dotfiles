return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Desabilitar Pyright completamente
        pyright = { enabled = true },

        -- Desabilitar Pyflakes
        pyflakes = { enabled = false },

        -- Configurar Ruff para fazer tudo
        ruff = {
          enabled = true,
          settings = {
            args = {},
            severities = {
              D = "debug", -- Definir todas as violações de docstring como warning
            },
            line_length = 100,
            target_version = "py312",
          },
        },
      },
    },
  },

  -- Garantir que o Ruff está instalado via Mason
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "ruff")
    end,
  },

  -- Se você estiver usando o null-ls ou nvim-lint, certifique-se de que eles
  -- não estão configurados para usar ferramentas de Python que possam conflitar
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        python = {}, -- Deixe vazio para não usar linters adicionais
      },
    },
  },
}
