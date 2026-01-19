return {
  -- ================= UI =================
  { "folke/tokyonight.nvim", lazy = false, priority = 1000 },
  { "nvim-lualine/lualine.nvim" },
  { "nvim-tree/nvim-web-devicons" },

  -- ================= Buffers =================
  { "akinsho/bufferline.nvim", dependencies = "nvim-tree/nvim-web-devicons" },


  -- ================= Navigation =================
  { 
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons",  "MunifTanjim/nui.nvim"},
  },
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  -- ================= Syntax =================
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- ================= LSP =================
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },

  -- ================= Autocomplete =================
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },

  -- ================= Formatting / Lint =================
  { "stevearc/conform.nvim" },

  -- ================= Git =================
  { "lewis6991/gitsigns.nvim" },

  -- ================= UX =================
  { "folke/which-key.nvim" },
}
