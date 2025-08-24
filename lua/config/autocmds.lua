-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Configuração forçada do cursor para terminais
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Desabilita guicursor para forçar uso do cursor do terminal
    vim.opt.guicursor = ""
    
    -- Configuração manual com escape sequences para terminais
    vim.cmd([[
      let &t_SI = "\e[6 q"  " Cursor linha vertical no insert
      let &t_EI = "\e[2 q"  " Cursor bloco no normal
      let &t_SR = "\e[4 q"  " Cursor underline no replace
    ]])
  end,
})

vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    vim.cmd("silent !printf '\\e[6 q'")
  end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    vim.cmd("silent !printf '\\e[2 q'")
  end,
})
