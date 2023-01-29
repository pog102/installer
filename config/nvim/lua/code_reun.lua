-- in tools.lua
local api = vim.api
-- local running = false
local M = {}
function Run()

   local filetype = vim.bo.filetype
   if filetype == 'python' then
     api.nvim_command("execute '!python %'")
   elseif filetype == 'javascript' then
     api.nvim_command("execute '!node %'")
   elseif filetype == 'sh' then
     api.nvim_command("execute '!sh %'")
   elseif filetype == 'cs' then
     -- api.nvim_command("call nui#start")
     api.nvim_command("execute '!dotnet run'")
   else
     api.nvim_command("echom 'Filetype not supported'")
     return
   end
end
return M
