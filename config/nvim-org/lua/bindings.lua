map = vim.api.nvim_set_keymap
vim.g.mapleader = ' '
-- LSP bindings: nivm/lua/plug_config/lsp_config/lsp-config.lua


-- Telescope bindings
function _find_files()
    local is_git = os.execute("git status &>/dev/null")
    if (is_git == 0) then
        vim.cmd(":Telescope git_files")
    else
        vim.cmd(":Telescope find_files")
    end
end

map('n', '<Leader>fu', ':lua_find_files()<CR>', { noremap = true, silent = true })
map('n', '<Leader>o', ':Telescope oldfiles<CR>', { noremap = true, silent = true })
map('n', '<Leader>s', ':Telescope live_grep<CR>', { noremap = true, silent = true })

-- Bracey bindings
map('n', '<Leader>b', ':Bracey<CR>', { noremap = true, silent = true })
map('n', '<Leader>bb', ':BraceyStop<CR>', { noremap = true, silent = true })
map('n', '<Leader>bbb', ':BraceyReload<CR>', { noremap = true, silent = true })

-- Bufferline bindings
map('n', 'F', ':BufferLinePick<CR>', { noremap = true, silent = true })
map('n', 'ff', ':bd<CR>', { noremap = true, silent = true })
map('n', 'z', ':ZenMode<CR>', { noremap = true, silent = true })
map('n', 'c', ':bd<CR>:ZenMode<CR>', { noremap = true, silent = true })
map('n', '<TAB>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
map('n', '<S-TAB>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
map('n', 'm.', ':BufferLineMoveNext<CR>', { noremap = true, silent = true })
map('n', 'm,', ':BufferLineMovePrev<CR>', { noremap = true, silent = true })

-- Hope bindings
map('n', ';;', ':HopWord<CR>', { noremap = true, silent = true })
map('n', ';l', ':HopLineStart<CR>', { noremap = true, silent = true })

-- LSP Diagnostics Toggle bindings
map('n', '<Leader>d', ':ToggleDiag<CR>', { noremap = true, silent = true })
map('n', '<leader>du', '<Plug>(toggle-lsp-diag-underline)', { silent = true })
map('n', '<leader>ds', '<Plug>(toggle-lsp-diag-signs)', { silent = true })
map('n', '<leader>dv', '<Plug>(toggle-lsp-diag-vtext)', { silent = true })
map('n', '<leader>di', '<Plug>(toggle-lsp-diag-update_in_insert)', { silent = true })

-- CPHelper bindings
map('n', '<Leader>c', ':CphReceive<CR>', { noremap = true, silent = true })
map('n', '<Leader>t', ':CphTest<CR>', { noremap = true, silent = true })
for i = 1, 9, 1 do
    map('n', string.format('<Leader>e%d', i),
        string.format(':CphEdit %d<CR>', i),
        { noremap = true, silent = true }
    )
end

-- Binding for code runner
map('n', '<C-z>', ':Run<CR>', { noremap = true, silent = true })

-- Other bindings nvimtree, markdown preview, Neoformat, Colorizer, LazyGit
map('n', '<F2>', ':NvimTreeToggle<CR>', { silent = true })
map('n', '<leader>md', ':MarkdownPreviewToggle<CR>', { silent = true })
map('n', '<Leader>n', ':Neoformat<CR>', { noremap = true, silent = true })
map('n', '<Leader>gg', ':LazyGit<CR>', { noremap = true, silent = true })
map('n', '<Leader>p', ':enew<CR>', { noremap = true, silent = true })
map('n', '<Leader><Space>', ':noh<CR>', { noremap = true, silent = true })
map('n', '<Leader>[', ':vertical resize +7<CR>', { noremap = true, silent = true })
map('n', '<Leader>]', ':vertical resize -7<CR>', { noremap = true, silent = true })

vim.cmd(':tnoremap <Esc> <C-\\><C-n>')
