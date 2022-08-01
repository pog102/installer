return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- apperative plugins
    use 'hrsh7th/vim-vsnip'
    -- functional plugins
use {
  "folke/zen-mode.nvim",
  config = function()
    require("zen-mode").setup {
    }
  end
}
    use 'neovim/nvim-lspconfig'
    use { 'AlphaTechnolog/pywal.nvim', as = 'pywal' }
    use 'goolord/alpha-nvim'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'vimwiki/vimwiki'
    use 'hrsh7th/cmp-buffer'
    use "lukas-reineke/indent-blankline.nvim"
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/nvim-cmp'
    use 'williamboman/nvim-lsp-installer'
    use 'onsails/lspkind-nvim'
    use 'akinsho/nvim-toggleterm.lua'
    use 'windwp/nvim-autopairs'
    use 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'
    use 'terrortylor/nvim-comment'
    use 'rafamadriz/friendly-snippets'
    use 'Pocco81/AutoSave.nvim'
    use 'sbdchd/neoformat'
    use {
      'lewis6991/gitsigns.nvim',
      --requires = {
        --'nvim-lua/plenary.nvim'
      --}
    }
    use {
    'phaazon/hop.nvim',
    as = 'hop'
    }
    use {
      'akinsho/nvim-bufferline.lua',
      requires = 'kyazdani42/nvim-web-devicons'
    }
    use {
      'p00f/cphelper.nvim',
      requires = {
        'nvim-lua/plenary.nvim',
        'ygm2/rooter.nvim',
        opt = true
      }
    }
    use {
      'hoob3rt/lualine.nvim',
      requires = {
        'kyazdani42/nvim-web-devicons',
        opt = true
      }
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }


end)
