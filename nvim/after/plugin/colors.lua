function ColorMyPencils(color)
  color = color or "tokyonight-storm"

  if string.find(color, "tokyonight") then
    require("tokyonight").setup({
      styles = {
        keywords = { italic = false },
      },
      on_highlights = function(hl, c)
        local target_purple = "#bb9af7"

        hl["Keyword"]              = { fg = target_purple, italic = false }
        hl["@keyword"]             = { fg = target_purple, italic = false }
        hl["@keyword.conditional"] = { fg = target_purple, italic = false }
        hl["@keyword.repeat"]      = { fg = target_purple, italic = false }
        hl["@keyword.return"]      = { fg = target_purple, italic = false }
        hl["@keyword.import"]      = { fg = target_purple, italic = false }
        hl["@keyword.exception"]   = { fg = target_purple, italic = false }
        hl["@keyword.operator"]    = { fg = target_purple, italic = false }
      end,
    })
  end

  vim.cmd.colorscheme(color)
end

ColorMyPencils()
