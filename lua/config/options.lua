-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- vim.g.lazyvim_python_lsp = "pyright"

-- Configuração do cursor para melhor visibilidade
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"

-- Configuração adicional para terminal
if vim.fn.has("termguicolors") == 1 then
  vim.opt.termguicolors = true
end
