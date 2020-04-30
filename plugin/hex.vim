" Vim global plugin for editing files as hex
"
" Last Change:  2020 Feb 19
" Maintainer:   depsterr <depsterr@protonmail.com>
" License: WTFPL 2.0


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
