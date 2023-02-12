-- in tools.lua
local api = vim.api
-- local running = false
local M = {}

function run_file(filetype, filepath)
  -- determine how to run the file based on filetype
  local command
  if filetype == 'python' then
    command = 'python ' .. filepath
  elseif filetype == 'javascript' then
    command = 'node ' .. filepath
  elseif filetype == 'cs' then
    command = 'dotnet run'
  else
    -- default to running the file in a shell
    command = 'sh ' .. filepath
  end

  -- split the buffer and run the file in the new buffer
 api.nvim_command('rightbelow vertical split')
api.nvim_command('set noruler')
  api.nvim_command('setlocal winfixwidth')
  api.nvim_command('setlocal winwidth=10')
  api.nvim_command('setlocal nobuflisted')
  api.nvim_command('terminal ' .. command)
  -- api.nvim_command('terminal ++on-exit bdelete _ ' .. command)
end

function run_current_file()
  local filetype = api.nvim_buf_get_option(0, 'filetype')
  local filepath = api.nvim_buf_get_name(0)
  run_file(filetype, filepath)
end

-- bind the function to a key mapping
api.nvim_set_keymap('n', '<leader>r', ':lua run_current_file()<CR>', {noremap=true})

return M
