local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  snippet = {
    -- REQUIRED: tells cmp how to expand snippets
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()   -- Move to next completion item
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump() -- Expand or jump snippet
      else
        fallback()
      end
    end, { "i", "s" }),
    
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()   -- Move to previous completion item
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)         -- Jump backwards in snippet
      else
        fallback()
      end
    end, { "i", "s" }),
    
    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Enter to confirm
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
  },
})


