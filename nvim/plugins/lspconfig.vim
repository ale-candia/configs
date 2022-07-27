" Language Client and AutoComplete
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'

" For vsnip
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

let g:LanguageClient_serverCommands = {
\ 'rust': ['rust-analyzer'],
\ 'c': ['clangd'],
\ 'cpp': ['clangd'],
\ 'go': ['gopls'],
\ }

" show whole LSP messages in a floating window
nnoremap <silent> g? <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>

" AutoComplete Configuration
set completeopt=menu,menuone,noselect
