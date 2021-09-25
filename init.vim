set tabstop=4 softtabstop=4
set shiftwidth=4
set relativenumber
set expandtab
set smartindent
set exrc
set number
set nu
set nohlsearch
set hidden
set noerrorbells
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set signcolumn=yes
set colorcolumn=105
set signcolumn=yes
"source ~/.vim/colors/zenburn.vim
"source ~/.vim/plugged/bluewery.vim/bluewery.vim

syntax on

call plug#begin('~/.vim/plugged')
Plug 'relastle/bluewery.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'OmniSharp/omnisharp-vim'
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'valloric/MatchTagAlways'
Plug 'jiangmiao/auto-pairs'
Plug 'davidhalter/jedi-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'ryanoasis/vim-devicons'
call plug#end()

"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
nmap <C-f> :NERDTreeToggle<CR>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

autocmd VimEnter * NERDTree

filetype plugin on

" OMNISHARP: {{{
let g:OmniSharp_start_server = 1
let g:OmniSharp_server_stdio = 1
let g:omnicomplete_fetch_full_documentation = 1
let g:OmniSharp_timeout = 30
let g:OmniSharp_popup_options = {
            \ 'highlight': 'Normal',
            \ 'padding': [1],
            \ 'border': [1]
            \}
if s:using_snippets
    let g:OmniSharp_want_snippet = 1
endif

    "KEYBINDINGS: {{{
    autocmd FileType cs nmap <silent> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer><Space> :OmniSharpGetCodeActions<CR>
    "}}}
"}}}

" ALE: {{{
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
let g:ale_sign_info = '·'
let g:ale_sign_style_error = '·'
let g:ale_sign_style_warning = '·'

let g:ale_linters = { 'cs': ['OmniSharp'] }
" }}}

" THEME: {{{
colorscheme bluewery
let g:lightline = { 'colorscheme': 'bluewery' }
"}}}

" AIRLINE: {{{
let g:airline#extensions#tabline#enabled = 1
"}}}
