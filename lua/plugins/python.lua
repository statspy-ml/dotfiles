return {
  -- Extend/override the Python configuration
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          enabled = true, -- Explicitly enable Pyright
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
                diagnosticSeverityOverrides = {
                  -- Imports
                  reportUnusedImport = "warning", -- Import não usado
                  reportMissingImports = "error", -- Import faltando
                  reportImportCycles = "warning", -- Ciclos de importação
                  -- Variáveis e tipos
                  reportUndefinedVariable = "error", -- Variável não definida
                  reportUnboundVariable = "error", -- Variável não vinculada
                  reportAssignmentType = "warning", -- Problema de tipo na atribuição
                  reportGeneralTypeIssues = "warning", -- Problemas gerais de tipo
                  reportOptionalSubscript = "warning", -- Acesso a índice que pode ser None
                  reportOptionalMemberAccess = "warning", -- Acesso a atributo que pode ser None
                  reportOptionalCall = "warning", -- Chamada de função que pode ser None
                  reportOptionalIterable = "warning", -- Iteração sobre valor que pode ser None
                  reportOptionalContextManager = "warning", -- Uso de gerenciador de contexto que pode ser None
                  reportOptionalOperand = "warning", -- Operação com valor que pode ser None
                  -- Funções
                  reportMissingParameterType = "warning", -- Parâmetro sem tipo
                  reportMissingTypeArgument = "warning", -- Argumento de tipo genérico faltando
                  reportFunctionMemberAccess = "warning", -- Acesso a membro de função
                  reportCallInDefaultInitializer = "information", -- Chamada de função em inicializador padrão
                  reportUnusedCallResult = "information", -- Resultado de chamada não usado
                  -- Docstrings e comentários
                  reportMissingModuleDocstring = "information", -- Docstring de módulo faltando
                  reportMissingFunctionDocstring = "warning", -- Docstring de função faltando
                  reportMissingClassDocstring = "information", -- Docstring de classe faltando
                  reportInvalidStringEscapeSequence = "warning", -- Sequência de escape inválida
                  -- Estilo de código
                  reportInvalidNameCase = "information", -- Estilo de nomenclatura (ex: UPPER_CASE para constantes)
                  reportDuplicateImport = "warning", -- Import duplicado
                  reportShadowedImports = "warning", -- Import sombreando outro
                  -- Escopo e redefinição
                  reportRedefinedVariable = "information", -- Variável redefinida no mesmo escopo
                  reportRedefinedBuiltins = "warning", -- Redefinição de built-ins
                  reportRedefiningFunction = "warning", -- Redefinição de função existente
                  reportOverlappingOverload = "warning", -- Sobrecarga de função sobreposta
                  reportOutsideFunction = "error", -- Uso de 'return', 'yield', etc. fora de função
                  reportSelfClsParameterName = "warning", -- Nome de parâmetro self/cls incorreto
                  -- Outras verificações
                  reportUnnecessaryIsInstance = "information", -- isinstance() desnecessário
                  reportUnnecessaryCast = "information", -- Cast desnecessário
                  reportUnnecessaryComparison = "information", -- Comparação desnecessária
                  reportUnnecessaryTypeIgnoreComment = "information", -- Comentário # type: ignore desnecessário
                  reportConstantRedefinition = "warning", -- Redefinição de constantes
                  reportImplicitStringConcatenation = "warning", -- Concatenação implícita de strings
                  reportPropertyTypeMismatch = "warning", -- Tipo de propriedade incompatível
                  reportInconsistentConstructor = "warning", -- Construtor inconsistente
                  reportPrivateUsage = "warning", -- Uso de membro privado
                  reportPrivateImportUsage = "warning", -- Uso de import privado
                  reportIncompatibleMethodOverride = "warning", -- Método sobrescrito incompatível
                  reportIncompatibleVariableOverride = "warning", -- Variável sobrescrita incompatível
                  reportInconsistentIndentation = "warning", -- Indentação inconsistente
                  reportAny = "warning", -- Uso de 'Any'
                },
              },
            },
          },
        },
      },
    },
  },

  -- Adicione isto para garantir que nenhuma configuração conflitante está ativa
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "pyright")
      --table.insert(opts.ensure_installed, "ruff") -- ou outro linter Python
    end,
  },
}
