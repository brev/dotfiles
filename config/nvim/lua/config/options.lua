-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

-- vi
vim.cmd("source ~/.vimrc")

-- neovide
if vim.g.neovide then
  vim.o.guifont = "Menlo:h16"
end
