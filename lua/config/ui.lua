vim.cmd.colorscheme("tokyonight")

-- Lualine setup
require("lualine").setup({
  options = { theme = "tokyonight" }
})

-- Neo-tree setup
require("neo-tree").setup({
  close_if_last_window = true,
  popup_border_style = "rounded",
  enable_git_status = true,
  enable_diagnostics = true,
  default_component_configs = {
    indent = { padding = 1 },
    icon = { folder_closed = "", folder_open = "", folder_empty = "ﰊ" },
    git_status = { symbols = { added = "✚", modified = "", removed = "✖" } },
  },
})
