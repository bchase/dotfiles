vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Explore)

-- -- -- bchase -- --

-- swap `;` / `:` in visual modes (visual & visual-block)
vim.keymap.set('x', ';', ':', { noremap = true })
vim.keymap.set('x', ':', ';', { noremap = true })

-- jump to next error
vim.keymap.set("n", "<leader>ge", function()
  -- -- vim.diagnostic.open_float
  vim.diagnostic.goto_next({ severity=vim.diagnostic.severity.ERROR })
end)
vim.keymap.set("n", "<leader>gn", function()
  -- -- vim.diagnostic.open_float
  vim.diagnostic.goto_next()
end)

-- save file then reload buffer (for running gleam `deriv`)
vim.keymap.set('n', '<Leader>s', function()
  -- 1. Save the file immediately
  vim.cmd("write")

  -- 2. Defer the reload execution by X ms
  vim.defer_fn(function()
    -- Ensure the buffer still exists before attempting to reload
    if vim.api.nvim_buf_is_valid(0) then
      vim.cmd("mkview | e! | loadview")
    end
  end, 2000)
end, { silent = true, desc = 'Save and reload file after delay, preserving view' })

-- MARKS
--   * (bchase) map leader x2 lowercase mark to jump to global mark
local low = function(i) return string.char(97+i) end
local upp = function(i) return string.char(65+i) end
for i=0,25 do vim.keymap.set("n", "<leader><leader>"..low(i),
  function() vim.cmd("normal! '"..upp(i)) end) end
-- --   * (so) use lowercase for global marks and uppercase for local marks
-- --   * (bchase) swap `m` & `'`
-- local low = function(i) return string.char(97+i) end
-- local upp = function(i) return string.char(65+i) end
-- for i=0,25 do vim.keymap.set("n", "m"..low(i), "'"..upp(i)) end
-- for i=0,25 do vim.keymap.set("n", "m"..upp(i), "'"..low(i)) end
-- for i=0,25 do vim.keymap.set("n", "'"..low(i), "m"..upp(i)) end
-- for i=0,25 do vim.keymap.set("n", "'"..upp(i), "m"..low(i)) end
-- -- -- orig per https://stackoverflow.com/a/77404322
-- -- for i=0,25 do vim.keymap.set("n", "m"..low(i), "m"..upp(i)) end
-- -- for i=0,25 do vim.keymap.set("n", "m"..upp(i), "m"..low(i)) end
-- -- for i=0,25 do vim.keymap.set("n", "'"..low(i), "'"..upp(i)) end
-- -- for i=0,25 do vim.keymap.set("n", "'"..upp(i), "'"..low(i)) end

-- show lsp code actions
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
