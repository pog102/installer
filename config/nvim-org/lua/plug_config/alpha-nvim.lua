
--[[--------------------------------------]]--
--        alpha-nvim - welcome screen       --
--               Author: Elai               --
--              License: GPLv3              --
--[[--------------------------------------]]--

-- Call Alpha With A pcall
local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

-- Enable Alpha Dashboard
local dashboard = require("alpha.themes.dashboard")

-- Remove These ~ ~ ~
vim.opt.fillchars:append { eob = " " }

-- Disable Status Line so that alpha dashboard look nice
vim.cmd [[ au User AlphaReady if winnr('$') == 1 | set laststatus=1 ]]

-- Custom Footer
dashboard.section.footer.val = {
  "Write Programs That Do One Thing And Do It Well.",
}

-- Custom Section
dashboard.section.buttons.val = {
	-- dashboard.button("n", "  Create New file",       ":set laststatus=3 | :ene <BAR> startinsert <CR>"),
	dashboard.button("o", "  Find History",       ":Telescope oldfiles <CR>"),
	dashboard.button("f", "  Find Files",       ":Telescope find_files <CR>"),
	dashboard.button("s", "  Find words",       ":Telescope live_grep <CR>"),
	dashboard.button("u", " diary",       ":e ~/vimwiki/index.wiki <CR>"),
	dashboard.button("v", "  Update Nvim Plugins",   ":PackerSync <CR>"),
	dashboard.button("q", "  Quit Neovim",           ":qa<CR>"),
}

-- LuaVim Ascii Art
dashboard.section.header.val = {
  [[██╗     ██╗   ██╗  █████╗  ██╗   ██╗ ██╗ ███╗   ███╗]],
  [[██║     ██║   ██║ ██╔══██╗ ██║   ██║ ██║ ████╗ ████║]],
  [[██║     ██║   ██║ ███████║ ██║   ██║ ██║ ██╔████╔██║]],
  [[██║     ██║   ██║ ██╔══██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║]],
  [[███████╗╚██████╔╝ ██║  ██║  ╚████╔╝  ██║ ██║ ╚═╝ ██║]],
  [[╚══════╝ ╚═════╝  ╚═╝  ╚═╝   ╚═══╝   ╚═╝ ╚═╝     ╚═╝]],
}

-- Layout For Luavim ascii art
dashboard.config.layout = {
  { type = "padding", val = 5 },
  dashboard.section.header,
  { type = "padding", val = 2 },
  dashboard.section.buttons,
  { type = "padding", val = 1 },
  dashboard.section.footer,
}

alpha.setup(dashboard.opts)

