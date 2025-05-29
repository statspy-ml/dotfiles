if true then
  return {}
end -- No seu arquivo de configuração lua (por exemplo, ~/.config/nvim/lua/plugins/linting.lua)
return {
  "nvimtools/none-ls.nvim",
  optional = true,
  opts = function(_, opts)
    local nls = require("null-ls")
    opts.sources = opts.sources or {}
    vim.list_extend(opts.sources, {
      nls.builtins.diagnostics.golangci_lint,
    })
  end,
}
