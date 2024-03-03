---- local cmp = require("cmp")
--local cmp = require'cmp'

--cmp.setup({
--  -- mapping = {
--  --   ['<CR>'] = cmp.mapping(your_mapping_function, { 'i', 'c' })
--  -- }
--  mapping = cmp.mapping.preset.insert({
--    ['<C-n>'] = cmp.mapping.select_next_item(),
--    ['<C-p>'] = cmp.mapping.select_prev_item(),
--    ['<C-j>'] = cmp.mapping.select_next_item(),
--    ['<C-k>'] = cmp.mapping.select_prev_item(),
--    ['<C-y>'] = cmp.mapping.confirm(),
--    ['<C-l>'] = cmp.mapping.confirm(),
--    -- ['<CR>'] = cmp.mapping.confirm({ select = true }),

--    -- ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i','c'}),
--    -- ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item(), {'i','c'}),
--    --
--    -- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
--    -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
--    -- ['<C-Space>'] = cmp.mapping.complete(),
--    -- ['<C-e>'] = cmp.mapping.abort(),
--    -- ['<CR>'] = cmp.mapping.confirm({ select = true }),
--    -- -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--  }),

--  sources = cmp.config.sources({
--    { name = 'nvim_lsp', keyword_length = 1 },
--    { name = 'cmp_nvim_lsp', keyword_length = 1 },
--    -- { name = 'elixirls', keyword_length = 1 },
--    -- { name = 'vsnip' }, -- For vsnip users.
--    -- { name = 'luasnip' }, -- For luasnip users.
--    -- { name = 'ultisnips' }, -- For ultisnips users.
--    -- { name = 'snippy' }, -- For snippy users.
--  -- }, {
--    { name = 'buffer', keyword_length = 2 },
--  })
--})


--local cmp_nvim_lsp = require('cmp_nvim_lsp')

--cmp_nvim_lsp.setup()
