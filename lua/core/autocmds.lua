local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local group = augroup("General", { clear = true })

autocmd("TextYankPost", {
  group = group,
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    if vim.g.active_theme then
      require("config.themes").apply(vim.g.active_theme, true)
    end
  end,
})
