lua require('core.init')
set splitbelow
set clipboard^=unnamed,unnamedplus

if has('unix')
	set thesaurus+=/usr/share/dict/words
endif
set noshowmode
if exists("g:neovide")
    " Neovide config
	let g:neovide_refresh_rate=30	" come on it's just a text editor
	let g:neovide_transparency=1.0
	let g:neovide_scroll_animation_length = 0.3
	let g:neovide_remember_window_size = v:true
	let g:neovide_input_use_logo=v:true	" the super/command/win key
	let g:neovide_input_macos_alt_is_meta=v:false
	let g:neovide_touch_deadzone=0.0
	let g:neovide_cursor_animation_length=0.05
	let g:neovide_cursor_trail_length=0.8
	let g:neovide_cursor_antialiasing=v:false	" i dont need it
	let g:neovide_cursor_vfx_mode = "wireframe"
	let g:neovide_remember_window_size = v:true
endif

autocmd FileType markdown setlocal spell

augroup exec_code
	autocmd!

	autocmd FileType bash,sh nnoremap <buffer> r
				\ :bash % <CR>

	autocmd FileType python nnoremap <buffer> r
				\ gg=G
				\ :w <CR> :24split <bar> term python % <CR>

	autocmd FileType cpp nnoremap <buffer> r
				\ :w <CR> :!g++ -std=c++11 % -Wall -g -o %.out && ./%.out && rm %.out <CR>

	autocmd FileType cs nnoremap <buffer> r
				\ gg=G
				\ :w <CR> :24split <bar> term mcs % &&  mono %:r.exe <CR>
augroup END

autocmd BufNewFile *.cs 0r ~/.config/nvim/blues/template.cs


if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
