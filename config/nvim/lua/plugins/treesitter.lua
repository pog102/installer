return {
  "nvim-treesitter/nvim-treesitter",
  module = true,
  event = {
    "BufReadPost", "BufNewFile"
  },
  cmd = {
    "TSInstall",
    "TSInstallInfo",
    "TSUpdate",
    "TSBufEnable",
    "TSBufDisable",
    "TSEnable",
    "TSDisable",
    "TSModuleInfo",
  },
  build = ":TSUpdate",

  config = function()
  local configs = require "nvim-treesitter.configs"
  configs.setup {
    ensure_installed = {
      'html',
      'css',
      'scss',
      'javascript',
      'python',
      'bash',
      'lua',
      'json',
      'yuck',
    },
    highlight = {
      enable = true, -- false will disable the whole extension
      disable = "", -- list of language that will be disabled
    },
    autopairs = {
      enable = true,
    },
    indent = {
      enable = true,
      disable = {}
    },
  }
  end
}
