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
au BufWritepre * call HexWrite()
" Go back to hex editing after writing if needed
au BufWritepost * call HexPostWrite()

function! HexToggle()
	if b:is_hex
		let b:is_hex = 0
		:%!xxd -r
	else
		let b:is_hex = 1
		:%!xxd
	endif
endfunction	

function! HexWrite()
	if b:is_hex
		let b:is_hex = 0
		let b:was_hex = 1
		:%!xxd -r
	endif
endfunction

function! HexPostWrite()
	if b:was_hex
		:%!xxd
		let b:was_hex = 0
	endif
endfunction
