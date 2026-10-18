-- require('lspconfig').rust_analyzer.setup = function() end
vim.lsp.config.rust_analyzer.setup = function() end

-- local lsp = require('lsp-zero')

-- lsp.preset('recommended')
-- lsp.setup()


-- -- -- ELIXIR -- --
-- require("elixir").setup({
--   nextls = {enable = false},
--   credo = {enable = true},
--   elixirls = {enable = true},
-- })


-- vim.g.lsp_zero_extend_lspconfig = 0
local lsp_zero = require('lsp-zero')
lsp_zero.extend_lspconfig()

lsp_zero.preset('recommended')
-- lsp_zero.skip_server_setup({'rust_analyzer'})
lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

lsp_zero.setup()


require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  -- ensure_installed = {'elixirls', 'gopls'},
  ensure_installed = {'elixirls', 'gopls'},
  automatic_enable = {
    exclude = { "rust_analyzer" } -- Add the LSP names you want to ignore here
  },
  handlers = {
    -- 1. This default handler catches everything EXCEPT rust_analyzer
    function(server_name)
      if server_name ~= "rust_analyzer" then
        lsp_zero.default_setup(server_name)
      end
    end,
    -- 2. Provide a blank dummy function for rust_analyzer to completely mute lsp-zero's auto-setup
    ["rust_analyzer"] = function() end,
  }
})


local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- local lspconfig = require('lspconfig')

vim.lsp.config('elixirls', {
  capabilities = capabilities,
})
-- require('lspconfig').gleam.setup({})
vim.lsp.config('gleam', {
  capabilities = capabilities,
})
vim.lsp.enable('gleam')
vim.lsp.config('gopls', {
  -- capabilities = capabilities,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
})

-- vim.lsp.config('rust_analyzer', {
--   settings = {
--     ["rust-analyzer"] = {
--       cargo = {
--         allFeatures = true,
--         buildScripts = {
--           enable = true,
--         },
--       },
--       procMacro = {
--         enable = true,
--         attributes = {
--           enable = true, -- Tracks attributes inside GPUI render loops
--         },
--       },
--       -- FIX: Change "checkOnSave" to "check"
--       check = {
--         command = "clippy",       -- Uses clippy for lints
--       },
--       diagnostics = {
--         enable = true,
--       },
--     },
--   },
-- })
-- vim.lsp.enable('rust_analyzer')
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "rust",
--   callback = function(args)
--     vim.lsp.start({ name = "rust_analyzer" }, { bufnr = args.buf })
--   end,
-- })

-- require('lspconfig')['elixirls'].setup({
--   capabilities = capabilities,
-- })
-- require('lspconfig').elixirls.setup({
--   cmd = { "/home/bosco/dev/elixir/elixir-ls/bin/language_server.sh" },
--   on_attach = on_attach,
--   capabilities = capabilities,
-- })
--
vim.lsp.config('ts_ls', {
  cmd = { '/home/bosco/.asdf/installs/nodejs/23.5.0/bin/typescript-language-server', '--stdio' },
  -- on_attach = function(client)
  --   client.server_capabilities.documentFormattingProvider = false
  -- end
})



-- local cmp = require("cmp")
local cmp = require'cmp'

cmp.setup({
  -- mapping = {
  --   ['<CR>'] = cmp.mapping(your_mapping_function, { 'i', 'c' })
  -- }
  mapping = cmp.mapping.preset.insert({
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-y>'] = cmp.mapping.confirm(),
    ['<C-l>'] = cmp.mapping.confirm(),
    -- ['<CR>'] = cmp.mapping.confirm({ select = true }),

    -- ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i','c'}),
    -- ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item(), {'i','c'}),
    --
    -- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
    -- ['<C-Space>'] = cmp.mapping.complete(),
    -- ['<C-e>'] = cmp.mapping.abort(),
    -- ['<CR>'] = cmp.mapping.confirm({ select = true }),
    -- -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),

  sources = cmp.config.sources({
    { name = 'nvim_lsp', keyword_length = 1 },
    -- { name = 'cmp_nvim_lsp', keyword_length = 1 },
    -- { name = 'elixirls', keyword_length = 1 },
    --
    -- { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  -- }, {
    { name = 'buffer', keyword_length = 1 },
  })
})
