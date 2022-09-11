local M = {}

function M.config()
	-- Setup nvim-cmp.
	require'toggle_lsp_diagnostics'.init()
	local cmp = require 'cmp'
	cmp.setup({
		snippet = {
			-- REQUIRED - you must specify a snippet engine
			expand = function(args)
				-- luasnip
				require('luasnip').lsp_expand(args.body)
				-- vsnip
				-- vim.fn["vsnip#anonymous"](args.body)
				-- snippy
				-- require('snippy').expand_snippet(args.body)
				-- ultisnip
				-- vim.fn["UltiSnips#Anon"](args.body)
			end,
		},
		mapping = {
			['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
			['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
			["<Up>"] = cmp.mapping.select_prev_item(),
    ["<Down>"] = cmp.mapping.select_next_item(),
			['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
			['<C-y>'] = cmp.config.disable,
			['<Right>'] = cmp.mapping({
				i = cmp.mapping.abort(),
				c = cmp.mapping.close(),
			}),
			-- Accept currently selected item...
			-- Set `select` to `false` to only confirm explicitly selected items:
			['<CR>'] = cmp.mapping.confirm({ select = true }),
		},
		sources = cmp.config.sources({
			{ name = 'nvim_lsp' },
			{ name = 'luasnip' }, -- For luasnip users.
			-- { name = 'ultisnips' }, -- For ultisnips users.
			-- { name = 'snippy' }, -- For snippy users.
		}, { { name = 'buffer' } })
	})

	-- You can also set special config for specific filetypes:
	--    cmp.setup.filetype('gitcommit', {
	--        sources = cmp.config.sources({
	--            { name = 'cmp_git' },
	--        }, {
	--            { name = 'buffer' },
	--        })
	--    })

	-- nvim-cmp for commands
	cmp.setup.cmdline('/', {
		sources = {
			{ name = 'buffer' }
		}
	})
	cmp.setup.cmdline(':', {
		sources = cmp.config.sources({
			{ name = 'path' }
		}, {
			{ name = 'cmdline' }
		})
	})

	local has_words_before = function()
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	end

	local luasnip = require("luasnip")
	local cmp = require("cmp")

	cmp.setup({

		mapping = {

			["<C-n>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				elseif has_words_before() then
					cmp.complete()
				else
					fallback()
				end
			end, { "i", "s" }),

			["<C-p>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),

			-- ... Your other mappings ...
		},

		-- ... Your other configuration ...
	})

	-- nvim-lspconfig config
	-- List of all pre-configured LSP servers:
	-- github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	require 'lspconfig'.gopls.setup {}
	local servers = { 'ccls', 'pylsp', 'sumneko_lua' }
	for _, lsp in pairs(servers) do
		require('lspconfig')[lsp].setup {
			on_attach = on_attach
		}
	end

	local devicons = require('nvim-web-devicons')
	cmp.register_source('devicons', {
		complete = function(_, _, callback)
			local items = {}
			for _, icon in pairs(devicons.get_icons()) do
				table.insert(items, {
					label = icon.icon .. '  ' .. icon.name,
					insertText = icon.icon,
					filterText = icon.name,
				})
			end
			callback({ items = items })
		end,
	})

	local saga = require 'lspsaga'

	-- change the lsp symbol kind
	--local kind = require('lspsaga.lspkind')
	--kind[type_number][2] = icon -- see lua/lspsaga/lspkind.lua

	-- use default config
	saga.init_lsp_saga({
		border_style = "single",
		saga_winblend = 0,
		move_in_saga = { prev = '<C-p>',next = '<C-n>'},
		diagnostic_header = { " ", " ", " ", "ﴞ " },
		show_diagnostic_source = true,
		diagnostic_source_bracket = {},
		max_preview_lines = 10,
		code_action_icon = "",
		code_action_num_shortcut = true,
		code_action_lightbulb = {
			enable = true,
			sign = true,
			enable_in_insert = true,
			sign_priority = 20,
			virtual_text = true,
		},
		finder_icons = {
			def = '  ',
			ref = '諭 ',
			link = '  ',
		},
		finder_request_timeout = 1500,
		finder_action_keys = {
			open = "o",
			vsplit = "s",
			split = "i",
			tabe = "t",
			quit = "q",
			scroll_down = "<C-f>",
			scroll_up = "<C-b>", -- quit can be a table
		},
		code_action_keys = {
			quit = "q",
			exec = "<CR>",
		},
		rename_action_quit = "q",
		rename_in_select = true,
		definition_preview_icon = "  ",
		-- show symbols in winbar must nightly
		symbol_in_winbar = {
			in_custom = false,
			enable = false,
			separator = ' ',
			show_file = true,
			click_support = false,
		},
		show_outline = {
			win_position = 'right',
			win_with = '',
			win_width = 30,
			auto_enter = true,
			auto_preview = true,
			virt_text = '┃',
			jump_key = 'o',
			auto_refresh = true,
		},
		server_filetype_map = {},
	})

	require('rust-tools').setup()
require'lspconfig'.omnisharp.setup {
    cmd = { "dotnet", "/home/chad/.local/share/omnisharp-roslyn/bin/Release/OmniSharp.Stdio.Driver/net6.0/OmniSharp.dll" },

    -- Enables support for reading code style, naming convention and analyzer
    -- settings from .editorconfig.
    enable_editorconfig_support = true,

    -- If true, MSBuild project system will only load projects for files that
    -- were opened in the editor. This setting is useful for big C# codebases
    -- and allows for faster initialization of code navigation features only
    -- for projects that are relevant to code that is being edited. With this
    -- setting enabled OmniSharp may load fewer projects and may thus display
    -- incomplete reference lists for symbols.
    enable_ms_build_load_projects_on_demand = false,

    -- Enables support for roslyn analyzers, code fixes and rulesets.
    enable_roslyn_analyzers = false,

    -- Specifies whether 'using' directives should be grouped and sorted during
    -- document formatting.
    organize_imports_on_format = false,

    -- Enables support for showing unimported types and unimported extension
    -- methods in completion lists. When committed, the appropriate using
    -- directive will be added at the top of the current file. This option can
    -- have a negative impact on initial completion responsiveness,
    -- particularly for the first few completion sessions after opening a
    -- solution.
    enable_import_completion = false,

    -- Specifies whether to include preview versions of the .NET SDK when
    -- determining which version to use for project loading.
    sdk_include_prereleases = true,

    -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
    -- true
    analyze_open_documents_only = false,
}

end

return M
