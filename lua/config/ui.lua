vim.o.termguicolors = true
vim.cmd.colorscheme("kanagawabones") -- or "zenbones"
require("config.themes").restore()

local theme = require("config.themes").get_colors()

require("neo-tree").setup({
  close_if_last_window = true,
  popup_border_style = "rounded",
  enable_git_status = true,
  enable_diagnostics = true,

  default_component_configs = {
    indent = {
      padding = 1,
      with_markers = true,
      indent_marker = "│",
      last_indent_marker = "└",
    },
    icon = {
      folder_closed = "",
      folder_open = "",
      folder_empty = "ﰊ",
    },
    git_status = {
      symbols = {
        added = "✚",
        modified = "",
        deleted = "✖",
        renamed = "󰁕",
        untracked = "",
        ignored = "",
        unstaged = "󰄱",
        staged = "",
        conflict = "",
      },
    },
  },
window = {
  width = 32,
  winhighlight = "Normal:NeoTreeNormal,NormalNC:NeoTreeNormalNC,CursorLine:NeoTreeCursorLine",
  mappings = {
    ["o"] = "open",
    ["h"] = "close_node",
    ["l"] = "open",
  },
},
})

-- =========================================================
-- Bufferline (VS Code–style buffers)
-- =========================================================
require("bufferline").setup({
  options = {
    mode = "buffers",
    diagnostics = "nvim_lsp",

    separator_style = "slant",
    always_show_bufferline = true,

    show_buffer_close_icons = true,
    show_close_icon = false,

    close_command = "Bdelete! %d",
    right_mouse_command = "Bdelete! %d",

    offsets = {
      {
        filetype = "neo-tree",
        text = "File Explorer",
        highlight = "Directory",
        separator = true,
      },
    },
  },
  highlights = {
    fill = { bg = theme.bg },
    background = { bg = theme.bg },
    buffer_selected = {
      fg = theme.fg,
      bold = true,
      italic = false,
    },
    separator = { fg = theme.bg, bg = theme.bg },
    separator_selected = { fg = theme.bg },
    separator_visible = { fg = theme.bg },
  },
})

require("config.bufferline")
require("config.statusline")
require("config.ui_overrides").apply()

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    require("config.ui_overrides").apply()
  end,
})
