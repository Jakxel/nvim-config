local M = {}

local theme_file = vim.fn.stdpath("data") .. "/active_theme"

-- ======================
-- Theme definitions
-- ======================
M.themes = {
  dark_orange = {
    bg = "#1a1b26",
    bg_alt = "#16161e",
    fg = "#c0caf5",
    accent = "#ff9e64",
    yellow = "#e0af68",
    green = "#9ece6a",
    red = "#f7768e",
    blue = "#7aa2f7",
    gray = "#565f89",
  },

  dark_blue = {
    bg = "#0f1117",
    bg_alt = "#161821",
    fg = "#dcdfe4",
    accent = "#61afef",
    yellow = "#e5c07b",
    green = "#98c379",
    red = "#e06c75",
    blue = "#61afef",
    gray = "#5c6370",
  },

  dark_emerald = {
    bg = "#0f1419",
    bg_alt = "#1a1f24",
    fg = "#d0d7de",
    accent = "#2dd4bf",
    yellow = "#eab308",
    green = "#22c55e",
    red = "#ef4444",
    blue = "#38bdf8",
    gray = "#6b7280",
  },

Orange_gray = {
    bg      = "#1E1E1E",  
    bg_alt  = "#2A2A2A", 
    fg      = "#D0D0D0",  
    accent  = "#FF8800", 
    yellow  = "#F1FA8C",  
    green   = "#50FA7B",  
    red     = "#FF5555",  
    blue    = "#6272A4",  
    gray    = "#808080",  
},

  dark_purple = {
    bg = "#1b1625",
    bg_alt = "#241b33",
    fg = "#e5d9f2",
    accent = "#c084fc",
    yellow = "#facc15",
    green = "#4ade80",
    red = "#f87171",
    blue = "#818cf8",
    gray = "#7c6f93",
  },

  dark_graphite = {
    bg = "#121212",
    bg_alt = "#1e1e1e",
    fg = "#d4d4d4",
    accent = "#ff9800",
    yellow = "#ffca28",
    green = "#8bc34a",
    red = "#f44336",
    blue = "#64b5f6",
    gray = "#808080",
  },

  solarized_dark = {
    bg = "#002b36",
    bg_alt = "#073642",
    fg = "#93a1a1",
    accent = "#b58900",
    yellow = "#b58900",
    green = "#859900",
    red = "#dc322f",
    blue = "#268bd2",
    gray = "#657b83",
  }
  }
-- ======================
-- Save theme to disk
-- ======================
local function save_theme(name)
  vim.fn.writefile({ name }, theme_file)
end

-- ======================
-- Load theme from disk
-- ======================
local function load_theme()
  if vim.fn.filereadable(theme_file) == 1 then
    local content = vim.fn.readfile(theme_file)
    return content[1]
  end
  return nil
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

  local highlights = {
    Normal = { fg = c.fg, bg = c.bg },
    NormalNC = { fg = c.fg, bg = c.bg_alt },
    CursorLine = { bg = c.bg_alt },
    LineNr = { fg = c.gray },
    CursorLineNr = { fg = c.accent, bold = true },

    Visual = { bg = "#2a2b3d" },
    Search = { fg = c.bg, bg = c.yellow },
    IncSearch = { fg = c.bg, bg = c.accent },

    NeoTreeNormal = { fg = c.fg, bg = c.bg_alt },
    NeoTreeDirectoryName = { fg = c.blue },

    BufferLineFill = { bg = c.bg_alt },
    BufferLineBufferSelected = { fg = c.fg, bg = c.bg, bold = true },

    DiagnosticError = { fg = c.red },
    DiagnosticWarn = { fg = c.yellow },
    DiagnosticInfo = { fg = c.blue },
    DiagnosticHint = { fg = c.green },
  }

  for group, opts in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, opts)
  end

  vim.g.active_theme = name

  if persist then
    save_theme(name)
  end
end

-- ======================
-- Restore last theme
-- ======================
function M.restore()
  local last = load_theme()
  if last and M.themes[last] then
    M.apply(last, false)
  else
    M.apply("dark_orange", false) -- default fallback
  end
end

function M.get_colors()
  local name = vim.g.active_theme
  return M.themes[name]
end

return M


