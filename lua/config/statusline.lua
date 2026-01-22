local theme = require("config.themes").get_colors()

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = {
      normal = {
        a = { fg = theme.bg, bg = theme.accent, bold = true },
        b = { fg = theme.fg, bg = theme.bg_alt },
        c = { fg = theme.fg, bg = theme.bg },
      },
      insert = { a = { fg = theme.bg, bg = theme.green, bold = true } },
      visual = { a = { fg = theme.bg, bg = theme.blue, bold = true } },
      replace = { a = { fg = theme.bg, bg = theme.red, bold = true } },
      inactive = {
        a = { fg = theme.gray, bg = theme.bg_alt },
        b = { fg = theme.gray, bg = theme.bg_alt },
        c = { fg = theme.gray, bg = theme.bg_alt },
      },
    },
    section_separators = { left = "", right = "" },
    component_separators = { left = "│", right = "│" },
  },

  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff" },
    lualine_c = { { "filename", path = 1 } },
    lualine_x = { "diagnostics", "encoding", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
})
