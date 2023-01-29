-- in tools.lua
-- local running = false
local M = {}

-- vim.api.nvim_command('command! -nargs=0 ToggleSemicolon lua require"myplugin".toggle_semicolon()')

 function Spelly()
   local spelllang = vim.api.nvim_get_option("spelllang")
   if spelllang == "en_us" then
     vim.api.nvim_set_option("spelllang", "")
    print("nothing")
   else
     vim.api.nvim_set_option("spelllang", "en_us")
    print("english")
   end
 end

return M
