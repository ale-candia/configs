Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'

let g:lightline = {
	\ 'colorscheme': 'gruvbox',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
	\   'right': [ [ 'lineinfo' ],
	\              [ 'percent' ],
	\              [ 'fileencoding', 'filetype' ] ],
	\ },
	\ 'component_function': {
	\   'filename': 'LightlineFilename',
	\   'gitbranch': 'FugitiveHead'
	\ },
	\ }
function! LightlineFilename()
	let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
	let modified = &modified ? ' +' : ''
	return filename . modified
endfunction
set noshowmode
