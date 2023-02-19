
-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end
vim.keymap.set('n', 'w', ':lua Tog()<CR>', { silent = true })
require('packer').startup(function(use)
use({
        "andrewferrier/debugprint.nvim",
        config = function()
            require("debugprint").setup()
        end,
    })
  -- Package manager
  --
-- Enable true color
use 'uga-rosa/ccc.nvim'
-- use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
-- require("dapui").setup()

    --sass 

    local dap = require('dap')
    dap.configurations.python = {
      {
        type = 'python';
        request = 'launch';
        name = "launch file";
        program = "${file}";
        pythonpath = function()
          return '/usr/bin/python'
        end;
      },
    }

  use 'nvim-lualine/lualine.nvim' -- Fancier statusline
  use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
use({
  "folke/noice.nvim",
  config = function()
    require("noice").setup({
        -- add any options here
    })
  end,
  requires = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
    }
})

  use { -- Autocompletion
    'hrsh7th/nvim-cmp',
    requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  }
  use({
  "utilyre/barbecue.nvim",
  tag = "*",
  requires = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
})
use 'simrat39/symbols-outline.nvim'
use {'kristijanhusak/line-notes.nvim'}
  use { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',
    },
  }
use 'mfussenegger/nvim-dap'
vim.opt.termguicolors = true
use 'Vonr/align.nvim'
require("code")
-- align_to_char(length, reverse, preview, marks)
-- align_to_string(is_pattern, reverse, preview, marks)
-- align(str, reverse, marks)
-- operator(fn, opts)
-- Where:
--      length: integer
--      reverse: boolean
--      preview: boolean
--      marks: table (e.g. {1, 0, 23, 15})
--      str: string (can be plaintext or Lua pattern if is_pattern is true)

local NS = { noremap = true, silent = true }

vim.keymap.set('x' , 'aa', function() require'align'.align_to_char(1, true)             end, NS) -- Aligns to 1 character, looking left
vim.keymap.set('x' , 'as', function() require'align'.align_to_char(2, true, true)       end, NS) -- Aligns to 2 characters, looking left and with previews
vim.keymap.set('x' , 'aw', function() require'align'.align_to_string(false, true, true) end, NS) -- Aligns to a string, looking left and with previews
vim.keymap.set('x' , 'ar', function() require'align'.align_to_string(true, true, true)  end, NS) -- Aligns to a Lua pattern, looking left and with previews

-- Example gawip to align a paragraph to a string, looking left and with previews

vim.keymap.set(
    'n',
    'gaw',
    function()
        local a = require'align'
        a.operator(
            a.align_to_string,
            { is_pattern = false, reverse = true, preview = true }
        )
    end,
    NS
)

-- use {
--   "kevinhwang91/nvim-ufo",
--   opt = true,
--   event = { "BufReadPre" },
--   wants = { "promise-async" },
--   requires = "kevinhwang91/promise-async",
--   config = function()
--     require("ufo").setup {
--       provider_selector = function(bufnr, filetype)
--         return { "lsp", "treesitter", "indent" }
--       end,
--     }
--     vim.keymap.set("n", "zR", require("ufo").openAllFolds)
--     vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
--   end,
-- }
use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}
-- use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
-- require('ufo').setup({
--     provider_selector = function(bufnr, filetype, buftype)
--         return {'treesitter', 'indent'}
--     end
  --
-- })
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}
local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
for _, ls in ipairs(language_servers) do
    require('lspconfig')[ls].setup({
        capabilities = capabilities
        -- you can add other fields for setting up lsp server in this table
    })
end
vim.o.foldcolumn = '0' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = -1
vim.o.foldenable = true
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself

local handler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = ('  %d '):format(endLnum - lnum)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
        else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, {chunkText, hlGroup})
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
        end
        curWidth = curWidth + chunkWidth
    end
    table.insert(newVirtText, {suffix, 'MoreMsg'})
    return newVirtText
end

require('ufo').setup({
    fold_virt_text_handler = handler
})
-- global handler
-- `handler` is the 2nd parameter of `setFoldVirtTextHandler`,
-- check out `./lua/ufo.lua` and search `setFoldVirtTextHandler` for detail.

-- buffer scope handler
-- will override global handler if it is existed
-- local bufnr = vim.api.nvim_get_current_buf()
-- require('ufo').setFoldVirtTextHandler(bufnr, handler)



-- Example gaaip to aling a paragraph to 1 character, looking left
vim.keymap.set(
    'n',
    'gaa',
    function()
        local a = require'align'
        a.operator(
            a.align_to_char,
            { length = 1, reverse = true }
        )
    end,
    NS
)
local ccc = require("ccc")
local mapping = ccc.mapping
ccc.setup({
    -- Your favorite settings
    highlighter = {
    ---@type boolean
    auto_enable = true,
  },
})
use 'nvim-tree/nvim-web-devicons'
-- use {'romgrk/barbar.nvim', requires = 'nvim-web-devicons'}
use {
    "lewis6991/hover.nvim",
    config = function()
        require("hover").setup {
            init = function()
                -- Require providers
                require("hover.providers.lsp")
                -- require('hover.providers.gh')
                -- require('hover.providers.gh_user')
                -- require('hover.providers.jira')
                -- require('hover.providers.man')
                require('hover.providers.dictionary')
            end,
            preview_opts = {
                border = "rounded"
            },
            -- Whether the contents of a currently open hover window should be moved
            -- to a :h preview-window when pressing the hover keymap.
            preview_window = false,
            title = true
        }

        -- Setup keymaps
        vim.keymap.set("n", "K", require("hover").hover,         {desc = "hover.nvim"})
        vim.keymap.set("n", "gK", require("hover").hover_select, {desc = "hover.nvim (select)"})
    end
}
-- packer.nvim
require("line-notes").setup()
require("symbols-outline").setup()
vim.opt.spell = true
vim.opt.spelllang = { 'en_us', 'lt' }
-- using packer.nvim
use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
  require("bufferline").setup{
highlights = {
            -- indicator_selected = {
            --     fg = '#99b300',
            --     bg = '#99b300'
            -- },
            -- pick_selected = {
            --     fg = '#99b300',
            --     bg = '#99b300',
            --     bold = true,
            --     italic = true,
      
    -- }
    },
    options ={

            diagnostics = "nvim_lsp",
            diagnostics_update_in_insert = false,
            -- separator_style = "slant" | "thick" | "thin" | { 'any', 'any' },
            -- separator_style = "thin",
            always_show_bufferline = false,
        hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'}
        },

            indicator = {
                -- style = 'underline',
                style = 'none',
            },

diagnostics_indicator = function(count, level, diagnostics_dict, context)
  local icon = level:match("error") and " " or " "
  return " " .. icon .. count
end
  }

  }

-- vim.opt.spellsuggest=best
-- Packer
-- use 'NvRose/tabline'
-- use({
--   "utilyre/barbecue.nvim",
--   tag = "*",
--   requires = {
--     "SmiteshP/nvim-navic",
--     "nvim-tree/nvim-web-devicons", -- optional dependency
--   },
--   after = "nvim-web-devicons", -- keep this if you're using NvChad
--   config = function()
--     require("barbecue").setup()
--   end,
-- })
-- require("barbecue").setup()
use {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig"
}
    require("barbecue").setup()
-- use "vvvvv/yfix"
-- require("yfix").setup()
require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
})
  use 'wbthomason/packer.nvim'
  use 'onsails/lspkind.nvim'
  use { 'AlphaTechnolog/pywal.nvim'}
  use 'tpope/vim-surround'
  use 'jiangmiao/auto-pairs'

  use { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }
use { 'otavioschwanck/cool-substitute.nvim'}

-- Packer
use ({
  "jackMort/ChatGPT.nvim",
    config = function()
      require("chatgpt").setup({

        -- optional configuration
welcome_message = WELCOME_MESSAGE, -- set to "" if you don't like the fancy godot robot
  loading_text = "loading",
  question_sign = "", -- you can use emoji if you want e.g. 🙂
  answer_sign = "ﮧ", -- 🤖
  max_line_length = 120,
  yank_register = "+",
  chat_layout = {
    relative = "editor",
    position = "50%",
    size = {
      height = "80%",
      width = "80%",
    },
  },
  settings_window = {
    border = {
      style = "rounded",
      text = {
        top = " Settings ",
      },
    },
  },
  chat_window = {
    filetype = "chatgpt",
    border = {
      highlight = "FloatBorder",
      style = "rounded",
      text = {
        top = " ChatGPT ",
      },
    },
  },
  chat_input = {
    prompt = "  ",
    border = {
      highlight = "FloatBorder",
      style = "rounded",
      text = {
        top_align = "center",
        top = " Prompt ",
      },
    },
  },
  openai_params = {
    model = "text-davinci-003",
    frequency_penalty = 0,
    presence_penalty = 0,
    max_tokens = 300,
    temperature = 0,
    top_p = 1,
    n = 1,
  },
  openai_edit_params = {
    model = "code-davinci-edit-001",
    temperature = 0,
    top_p = 1,
    n = 1,
  },
  keymaps = {
    close = { "<C-c>", "<Esc>" },
    yank_last = "<C-y>",
    scroll_up = "<C-u>",
    scroll_down = "<C-d>",
    toggle_settings = "<C-o>",
    new_session = "<C-n>",
    cycle_windows = "<Tab>",
  },
      })
    end,
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
    }
})
require("semi")
require("code_reun")
  -- require("comm")
vim.keymap.set('n', 'r', ':lua Run()<CR>', { silent = true })
-- vim.keymap.set('n', 'l', ':lua Commy()<CR>', { silent = true })
  ---------------------------
--   local Input = require("nui.input")
-- local event = require("nui.utils.autocmd").event
--
-- local input = Input({
--   position = "50%",
--   size = {
--     width = 20,
--   },
--   border = {
--     style = "single",
--     text = {
--       top = "[Howdy?]",
--       top_align = "center",
--     },
--   },
--   win_options = {
--     winhighlight = "Normal:Normal,FloatBorder:Normal",
--   },
-- }, {
--   prompt = "> ",
--   default_value = "Hello",
--   on_close = function()
--     print("Input Closed!")
--   end,
--   on_submit = function(value)
--     print("Input Submitted: " .. value)
--   end,
-- })
--
-- -- mount/open the component
-- input:mount()
--
-- -- unmount component when cursor leaves buffer
-- input:on(event.BufLeave, function()
--   input:unmount()
-- end)
  ----------------------------
require("luasnip.loaders.from_vscode").lazy_load()
require'cool-substitute'.setup({
  setup_keybindings = true,
  -- mappings = {
  --   start = 'gm', -- Mark word / region
  --   start_and_edit = 'gM', -- Mark word / region and also edit
  --   start_and_edit_word = 'g!M', -- Mark word / region and also edit.  Edit only full word.
  --   start_word = 'g!m', -- Mark word / region. Edit only full word
  --   apply_substitute_and_next = 'M', -- Start substitution / Go to next substitution
  --   apply_substitute_and_prev = '<C-b>', -- same as M but backwards
  --   apply_substitute_all = 'ga', -- Substitute all
  --   force_terminate_substitute = 'g!!', -- Terminate macro (if some bug happens)
  --   terminate_substitute = '<esc>', -- Terminate macro
  --   skip_substitute = '<cr>', -- Skip this occurrence
  --   goto_next = '<C-j>', -- Go to next occurence
  --   goto_previous = '<C-k>', -- Go to previous occurrence
  -- },
  -- reg_char = 'o', -- letter to save macro (Dont use number or uppercase here)
  -- mark_char = 't', -- mark the position at start of macro
  -- writing_substitution_color = "#ECBE7B", -- for status line
  -- applying_substitution_color = "#98be65", -- for status line
  -- edit_word_when_starting_with_substitute_key = true -- (press M to mark and edit when not executing anything anything)
})
  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  -- install without yarn or npm
use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
})

  -- Git related plugins
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'lewis6991/gitsigns.nvim'
  use 'cranberry-clockworks/knife.nvim'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'

  -- Lua
use {
  "folke/twilight.nvim",
  config = function()
    require("twilight").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
       dimming = {
    alpha = 0.45, -- amount of dimming
    -- we try to get the foreground from the highlight groups or fallback color
    color = { "Normal", "#ffffff" },
    term_bg = "#000000", -- if guibg=NONE, this will be used to calculate text color
    inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
  },
  context = 13, -- amount of lines we will try to show around the current line
  treesitter = true
    }
  end
}
-- Lua
use {
  "folke/zen-mode.nvim",
  config = function()
    require("zen-mode").setup {
            plugins = {
    -- disable some global vim options (vim.o...)
    -- comment the lines to not apply the options
                    }
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}

use {
  'glepnir/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      -- config
       theme = 'hyper',
    config = {
      week_header = {
       enable = true,
      },
      shortcut = {
        { desc = ' Update', group = '@property', action = 'PackerSync', key = 'u' },
        {
          desc = ' Files',
          group = 'Label',
          action = 'Telescope find_files',
          key = 'f',
        },
        {
          desc = ' Apps',
          group = 'DiagnosticHint',
          action = 'Telescope app',
          key = 'a',
        },
        {
          desc = ' dotfiles',
          group = 'Number',
          action = 'Telescope dotfiles',
          key = 'd',
        },
      },
    },
    }
  end,
  requires = {'nvim-tree/nvim-web-devicons'}
}
  -- use 'navarasu/onedark.nvim' -- Theme inspired by Atom
    require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}
  use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
  use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically

  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

  -- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
  local has_plugins, plugins = pcall(require, 'custom.plugins')
  if has_plugins then
    plugins(use)
  end

  if is_bootstrap then
    require('packer').sync()
  end
end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})

-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'
-- vim.o.cmdwin_hide=1
-- vim.cmd("set cmdwin_hide=1")
vim.api.nvim_set_option('clipboard','unnamedplus')

-- Set colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme pywal]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


vim.keymap.set('n' , '<Tab>', ':BufferLineCycleNext <CR>', {silent = true})
-- vim.keymap.set('n', '<leader>r', ':RunCode<CR>', { noremap = true, silent = false })
-- vim.keymap.set('n', 'r', ':RunFile<CR>', { noremap = true, silent = false })
-- vim.keymap.set('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = false })
-- vim.keymap.set('n', 'c', ':RunClose<CR>', { noremap = true, silent = false })
-- vim.keymap.set('n', '<leader>crf', ':CRFiletype<CR>', { noremap = true, silent = false })
-- vim.keymap.set('n', '<leader>crp', ':CRProjects<CR>', { noremap = true, silent = false })
-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Set lualine as statusline
-- See `:help lualine.txt`

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'pywal',
    component_separators = '|',
    section_separators = '',
  },
}

-- {
--   require('cool-substitute.status').status_with_icons,
--   color = function() return { fg = require('cool-substitute.status').status_color() } end
-- }

-- Enable Comment.nvim
require('Comment').setup()

-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
require('indent_blankline').setup {
  char = '┊',
  show_trailing_blankline_indent = false,
}

-- Gitsigns
-- See `:help gitsigns.txt`
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
-- require("spell")
-- See `:help telescope.builtin`
-- vim.keymap.set("nnoremap r :lua run_current_buffer()<CR>")
-- vim.keymap.set('n', '<leader>lb', require('knife').generate_xml_doc_under_cursor(), { desc = 'Find recently opened files' })
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>k', require('telescope.builtin').keymaps, { desc = '[k] find keymaps' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
-- vim.keymap.set("n", "s", ":lua Spelly()<CR>", {noremap = true})
-- vim.keymap.set("n", "s", ":set spell!", {noremap = true})
vim.keymap.set("n", "s", function()
    -- vim.o.spell = not vim.o.spell
    vim.opt_local.spell = not(vim.opt_local.spell:get())
    print("spell: " .. tostring(vim.o.spell));
end)
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
-- vim.keymap.set('n', '<C-k>', 'yss)')
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>w', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>d', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

vim.keymap.set('n', 'cp', '"+y')

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 'lua', 'python', 'bash', 'c_sharp', 'markdown' },
  highlight = { enable = true

  },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<c-backspace>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    if vim.lsp.buf.format then
      vim.lsp.buf.format()
    elseif vim.lsp.buf.formatting then
      vim.lsp.buf.formatting()
    end
  end, { desc = 'Format current buffer with LSP' })
end

-- Setup mason so it can manage external tooling
require('mason').setup()

-- Enable the following language servers
-- Feel free to add/remove any LSPs that you want here. They will automatically be installed
local servers = { 'pyright', 'csharp_ls', 'bashls', 'marksman' }
-- Ensure the servers above are installed
require('mason-lspconfig').setup {
  ensure_installed = servers,
}

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end


-- Turn on lsp status information
require('fidget').setup()

-- Example custom configuration for lua
--
-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

require('lspconfig').sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = { library = vim.api.nvim_get_runtime_file('', true) },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = { enable = false },
    },
  },
}

-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'



local ts_utils = require("nvim-treesitter.ts_utils")
-- cmp.setup({
-- {sources = cmp.config.sources({
--       name = "nvim_lsp",
--       enty_filter = function (entry, context)
--         local kind = entry:get_kind()
--         local node = ts_utils.get_node_at_cursor():type()
--         if node == 6 "arguments" then
--           if kind == 6 then
--             return true
--       else
--       return false
--           end
--         end
--         return true
--       end,
--     },
--     })
--   })

-- local kind_icons = {
--   Text = "",
--   Method = "",
--   Function = "",
--   Constructor = "",
--   Field = "",
--   Variable = "",
--   Class = "ﴯ",
--   Interface = "",
--   Module = "",
--   Property = "ﰠ",
--   Unit = "",
--   Value = "",
--   Enum = "",
--   Keyword = "",
--   Snippet = "",
--   Color = "",
--   File = "",
--   Reference = "",
--   Folder = "",
--   EnumMember = "",
--   Constant = "",
--   Struct = "",
--   Event = "",
--   Operator = "",
--   TypeParameter = ""
-- }
-- local lspkind = require('lspkind')
-- probds do pywal sypport
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    -- ['<C-k>'] = cmp.mapping(function (fallback)
    --   if vim.fn.pumvisible() == 1 then
    --     cmp.select_prev_item()
    --   elseif has_words_before() then
    --     cmp.setu.buffer {
    --       sources = {
    --         name = 'look'
    --       }
    --     }
    --     cmp.complete()
    --   else
    --     fallback()
    --   end
    -- end,{"i", "s"}
    -- ),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  window = {
    completion = cmp.config.window.bordered({
      -- border = "shadow",
      border = 'rounded',
    winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None"}),
    documentation = { -- no border; native-style scrollbar
      border = 'rounded',
      scrollbar = '',
      -- other options
    },
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      kind.kind = " " .. (strings[1] or "") .. " "
      kind.menu = "    (" .. (strings[2] or "") .. ")"

      return kind
    end,
  },
  sorting = {
     sorting = {
    comparators = {
      cmp.config.compare.exact,
      cmp.config.compare.recently_used,
    },
  },
  },
  sources = {
    { name = 'luasnip' },
    { name = 'nvim_lsp',
      entry_filter = function (entry, context)
        local kind = entry:get_kind()
        local node = ts_utils.get_node_at_cursor():type()
        ---
        local line = context.cursor_line
        local col = context.cursor.col
        local char_before_cursor = string.sub(line, col - 1,col - 1)
        if char_before_cursor == "." then
          if kind == 2 or kind == 5 then
            return true
          else
          return false
        end
        elseif string.match(line, "^%s*%w*$") then
          if kind == 3 or kind == 6 then
            return true
          else
          return false
        end
        end
        --
        if node == "arguments" then
          if kind ==6 then
            return true
          else
            return false
          end
        end

        return true
      end,
    },
  },
}
