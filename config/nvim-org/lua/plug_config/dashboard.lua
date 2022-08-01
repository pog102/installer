-- Dashboard config
local db = require('dashboard')
vim.g.dashboard_custom_header = {
'      ████████████',
'    ██            ██',
'  ██                ██',
'██                    ██',
'██  ▓▓██        ▓▓██  ██',
'██  ████        ████  ██',
'██  ░░░░████████░░░░  ██',
'  ██░░  ████████  ░░██',
'    ██            ██  ',
'  ██  ████████████  ██',
'  ██████        ██████',
'      ██        ██',
'      ██  ████  ██',
'      ████    ████'
}

vim.g.dashboard_default_executive = 'telescope'

vim.g.dashboard_custom_section = {
    a = {
        description = { '  New File                       LDR n' },
        command = 'enew',
    },
    b = {
        description = { '  Find Files                     LDR f' },
        command = 'Telescope find_files',
    },
    c = {
        description = { '  Find History                   LDR o' },
        command = 'Telescope oldfiles',
    },
}

local plugins_count = vim.fn.len(
    vim.fn.globpath('~/.local/share/nvim/site/pack/packer/start', '*', 0, 1)
)

vim.g.dashboard_custom_footer = {
    '-- Neovim Loaded ' .. plugins_count .. ' Plugins --',
}

vim.cmd([[highlight DashboardHeader guifg=#ffffff]])

