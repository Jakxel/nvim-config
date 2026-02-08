-- =========================================================
-- Keymaps configuration
-- File: lua/keymap.lua
-- =========================================================

-- Leader keys
vim.g.mapleader = " "

local keymap = vim.keymap.set

-- =========================================================
-- NORMAL MODE — BASIC
-- =========================================================

-- Save / Quit
keymap("n", "<leader>w", "<cmd>w<CR>", opts)
keymap("n", "<leader>q", "<cmd>q<CR>", opts)
keymap("n", "<leader>Q", "<cmd>qa!<CR>", opts)

-- Clear search highlight
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- File explorer (netrw)
keymap("n", "<leader>e", "<cmd>Ex<CR>", opts)

-- =========================================================
-- NAVIGATION
-- =========================================================

-- Better vertical movement with wrapped lines
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)

-- Keep cursor centered when searching
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Scroll and keep cursor centered
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- =========================================================
-- TEXT EDITING
-- =========================================================

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move lines up/down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Paste without overwriting register
keymap("x", "p", '"_dP', opts)

-- =========================================================
-- INSERT MODE
-- =========================================================

-- Fast escape from insert mode
keymap("i", "jk", "<Esc>", opts)

-- =========================================================
-- WINDOW MANAGEMENT
-- =========================================================

-- Split windows
keymap("n", "<leader>sv", "<cmd>vsplit<CR>", opts)
keymap("n", "<leader>sh", "<cmd>split<CR>", opts)

-- Move between windows
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize windows
keymap("n", "<A-h>", "<cmd>vertical resize -2<CR>", opts)
keymap("n", "<A-l>", "<cmd>vertical resize +2<CR>", opts)
keymap("n", "<A-j>", "<cmd>resize -2<CR>", opts)
keymap("n", "<A-k>", "<cmd>resize +2<CR>", opts)

-- =========================================================
-- TERMINAL
-- =========================================================

-- Open terminal in split
keymap("n", "<leader>th", "<cmd>horizontal split | terminal<CR>", opts)
keymap("n", "<leader>tv", "<cmd>vertical split | terminal<CR>", opts)

-- Exit terminal mode easily
keymap("t", "<Esc>", "<C-\\><C-n>", opts)

-- =========================================================
-- BUFFER MANAGEMENT
-- =========================================================

-- Switch buffers
keymap("n", "<leader>bn", "<cmd>bnext<CR>", opts)
keymap("n", "<leader>bp", "<cmd>bprevious<CR>", opts)

-- Close buffer
keymap("n", "<leader>bd", "<cmd>bdelete<CR>", opts)

-- =========================================================
-- CODE / LSP (safe defaults, work when LSP is attached)
-- =========================================================

keymap("n", "gd", vim.lsp.buf.definition, opts)
keymap("n", "K", vim.lsp.buf.hover, opts)
keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
keymap("n", "gr", vim.lsp.buf.references, opts)

-- ========================================================
-- Plugins
-- =========================================================

-- Format code
keymap("n", "<leader>f", function()
  vim.lsp.buf.format({ async = true })
end, opts)

-- Neo-tree shortcuts
keymap("n", "<leader>e", ":Neotree toggle<CR>")                 -- Toggle explorer
keymap("n", "<leader>o", ":Neotree focus<CR>")                  -- Focus explores
keymap("n", "<leader>E", ":Neotree reveal<CR>")                 -- Reveal current file
keymap("n", "<leader>p", ":Neotree float reveal_force_cwd<CR>") -- Open project root

-- Buffers
keymap("n", "<Tab>", ":bnext<CR>")                              -- Switch to next/previous buffer
keymap("n", "<S-Tab>", ":bprevious<CR>")
keymap("n", "<leader>bb", ":BufferLinePick<CR>")                -- Jump to buffer
keymap("n", "<leader>bd", ":bdelete<CR>") 

-- Theme picker
vim.keymap.set("n", "<leader>tt", function()
  require("config.theme_picker")()
end, { desc = "Theme picker" })

-- Close buffer
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
