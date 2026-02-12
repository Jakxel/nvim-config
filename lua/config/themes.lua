local M = {}

local theme_file = vim.fn.stdpath("data") .. "/active_theme"

-- ======================
-- Theme definitions
-- ======================
M.themes = {
lofi = {
  bg = "#1D1D20",
  bg_alt = "#29292E",
  bg_float = "#0e0b05",
  bg_visual = "#1a150a",

  fg = "#e6e1d8",
  fg_dim = "#a39a8c",
  fg_dark = "#6f665a",

  accent = "#f0b429",
  accent_bright = "#ffd166",
  accent_dim = "#b3861e",

  red = "#e06c75",
  yellow = "#f0b429",
  green = "#98c379",
  blue = "#61afef",
  purple = "#c678dd",
  cyan = "#56b6c2",

  gray = "#3a352f",
  gray_alt = "#2a2520",
  border = "#1f1a14",

  diag_error = "#e06c75",
  diag_warn = "#f0b429",
  diag_info = "#61afef",
  diag_hint = "#98c379",

},
dark_amber = {
  bg = "#000000",
  bg_alt = "#060400",
  bg_float = "#0e0b05",
  bg_visual = "#1a150a",

  fg = "#e6e1d8",
  fg_dim = "#a39a8c",
  fg_dark = "#6f665a",

  accent = "#f0b429",
  accent_bright = "#ffd166",
  accent_dim = "#b3861e",

  red = "#e06c75",
  yellow = "#f0b429",
  green = "#98c379",
  blue = "#61afef",
  purple = "#c678dd",
  cyan = "#56b6c2",

  gray = "#3a352f",
  gray_alt = "#2a2520",
  border = "#1f1a14",

  diag_error = "#e06c75",
  diag_warn = "#f0b429",
  diag_info = "#61afef",
  diag_hint = "#98c379",
},
  dark_red = {
  bg = "#1D1D20",
  bg_alt = "#29292E",
    bg_float  = "#0e0e0e",
    bg_visual = "#1a1a1a",

    fg        = "#e0e0e0",
    fg_dim    = "#9a9a9a",
    fg_dark   = "#6f6f6f",

    accent        = "#e01212",
    accent_bright = "#ff2a2a",
    accent_dim    = "#a60f0f",

    red     = "#e01212",
    yellow  = "#fbea38",
    green   = "#38da0e",
    blue    = "#61afef",
    purple  = "#ea3da0",
    cyan    = "#56b6c2",

    gray      = "#3a3a3a",
    gray_alt  = "#2a2a2a",
    border    = "#1f1f1f",

    diag_error = "#ff4d4d",
    diag_warn  = "#ff9f1c",
    diag_info  = "#61afef",
    diag_hint  = "#98c379",
  },

  dark_orange = {
    bg        = "#000000",
    bg_alt    = "#050505",
    bg_float  = "#0e0e0e",
    bg_visual = "#1a1a1a",

    fg        = "#d6d6d6",
    fg_dim    = "#9a9a9a",
    fg_dark   = "#6f6f6f",

    accent        = "#ff8c42",
    accent_bright = "#ff9f5a",
    accent_dim    = "#cc6f32",

    yellow = "#f0b65a",
    green  = "#98c379",
    red    = "#e06c75",
    blue   = "#61afef",
    purple = "#b48ead",
    cyan   = "#56b6c2",

    gray      = "#3a3a3a",
    gray_alt  = "#2a2a2a",
    border    = "#1f1f1f",

    diag_error = "#ff5f5f",
    diag_warn  = "#ff9f1c",
    diag_info  = "#5fafff",
    diag_hint  = "#7fbf7f",
  },
dark_emerald = {
  bg = "#000000",
  bg_alt = "#040806",
  bg_float = "#0c1411",
  bg_visual = "#15201b",

  fg = "#dfeee8",
  fg_dim = "#9bb3a8",
  fg_dark = "#6f8a80",

  accent = "#2ecc71",
  accent_bright = "#4ee88d",
  accent_dim = "#1f9e57",

  red = "#e06c75",
  yellow = "#e5c07b",
  green = "#2ecc71",
  blue = "#61afef",
  purple = "#c678dd",
  cyan = "#56b6c2",

  gray = "#2f3a35",
  gray_alt = "#1f2a26",
  border = "#18201d",

  diag_error = "#e06c75",
  diag_warn = "#e5c07b",
  diag_info = "#61afef",
  diag_hint = "#2ecc71",
},
dark_violet = {
  bg = "#000000",
  bg_alt = "#07040a",
  bg_float = "#120a18",
  bg_visual = "#1a1024",

  fg = "#f0e6ff",
  fg_dim = "#b8a6d9",
  fg_dark = "#7a6a99",

  accent = "#a855f7",
  accent_bright = "#c084fc",
  accent_dim = "#7e22ce",

  red = "#f87171",
  yellow = "#facc15",
  green = "#4ade80",
  blue = "#60a5fa",
  purple = "#a855f7",
  cyan = "#22d3ee",

  gray = "#352f40",
  gray_alt = "#241f30",
  border = "#1b1624",

  diag_error = "#f87171",
  diag_warn = "#facc15",
  diag_info = "#60a5fa",
  diag_hint = "#4ade80",
},
dark_azure = {
  bg = "#1D1D20",
  bg_alt = "#29292E",
  bg_float = "#0c1016",
  bg_visual = "#141a24",

  fg = "#dde6f0",
  fg_dim = "#9aa8b8",
  fg_dark = "#6f7d8a",

  accent = "#3b82f6",
  accent_bright = "#60a5fa",
  accent_dim = "#1e4fd6",

  red = "#ef4444",
  yellow = "#eab308",
  green = "#22c55e",
  blue = "#3b82f6",
  purple = "#a78bfa",
  cyan = "#22d3ee",

  gray = "#2e3440",
  gray_alt = "#1f2430",
  border = "#181c24",

  diag_error = "#ef4444",
  diag_warn = "#eab308",
  diag_info = "#3b82f6",
  diag_hint = "#22c55e",
},
}

-- ======================
-- Save / Load
-- ======================
local function save_theme(name)
  vim.fn.writefile({ name }, theme_file)
end

local function load_theme()
  if vim.fn.filereadable(theme_file) == 1 then
    return vim.fn.readfile(theme_file)[1]
  end
end

-- ======================
-- Apply theme
-- ======================
function M.apply(name, persist)
  local c = M.themes[name]
  if not c then
    vim.notify("Theme not found: " .. name, vim.log.levels.ERROR)
    return
  end

  local bg_alt     = c.bg_alt     or c.bg
  local bg_float   = c.bg_float   or bg_alt
  local bg_visual  = c.bg_visual  or bg_alt
  local fg_dim     = c.fg_dim     or c.gray
  local border     = c.border     or c.gray
  local accent_dim = c.accent_dim or c.accent

local hl = {
  -- ======================
  -- Core UI
  -- ======================
  Normal       = { fg = c.fg, bg = c.bg },
  NormalNC     = { fg = c.fg, bg = c.bg },
  CursorLine   = { bg = bg_alt },
  Visual       = { bg = bg_visual },

  LineNr       = { fg = fg_dim },
  CursorLineNr = { fg = c.accent, bold = true },

  -- ======================
  -- Comments
  -- ======================
  Comment = { fg = c.fg_dim, italic = true },

  -- ======================
  -- Tree-sitter: Keywords
  -- ======================
  ["@keyword"]             = { fg = c.accent_dim },

  ["@keyword.conditional"] = { fg = c.purple },
  ["@keyword.repeat"]      = { fg = c.purple },
  ["@keyword.return"]      = { fg = c.purple },

  ["@keyword.function"]    = { fg = c.accent },
  ["@keyword.operator"]    = { fg = c.yellow },

  -- ======================
  -- Tree-sitter: Functions
  -- ======================
  ["@function"]       = { fg = c.blue },
  ["@function.call"]  = { fg = c.blue },
  ["@method"]         = { fg = c.blue },
  ["@method.call"]    = { fg = c.blue },

  -- ======================
  -- Tree-sitter: Variables
  -- ======================
  ["@variable"]           = { fg = c.accent_dim },
  ["@variable.parameter"] = { fg = c.accent_dim },
  ["@variable.builtin"]   = { fg = c.accent_dim },
  ["@property"]           = { fg = c.accent_dim },

  -- ======================
  -- Tree-sitter: Types / Constants
  -- ======================
  ["@type"]               = { fg = c.purple },
  ["@type.builtin"]       = { fg = c.purple },
  ["@type.qualifier"]     = { fg = c.purple },

  ["@constant"]           = { fg = c.yellow },
  ["@constant.builtin"]   = { fg = c.yellow },

  -- ======================
  -- Tree-sitter: Literals
  -- ======================
  ["@string"]    = { fg = c.green },
  ["@character"] = { fg = c.green },

  ["@number"]    = { fg = c.yellow },
  ["@boolean"]   = { fg = c.yellow },
  ["@float"]     = { fg = c.yellow },

  -- ======================
  -- Tree-sitter: Punctuation (CLAVE)
  -- ======================
  ["@punctuation"]            = { fg = c.gray },
  ["@punctuation.delimiter"]  = { fg = c.gray },
  ["@punctuation.bracket"]    = { fg = c.fg_dim },

  -- ======================
  -- Tree-sitter: Namespaces / scopes
  -- ======================
  ["@namespace"] = { fg = c.blue },

  -- ======================
  -- Preprocessor (C/C++)
  -- ======================
  ["@preproc"]  = { fg = c.accent_dim },
  ["@include"]  = { fg = c.accent },
  ["@define"]   = { fg = c.accent },

  -- ======================
  -- LSP Semantic Tokens (clangd)
  -- ======================
  ["@lsp.type.namespace"] = { fg = c.blue },

  ["@lsp.type.class"]     = { fg = c.accent_bright },
  ["@lsp.type.struct"]    = { fg = c.accent_bright },
  ["@lsp.type.enum"]      = { fg = c.accent_bright },
  ["@lsp.type.type"]      = { fg = c.accent_bright},

  ["@lsp.type.function"]  = { fg = c.blue },
  ["@lsp.type.method"]    = { fg = c.blue },

  ["@lsp.type.variable"]  = { fg = c.yellow },
  ["@lsp.type.parameter"] = { fg = c.yellow },
  ["@lsp.type.property"]  = { fg = c.yellow },

  ["@lsp.type.macro"]     = { fg = c.accent },

  ["@lsp.mod.readonly"]   = { italic = true },
  ["@lsp.mod.static"]     = { fg = c.accent_dim },

  -- ======================
  -- Classic Vim syntax (ANTI-FUGAS)
  -- ======================
  Statement   = { fg = c.fg_dim },
  Conditional = { fg = c.purple },
  Repeat      = { fg = c.purple },
  Type        = { fg = c.purple },
  Operator    = { fg = c.fg_dark },
  PreProc    = { fg = c.accent },

  -- ======================
  -- UI
  -- ======================
  VertSplit    = { fg = border },
  WinSeparator = { fg = border },

  NormalFloat  = { fg = c.fg, bg = bg_float },
  FloatBorder  = { fg = accent_dim, bg = bg_float },
  -- ======================
  -- Alpha (Dashboard)
  -- ======================
  AlphaHeader = { fg = c.accent, bold = true },
  AlphaButtons = { fg = c.blue },
  AlphaShortcut = { fg = c.yellow },
  AlphaFooter = { fg = c.fg_dim, italic = true },
  -- ======================
  -- Diagnostics
  -- ======================
  DiagnosticError = { fg = c.diag_error },
  DiagnosticWarn  = { fg = c.diag_warn },
  DiagnosticInfo  = { fg = c.diag_info },
  DiagnosticHint  = { fg = c.diag_hint },

  DiagnosticUnderlineError = { undercurl = true, sp = c.diag_error },
  DiagnosticUnderlineWarn  = { undercurl = true, sp = c.diag_warn },
  DiagnosticUnderlineInfo  = { undercurl = true, sp = c.diag_info },
  DiagnosticUnderlineHint  = { undercurl = true, sp = c.diag_hint },

  -- ======================
  -- Statusline
  -- ======================
  StatusLine   = { fg = c.fg, bg = bg_alt },
  StatusLineNC = { fg = fg_dim, bg = c.bg },

  -- ======================
  -- Neo-tree
  -- ======================
  NeoTreeNormal        = { fg = c.fg, bg = c.bg },
  NeoTreeDirectoryName = { fg = c.blue },
  NeoTreeFileName      = { fg = c.fg },
  NeoTreeRootName      = { fg = c.accent, bold = true },
  NeoTreeGitAdded      = { fg = c.green },
  NeoTreeGitModified   = { fg = c.yellow },
  NeoTreeGitDeleted    = { fg = c.red },
}

vim.cmd("syntax reset")
vim.o.termguicolors = true

  for group, opts in pairs(hl) do
    vim.api.nvim_set_hl(0, group, opts)
  end

  vim.g.active_theme = name
  if persist then save_theme(name) end
end

-- ======================
-- Restore last theme
-- ======================
function M.restore()
  local last = load_theme()
  if last and M.themes[last] then
    M.apply(last, false)
  else
    M.apply("dark_orange", false)
  end
end

-- ======================
-- Access palette
-- ======================
function M.get_colors()
  return M.themes[vim.g.active_theme]
end

return M
