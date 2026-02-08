local ok, ts = pcall(require, "nvim-treesitter.configs")
if not ok then
  return
end

ts.setup({
  -- ======================
  -- Language parsers
  -- ======================
  ensure_installed = {
    "lua",
    "python",
    "javascript",
    "typescript",
    "bash",
    "json",
    "html",
    "css",
    "markdown",
    "c",
    "cpp",
    "latex",
    "asm",
    "nasm",
    "rust"
  },

  sync_install = false,
  auto_install = true,

  -- ======================
  -- Highlighting
  -- ======================
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  -- ======================
  -- Indentation
  -- ======================
  indent = {
    enable = true,
    disable = {
      "python", -- known issues
      "latex",  -- Tree-sitter indent is unstable here
    },
  },

  -- ======================
  -- Incremental selection
  -- ======================
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection    = "gnn",
      node_incremental  = "grn",
      scope_incremental = "grc",
      node_decremental  = "grm",
    },
  },

  -- ======================
  -- Textobjects (C / C++ friendly)
  -- ======================
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },
})
