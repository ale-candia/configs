""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nu		" Number at the right of the screen
set rnu		" Relative numbers from current line
"set so=8	" Number of lines to show around the cursor
set sb      " A new window is put below the current one
set spr     " A new window is put right of the current one
set nowrap	" Lines go off the screen
set mouse=a " Mouse enabled in all modes

set tabstop=4
set softtabstop=4
set shiftwidth=4

set wildmenu
set wildignore=.hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor
set ic
set scs

set tw=80

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
call plug#begin(data_dir . '/plugins')

source ~/.config/nvim/plugins/gruvbox.vim
source ~/.config/nvim/plugins/lightline.vim
source ~/.config/nvim/plugins/vimrooter.vim
source ~/.config/nvim/plugins/lspconfig.vim
source ~/.config/nvim/plugins/commentary.vim
source ~/.config/nvim/plugins/telescope.vim
source ~/.config/nvim/plugins/treesitter.vim
source ~/.config/nvim/plugins/fugitive.vim

call plug#end()

set termguicolors
colorscheme gruvbox
highlight Normal guibg=NONE ctermbg=NONE

lua require('nvimcmp')
lua require('lsp')
lua require('treesitter')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Maps and Commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Old vim copying
nnoremap Y yy

let mapleader = "\<Space>"

map H ^
map L $

" Better movement
nnoremap <C-k> <C-u>
nnoremap <C-j> <C-d>
vnoremap <C-k> <C-u>
vnoremap <C-j> <C-d>

" No arrow keys --- force yourself to use the home row
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Left and right can switch buffers
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

" Move between window more easily
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Adjust window size
nnoremap <leader>< :wincmd <<CR>
nnoremap <leader>> :wincmd ><CR>

command! MakeTags !ctags -R
command! CleanTags !rm tags

"Enables vertical sfind using Vfind
:command -nargs=1 -complete=file_in_path Vfind :vert sfind <args>

" turn off highlighted text after search
vnoremap <C-h> :nohlsearch<cr>
nnoremap <C-h> :nohlsearch<cr>

" Enable ctr-backspace to erase words in insert mode
inoremap <C-H> <C-w>
cnoremap <C-H> <C-w>

" Allow gf to open non-existent files
map gf :edit <cfile><cr>

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Netrw Configuration (File Browsing)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:netrw_browse_split = 4
let g:netrw_altv = 1

let g:netrw_liststyle=3			" Default to tree mode
let g:netrw_banner=0			" Disable Banner
let g:netrw_winsize=25			" File browser width
