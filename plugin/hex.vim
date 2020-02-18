" Vim global plugin for editing files as hex
" Last Change:  2020 Feb 18
" Maintainer:   depsterr <dragonvale09@gmail.com>
" License:      WTFPL (see lisence file)

" Make sure plugin is only loaded once
if exists("g:loaded_hexvim")
  finish
endif
let g:loaded_hexvim = 1

" Alias the hextoggle function to a hextoggle command
command HexToggle call HexToggle()

" Defualt each buffer to not be hex
au BufReadPost,BufNewFile * let b:is_hex = 0
au BufReadPost,BufNewFile * let b:was_hex = 0

" Restore to raw data before writing
au BufWritepre * call s:write()
" Go back to hex editing after writing if needed
au BufWritepost * call s:postwrite()

function! HexToggle()
	if b:is_hex
		let b:is_hex = 0
		:%!xxd -r
	else
		let b:is_hex = 1
		:%!xxd
	endif
endfunction	

function! s:prewrite()
	if b:is_hex
		let b:is_hex = 0
		let b:was_hex = 1
		:%!xxd -r
	endif
endfunction

function! s:postwrite()
	if b:was_hex
		:%!xxd
		let b:was_hex = 0
	endif
endfunction
