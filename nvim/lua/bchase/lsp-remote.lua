local function await_lsp_clients(bufnr)
  local clients = vim.lsp.get_clients({ bufnr = bufnr })
  if #clients > 0 then
    return true
  end
  vim.wait(500, function()
    clients = vim.lsp.get_clients({ bufnr = bufnr })
    return #clients > 0
  end, 50)
  return #clients > 0
end

function _G.show_type_definition_remote()
  local bufnr = vim.api.nvim_get_current_buf()
  local ok = await_lsp_clients(bufnr)
  if not ok then
    vim.notify("No LSP client attached after waiting.", vim.log.levels.WARN)
    return
  end

  local client = vim.lsp.get_client_by_name('gleam', bufnr)
  if client then
    -- Send the typeDefinition request and handle the result
    client.request('textDocument/typeDefinition', {
      textDocument = vim.lsp.util.make_text_document_params(bufnr),
      position = vim.lsp.util.make_position_params(),
    }, function(err, result)
      if err then
        vim.notify("LSP request failed: " .. err.message, vim.log.levels.ERROR)
        return
      end
      if result and #result > 0 then
        -- Jump to the first type definition
        vim.lsp.util.jump_to_location(result[1], 'tabe')
      else
        vim.notify("No type definition found.", vim.log.levels.INFO)
      end
    end)
  else
    vim.notify("Gleam LSP client not found.", vim.log.levels.WARN)
  end
end

-- local function sleep_os(n)
--   os.execute("sleep " .. tonumber(n)) -- For Unix-like systems
--   -- For Windows, you might use: os.execute("timeout /t " .. tonumber(n) .. " /nobreak")
-- end

-- -- Add this function to your ~/.config/nvim/init.lua
-- function ListAndApplyCodeAction(filter_text, filter_kind)
--   local bufnr = vim.api.nvim_get_current_buf()
--   local context = {}

--   -- If a kind is specified, add it to the context
--   if filter_kind then
--     context.only = filter_kind
--   end

--   vim.lsp.buf_request(bufnr, 'textDocument/codeAction', {}, function(err, result, ctx, config)
--     if err then
--       print('LSP error:', err)
--       return
--     end

--     if not result or #result == 0 then
--       print('No code actions available.')
--       return
--     end

--     local action_to_apply = nil
--     for _, action in ipairs(result) do
--       -- Look for a specific title or kind
--       if (filter_text and action.title:find(filter_text)) or (filter_kind and action.kind == filter_kind) then
--         action_to_apply = action
--         break
--       end
--     end

--     if action_to_apply then
--       print('Applying code action: ' .. action_to_apply.title)
--       vim.lsp.buf.execute_code_action(bufnr, action_to_apply)
--     else
--       print('No code action found matching filter.')
--     end
--   end)
-- end

-- function GetLspCommands()
--   local clients = vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })
--   if #clients == 0 then
--     print("No LSP client attached to the current buffer.")
--     return
--   end

--   for _, client in ipairs(clients) do
--     if client.server_capabilities.executeCommandProvider then
--       print(string.format("--- Commands for %s ---", client.name))
--       vim.print(client.server_capabilities.executeCommandProvider.commands)
--     else
--       print(string.format("LSP client '%s' does not provide executable commands.", client.name))
--     end
--   end
-- end

-- function LspCodeAction()
--   print('here')
--   sleep_os(1)
--   vim.lsp.buf.code_action()
--   print('done')
--   -- local bufnr = vim.api.nvim_get_current_buf()
--   -- vim.lsp.buf.execute_code_action(bufnr, '1')
--   -- print('done')



--   -- vim.lsp.buf_request(bufnr, 'textDocument/codeAction', {}, function(err, result, ctx, config)
--   --   if err then
--   --     print('LSP error:', err)
--   --     return
--   --   end

--   --   -- if not result or #result == 0 then
--   --   --   print('No code actions available.')
--   --   --   return
--   --   -- end

--   --   -- local action_to_apply = nil
--   --   -- for _, action in ipairs(result) do
--   --   --   print action
--   --   --   -- -- Look for a specific title or kind
--   --   --   -- if (filter_text and action.title:find(filter_text)) or (filter_kind and action.kind == filter_kind) then
--   --   --   --   action_to_apply = action
--   --   --   --   break
--   --   --   -- end
--   --   -- end

--   --   -- -- if action_to_apply then
--   --   -- --   print('Applying code action: ' .. action_to_apply.title)
--   --   -- --   vim.lsp.buf.execute_code_action(bufnr, action_to_apply)
--   --   -- -- else
--   --   -- --   print('No code action found matching filter.')
--   --   -- -- end
--   -- end)
-- end

-- function _G.yank_type_definition_text()
--   -- local params = vim.lsp.util.make_position_params()
--   local bufnr = vim.api.nvim_get_current_buf()
--   -- local client = vim.lsp.get_clients({ bufnr = bufnr })

--   -- if not client then
--   --   return vim.notify("No LSP client attached to this buffer.", vim.log.levels.WARN)
--   -- end

--   -- if not client.server_capabilities.typeDefinitionProvider then
--   --   return vim.notify("LSP server does not support type definition.", vim.log.levels.WARN)
--   -- end

--   -- Send the request to the language server
--   vim.lsp.client.request("textDocument/typeDefinition", params, function(err, result)
--     -- if err then
--     --   return vim.notify("Error getting type definition: " .. err.message, vim.log.levels.ERROR)
--     -- end

--     -- if not result or vim.tbl_isempty(result) then
--     --   return vim.notify("No type definition found.", vim.log.levels.INFO)
--     -- end

--     -- -- The result can be a single location or an array of locations.
--     -- -- We will take the first one for simplicity.
--     -- local location = type(result) == "table" and result or result
--     -- if not location or not location.uri then
--     --   return vim.notify("Invalid type definition location received.", vim.log.levels.WARN)
--     -- end

--     -- -- Get the file path from the URI
--     -- local path = vim.uri_to_fname(location.uri)
--     -- if not path then
--     --   return vim.notify("Failed to parse URI for type definition.", vim.log.levels.WARN)
--     -- end

--     -- -- Get the start and end line/column from the location
--     -- local start_line = location.range.start.line
--     -- local end_line = location.range.start.line + 1

--     -- -- Read the content of the file
--     -- local lines = vim.fn.readfile(path)
--     -- local type_definition_lines = {}
--     -- for i = start_line, end_line do
--     --   table.insert(type_definition_lines, lines[i])
--     -- end

--     -- local type_definition_text = table.concat(type_definition_lines, "\n")

--     -- -- Set the unnamed register (the default paste buffer) with the extracted text.
--     -- -- `setreg` expects a string for the register content.
--     -- vim.fn.setreg('"', type_definition_text)
--     -- -- vim.notify("Yanked type definition to unnamed register.", vim.log.levels.INFO)
--   end, bufnr)
-- end
-- -- -- Example keymap to trigger the function
-- -- vim.api.nvim_set_keymap("n", "<leader>ty", ":lua yank_type_definition_text()<CR>", { silent = true })

-- function YankTypeDefinition()
--   local params = vim.lsp.util.make_position_params()
--   vim.lsp.buf_request(0, 'textDocument/typeDefinition', params, function(_, result, _, _)
--     print result
--     if not result or vim.tbl_isempty(result) then return end
--     local uri = result[1].uri or result[1].targetUri
--     local range = result[1].range or result[1].targetSelectionRange
--     local fname = vim.uri_to_fname(uri)
--     local bufnr = vim.fn.bufadd(fname)
--     vim.fn.bufload(bufnr)
--     local lines = vim.api.nvim_buf_get_lines(bufnr, range.start.line, range["end"].line + 1, false)
--     -- vim.fn.setreg('"', table.concat(lines, '\n'))
--   end)
-- end
--
-- local function to_plain_text(contents)
--   -- convert various hover/markedstring formats to markdown lines then to plain text
--   local lines = vim.lsp.util.convert_input_to_markdown_lines(contents)
--   lines = vim.lsp.util.trim_empty_lines(lines)
--   return table.concat(lines, "\n")
-- end

-- function _G.YankTypeHover()
--   local params = vim.lsp.util.make_position_params()
--   vim.lsp.buf_request(0, "textDocument/typeDefinition", params, function(_, result)
--     if not result or vim.tbl_isempty(result) then
--       vim.notify("No typeDefinition result", vim.log.levels.WARN)
--       return
--     end

--     local target = result[1]
--     -- support either Location or LocationLink
--     local uri = target.uri or target.targetUri
--     local range = target.range or target.targetSelectionRange
--     if not uri or not range then
--       vim.notify("Unexpected typeDefinition shape", vim.log.levels.ERROR)
--       return
--     end

--     -- ask hover at the start of the returned range
--     local hover_params = { textDocument = { uri = uri }, position = range.start }
--     vim.lsp.buf_request(0, "textDocument/hover", hover_params, function(_, hover_result)
--       if hover_result and hover_result.contents then
--         local plain = to_plain_text(hover_result.contents)
--         if plain ~= "" then
--           vim.fn.setreg('"', plain)
--           vim.notify("Yanked hover text to \" register")
--           return
--         end
--       end

--       -- fallback: yank source lines of the typeDefinition target range
--       local fname = vim.uri_to_fname(uri)
--       local bufnr = vim.uri_to_bufnr(uri)
--       vim.fn.bufload(bufnr)
--       local start_l = range.start.line
--       local end_l = range["end"].line + 1
--       local lines = vim.api.nvim_buf_get_lines(bufnr, start_l, end_l, false)
--       vim.fn.setreg('"', table.concat(lines, "\n"))
--       vim.notify("Yanked typeDefinition source (fallback) to \" register")
--     end)
--   end)
-- end
-- function _G.YankHover()
--   local clients = vim.lsp.get_clients({bufnr = 0})
--   local encoding = clients[1] and clients[1].offset_encoding or "utf-16"
--   local params = vim.lsp.util.make_position_params(nil, encoding)

--   vim.lsp.buf_request(0, "textDocument/hover", params, function(_, result)
--     if not (result and result.contents) then
--       vim.notify("No hover info", vim.log.levels.WARN)
--       return
--     end
--     local lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
--     lines = vim.lsp.util.trim_empty_lines(lines)
--     local text = table.concat(lines, "\n")
--     vim.fn.setreg('t', text)
--     vim.notify("Yanked hover text to \" register")
--   end)
-- end

function _G.YankGleamHover()
  local clients = vim.lsp.get_clients({bufnr = 0})
  local encoding = clients[1] and clients[1].offset_encoding or "utf-16"
  local params = vim.lsp.util.make_position_params(nil, encoding)

  vim.lsp.buf_request(0, "textDocument/hover", params, function(_, result)
    if not (result and result.contents) then
      vim.notify("No hover info", vim.log.levels.WARN)
      return
    end
    local lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
    lines = vim.lsp.util.trim_empty_lines(lines)
    local text = lines[2]
    vim.fn.setreg('t', text)
    vim.notify("Yanked hover text to \" register")
  end)
end
