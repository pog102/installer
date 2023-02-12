-- in tools.lua
-- local running = false
local M = {}
function Tog()
  local line = vim.api.nvim_get_current_line()
  local last_char = string.sub(line, -1)
  if vim.bo.filetype == 'cs' then
  if last_char == ';' then
    -- remove the semicolon
    vim.api.nvim_buf_set_lines(0, vim.api.nvim_win_get_cursor(0)[1] - 1, vim.api.nvim_win_get_cursor(0)[1], false, {string.sub(line, 1, -2)})
  else
    -- add the semicolon
    vim.api.nvim_buf_set_lines(0, vim.api.nvim_win_get_cursor(0)[1] - 1, vim.api.nvim_win_get_cursor(0)[1], false, {line .. ';'})
  end
  elseif vim.bo.filetype == 'python' or vim.bo.filetype == 'lua' then
  if last_char == ',' then
    -- remove the semicolon
    vim.api.nvim_buf_set_lines(0, vim.api.nvim_win_get_cursor(0)[1] - 1, vim.api.nvim_win_get_cursor(0)[1], false, {string.sub(line, 1, -2)})
  else
    -- add the semicolon
    vim.api.nvim_buf_set_lines(0, vim.api.nvim_win_get_cursor(0)[1] - 1, vim.api.nvim_win_get_cursor(0)[1], false, {line .. ','})
  end
    
end
end

-- vim.api.nvim_command('command! -nargs=0 ToggleSemicolon lua require"myplugin".toggle_semicolon()')


return M
