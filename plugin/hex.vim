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

if exists("g:loaded_hexvim")
  finish
endif
let g:loaded_hexvim = 1

" Alias the hextoggle function to a hextoggle command
command HexToggle call hex#ToggleHex()

" Defualt each buffer to not be hex
au BufReadPost,BufNewFile * let b:is_hex = 0
au BufReadPost,BufNewFile * let b:was_hex = 0

" Restore to raw data before writing
au BufWritepre * call hex#SafeWrite()
" Go back to hex editing after writing if needed
au BufWritepost * call hex#PostWrite()
