vim.g.mapleader = " "
local map = vim.keymap.set

-- Basic shortcuts
map("n", "<leader>w", ":w<CR>")           -- Save
map("n", "<leader>q", ":q<CR>")           -- Quit
map("n", "<leader>h", ":nohlsearch<CR>")  -- Clear highlights

-- Neo-tree shortcuts
map("n", "<leader>e", ":Neotree toggle<CR>")                 -- Toggle explorer
map("n", "<leader>o", ":Neotree focus<CR>")                  -- Focus explores
map("n", "<leader>E", ":Neotree reveal<CR>")                 -- Reveal current file
map("n", "<leader>p", ":Neotree float reveal_force_cwd<CR>") -- Open project root

-- Buffers
map("n", "<Tab>", ":bnext<CR>")                              -- Switch to next/previous buffer
map("n", "<S-Tab>", ":bprevious<CR>")
map("n", "<leader>bb", ":BufferLinePick<CR>")                -- Jump to buffer
map("n", "<leader>bd", ":bdelete<CR>")                       -- Close buffer
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
