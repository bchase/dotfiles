vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Explore)

-- -- -- bchase -- --

-- jump to next error
vim.keymap.set("n", "<leader>ge", function()
  -- -- vim.diagnostic.open_float
  vim.diagnostic.goto_next({ severity=vim.diagnostic.severity.ERROR })
end)
vim.keymap.set("n", "<leader>gn", function()
  -- -- vim.diagnostic.open_float
  vim.diagnostic.goto_next()
end)

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
