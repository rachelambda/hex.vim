" Vim global plugin for editing files as hex
"
" Last Change:  2020 Mar 05
" Maintainer:   depsterr <depsterr@protonmail.com>
" License: WTFPL 2.0


function! hex#ToggleHex()
	if b:is_hex
		let b:is_hex = 0
		: %!xxd -r
	else
		let b:is_hex = 1
		: %!xxd
	endif
endfunction	

function! hex#SafeWrite()
	if b:is_hex
		let b:is_hex = 0
		let b:was_hex = 1
		: %!xxd -r
	endif
endfunction

function! hex#PostWrite()
	if b:was_hex
		: %!xxd
		let b:was_hex = 0
	endif
endfunction
