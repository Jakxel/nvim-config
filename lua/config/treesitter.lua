local ok, ts = pcall(require, "nvim-treesitter.configs")
if not ok then
  return
end

ts.setup({
  ensure_installed = { "lua", "python", "javascript", "typescript", "bash", "json", "html", "css", "markdown" },
  sync_install = false,           -- no bloquear al instalar
  auto_install = true,            -- instalar automáticamente lenguajes faltantes
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false, -- evita conflictos con vim syntax
  },
  indent = {
    enable = true,
    disable = { "python" },       -- opcional: python a veces falla
  },
  incremental_selection = {       -- selección de nodos (IDE feature)
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  textobjects = {                -- moverse entre funciones, clases, bloques
    enable = true,
    select = {
      enable = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },
})
