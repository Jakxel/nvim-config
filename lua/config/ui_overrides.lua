local M = {}

function M.apply()
  local theme = require("config.themes").get_colors()

  -- Neo-tree
  vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = theme.bg_alt, fg = theme.fg })
  vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = theme.blue })
  vim.api.nvim_set_hl(0, "NeoTreeCursorLine", { bg = theme.bg })

  -- Bufferline
  vim.api.nvim_set_hl(0, "BufferLineFill", { bg = theme.bg })
end

return M
