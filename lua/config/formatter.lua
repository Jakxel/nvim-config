require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
    javascript = { "prettier" },
  },
})

vim.keymap.set("n", "<leader>f", function()
  require("conform").format({ async = true })
end)
