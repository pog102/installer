--[[

Neovim init file
Maintainer: brainf+ck
Website: https://github.com/brainfucksec/neovim-lua

--]]
-- Import Lua modules
require('packer_init')
require('core/options')
require('core/runner')
require('core/autocmds')
require('core/keymaps')
require('plugins/dashboard')
require('plugins/autosave')
require('core/statusline')
require('plugins/indent-blankline')
require('plugins/lualine')
require('plugins/toggleTerm')
require('plugins/nvim-cmp')
require('plugins/nvim-lspconfig')

