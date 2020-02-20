" Vim global plugin for editing files as hex
"
" Last Change:  2020 Feb 19
" Maintainer:   depsterr <depsterr@protonmail.com>
" License:
"
" DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE 
" Version 2, December 2004 
"
" Copyright (C) 2004 Sam Hocevar <sam@hocevar.net> 
"
" Everyone is permitted to copy and distribute verbatim or modified 
" copies of this license document, and changing it is allowed as long 
" as the name is changed. 
"
" DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE TERMS AND CONDITIONS FOR
" COPYING, DISTRIBUTION AND MODIFICATION 
"
"  0. You just DO WHAT THE FUCK YOU WANT TO.
"

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
