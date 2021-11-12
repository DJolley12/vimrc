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
set autoread
set mouse=a
au CursorHold * checktime
"source ~/.vim/colors/zenburn.vim
"source ~/.vim/plugged/bluewery.vim/bluewery.vim

syntax on

call plug#begin('~/.vim/plugged')
Plug 'relastle/bluewery.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'OmniSharp/omnisharp-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
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
Plug 'puremourning/vimspector'
Plug 'rust-lang/rust.vim'
Plug 'xero/sourcerer.vim'
call plug#end()

" General Remappings: {{{
nnoremap <Leader>bb :wa \| ! dotnet build<CR>
nnoremap <Leader>nw :! tmux neww<CR>
" }}}

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
" NERDTree: {{{
nmap <C-f> :NERDTreeToggle<CR>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

autocmd VimEnter * NERDTree

filetype plugin on
" }}}
" Fzf: {{{
nnoremap <Leader>ff :BLines<CR>
" }}}
" Vimspector: {{{
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
nnoremap <Leader>vr :VimspectorReset<CR><CR>
nnoremap <Leader>vw :VimspectorWatch
nnoremap <Leader>c :call vimspector#StepOver()<CR>
" }}}

" OMNISHARP: {{{
let g:OmniSharp_start_server = 1
let g:OmniSharp_server_stdio = 1
let g:omnicomplete_fetch_full_documentation = 1
let g:OmniSharp_timeout = 30
let g:OmniSharp_popup_options = {
            \ 'highlight': 'Normal',
            \ 'padding': [0, 0, 0, 0],
            \ 'border': [1]
            \}
"let g:OmniSharp_selector_ui = 'ctrlp'
if has('nvim')
    let g:OmniSharp_popup_options = {
                \ 'winhl': 'Normal:NormalFloat'
                \}
else
    let g:OmniSharp_popup_options = {
                \ 'highlight': 'Normal',
                \ 'padding': [0, 0, 0, 0],
                \ 'border': [1]
                \}
endif
let g:OmniSharp_popup_mappings = {
            \ 'sigNext': '<C-n>',
            \ 'sigPrev': '<C-p>',
            \ 'pageDown': ['<C-f>', '<PageDown>'],
            \ 'pageUp': ['<C-b>', '<PageUp>']
            \}

    "KEYBINDINGS: {{{
    autocmd FileType cs nnoremap <buffer> <Leader>dd :OmniSharpDocumentation<CR>
    autocmd FileType cs nmap <silent> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fc :OmniSharpCodeFormat<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>rr :OmniSharpRename<CR>
    "autocmd FileType cs nnoremap <buffer> <Leader>rr :OmniSharpRenameTo<CR>
    autocmd FileType cs nnoremap <Leader> <Space> :OmniSharpGetCodeActions<CR>
    autocmd FileType rs nnoremap <silent> gd :ALEGoToDefinition<CR>
    autocmd FileType rs nnoremap <buffer> <Leader>fu :ALEFindReferences<CR>
    "}}}
"}}}

" ALE: {{{
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
let g:ale_sign_info = '·'
let g:ale_sign_style_error = '·'
let g:ale_sign_style_warning = '·'
let g:ale_completion_autoimport = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

let g:ale_linters = { 'cs': ['OmniSharp'] }
" }}}

" THEME: {{{

"if has('termguicolors')
"    set termguicolors
"endif

"colorscheme sourcerer
colorscheme bluewery
let g:lightline = { 'colorscheme': 'bluewery' }
"}}}

" AIRLINE: {{{
let g:airline#extensions#tabline#enabled = 1
"}}}
