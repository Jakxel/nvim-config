-- Lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
vim.opt.termguicolors = true
require("lazy").setup("plugins.spec")
require("config.ui")
require("config.treesitter")
require("config.lsp")
require("config.cmp")
require("config.telescope")
require("config.formatter")
require("config.git")
require("config.bufferline")
require("config.alpha")
