vim.tbl_islist = vim.islist
vim.pack.add {{
  src = 'https://github.com/mrcjkb/rustaceanvim',
  version = vim.version.range('^9')
}}

-- vim.g.rustaceanvim = {
--   server = {
--     default_settings = {
--       ['rust-analyzer'] = {
--         procMacro = {
--           enable = true,
--         },
--         cargo = {
--           loadOutDirsFromCheck = true,
--         },
--         checkOnSave = {
--           command = "clippy",
--         },
--       },
--     },
--   },
-- }
-- if vim.lsp.config then
--   vim.lsp.config('rust-analyzer', {
--     settings = {
--       procMacro = { enable = true },
--       cargo = { loadOutDirsFromCheck = true },
--       checkOnSave = { command = "clippy" },
--       -- ["rust-analyzer"] = {
--       --   procMacro = { enable = true },
--       --   cargo = { loadOutDirsFromCheck = true },
--       --   checkOnSave = { command = "clippy" },
--       -- }
--     }
--   })
-- end
-- -- require("lspconfig").rust_analyzer.setup({
-- --   settings = {
-- --     ["rust-analyzer"] = {
-- --       procMacro = {
-- --         enable = true,
-- --       },
-- --       cargo = {
-- --         buildScripts = {
-- --           enable = true,
-- --         },
-- --       },
-- --     },
-- --   },
-- -- })

require("bchase.remap")
require("bchase.packer")
require("bchase.lsp-remote")

vim.opt.guicursor = ""

-- vim.opt.nu = true
-- vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- vim.opt.scrolloff = 8
-- vim.opt.signcolumn = "yes"
-- vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- vim.opt.colorcolumn = "80"

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("FixTerraformCommentString", { clear = true }),
  callback = function(ev)
    vim.bo[ev.buf].commentstring = "// %s"
  end,
  pattern = { "gleam" },
})

vim.g.netrw_browsex_viewer = "xdg-open"

vim.g.loaded_matchit = 0
-- vim.g.loaded_netrw = 0
vim.cmd('packadd matchit')

-- -- RUST -- https://rsdlt.github.io/posts/rust-nvim-ide-guide-walkthrough-development-debug/
-- --
-- local rt = require("rust-tools")

-- rt.setup({
--   -- server = {
--   --   on_attach = function(_, bufnr)
--   --     -- Hover actions
--   --     vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
--   --     -- Code action groups
--   --     vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
--   --   end,
--   -- },
-- })

-- -- LSP Diagnostics Options Setup
-- local sign = function(opts)
--   vim.fn.sign_define(opts.name, {
--     texthl = opts.name,
--     text = opts.text,
--     numhl = ''
--   })
-- end

-- sign({name = 'DiagnosticSignError', text = ''})
-- sign({name = 'DiagnosticSignWarn', text = ''})
-- sign({name = 'DiagnosticSignHint', text = ''})
-- sign({name = 'DiagnosticSignInfo', text = ''})

-- vim.diagnostic.config({
--     virtual_text = false,
--     signs = true,
--     update_in_insert = true,
--     underline = true,
--     severity_sort = false,
--     float = {
--         border = 'rounded',
--         source = 'always',
--         header = '',
--         prefix = '',
--     },
-- })

-- vim.cmd([[
-- set signcolumn=yes
-- autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
-- ]]))

-- -- Vimspector options
-- vim.cmd([[
-- let g:vimspector_sidebar_width = 85
-- let g:vimspector_bottombar_height = 15
-- let g:vimspector_terminal_maxwidth = 70
-- ]])
-- -- Vimspector
-- vim.cmd([[
-- nmap <F9> <cmd>call vimspector#Launch()<cr>
-- nmap <F5> <cmd>call vimspector#StepOver()<cr>
-- nmap <F8> <cmd>call vimspector#Reset()<cr>
-- nmap <F11> <cmd>call vimspector#StepOver()<cr>")
-- nmap <F12> <cmd>call vimspector#StepOut()<cr>")
-- nmap <F10> <cmd>call vimspector#StepInto()<cr>")
-- ]])
-- map('n', "Db", ":call vimspector#ToggleBreakpoint()<cr>")
-- map('n', "Dw", ":call vimspector#AddWatch()<cr>")
-- map('n', "De", ":call vimspector#Evaluate()<cr>")
