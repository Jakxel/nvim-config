local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
  return
end

-- Opcional: suprimir advertencias temporales
vim.notify = function() end

-- Configura LSP como siempre
if lspconfig.lua_ls then
  lspconfig.lua_ls.setup({
    on_attach = function(client, bufnr)
      local map = function(mode, lhs, rhs)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
      end
      map("n", "gd", vim.lsp.buf.definition)
      map("n", "K", vim.lsp.buf.hover)
      map("n", "<leader>rn", vim.lsp.buf.rename)
    end,
    settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        diagnostics = { globals = { "vim" } },
        workspace = { library = vim.api.nvim_get_runtime_file("", true) },
        telemetry = { enable = false },
      },
    },
  })
end

if lspconfig.pyright then
  lspconfig.pyright.setup({ on_attach = on_attach })
end

-- =============================-- =============================
-- LSP seguro sin tsserver ni warnings
-- =============================


local has_mason, mason = pcall(require, "mason")
local has_mason_lsp, mason_lsp = pcall(require, "mason-lspconfig")
local has_lspconfig, lspconfig = pcall(require, "lspconfig")

if not (has_mason and has_mason_lsp and has_lspconfig) then
  vim.notify("Faltan plugins LSP", vim.log.levels.WARN)
  return
end

-- Inicia Mason
mason.setup()
mason_lsp.setup({
  ensure_installed = { "lua_ls", "pyright" },
})

-- Atajos LSP
local on_attach = function(client, bufnr)
  local map = function(mode, lhs, rhs, opts)
    opts = opts or {}
    opts.buffer = bufnr
    vim.keymap.set(mode, lhs, rhs, opts)
  end

  map("n", "gd", vim.lsp.buf.definition)
  map("n", "K", vim.lsp.buf.hover)
  map("n", "<leader>rn", vim.lsp.buf.rename)
  map("n", "<leader>ca", vim.lsp.buf.code_action)
  map("n", "<leader>f", vim.lsp.buf.format)
end

-- =============================
-- Configuración Lua LSP
-- =============================
if lspconfig.lua_ls then
  lspconfig.lua_ls.setup({
    on_attach = on_attach,
    settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        diagnostics = { globals = { "vim" } },
        workspace = { library = vim.api.nvim_get_runtime_file("", true) },
        telemetry = { enable = false },
      },
    },
  })
end

-- =============================
-- Configuración Python LSP
-- =============================
if lspconfig.pyright then
  lspconfig.pyright.setup({
    on_attach = on_attach,
  })
end
