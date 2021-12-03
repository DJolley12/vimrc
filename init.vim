set tabstop=5 softtabstop=4
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
au FocusGained,BufEnter * :silent! checktime
au FocusLost,WinLeave * :silent! w
"source ~/.vim/colors/zenburn.vim
"source ~/.vim/plugged/bluewery.vim/bluewery.vim

syntax on

call plug#begin('~/.vim/plugged')
" Themes {{{
Plug 'relastle/bluewery.vim'
Plug 'morhetz/gruvbox'
Plug 'https://github.com/jnurmine/Zenburn.git'
Plug 'xero/sourcerer.vim'
Plug 'https://github.com/joshdick/onedark.vim.git'
Plug 'https://github.com/altercation/vim-colors-solarized.git'
Plug 'ajh17/spacegray.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'https://github.com/lifepillar/vim-solarized8.git'
Plug 'https://github.com/cocopon/iceberg.vim.git'
Plug 'https://github.com/tomasiser/vim-code-dark.git'
Plug 'liuchengxu/space-vim-theme'
Plug 'dracula/vim',{'name':'dracula'}
Plug 'https://github.com/gosukiwi/vim-atom-dark.git'
Plug 'https://github.com/doums/darcula.git'
" }}}
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
Plug 'https://github.com/ap/vim-css-color.git'
Plug 'https://github.com/jlcrochet/vim-razor.git'
"Plug 'Xuyuanp/scrollbar.nvim'
Plug 'wfxr/minimap.vim', {'do': ':!cargo install --locked code-minimap'}
Plug 'https://github.com/tpope/vim-surround.git'
"Plug 'https://github.com/xiyaowong/nvim-transparent'
Plug 'https://github.com/tpope/vim-commentary.git'
call plug#end()

" General Remappings: {{{
    let mapleader = "\<space>"
    nnoremap <Leader>bb :wa \| ! dotnet build<CR>
    nnoremap <Leader>nw :! tmux neww<CR>
    nnoremap <Leader>vs :vsplit<CR>
    nnoremap <Leader>bn :bn<CR>
    nnoremap <Leader>bp :bp<CR>
    nnoremap <Leader>bd :bd<CR>
    nnoremap <Leader>q :q<CR>
    nnoremap <Leader>w :w<CR>
    nnoremap <Leader>wq :wq<CR>
    nnoremap <Leader>wa :wa<CR>
    nnoremap <Leader>wqa :wqa<CR>
    nnoremap <Leader>qa :qa<CR>
" }}}

" COC: {{{
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
" }}}

" NERDTree: {{{
    nnoremap <expr> <C-f> g:NERDTree.IsOpen() ? ':NERDTreeClose<CR>' : @% == '' ? ':NERDTree<CR>' : ':NERDTreeFind<CR>'
    map <C-h> <C-w>h
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-w>l

    autocmd VimEnter * NERDTree

    filetype plugin on
" }}}
"
" Fzf: {{{
    nnoremap <Leader>ff :BLines<CR>
    nnoremap <Leader>p :GFiles<CR>
" }}}
" Vimspector: {{{
    let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
    nnoremap <Leader>vr :VimspectorReset<CR><CR>
    nnoremap <Leader>vw :VimspectorWatch
    nnoremap <Leader>c :call vimspector#StepOver()<CR>
" }}}

" OMNISHARP: {{{
    let g:OmniSharp_popup_position = 'peek'
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
    
        " C#
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
        "autocmd FileType cs,BufWriteCmd <silent> :OmniSharpCodeFormat<CR>
        autocmd FileType cs nnoremap <buffer><C-c><C-c> :OmniSharpCodeFormat<CR>

        autocmd FileType razor nnoremap <buffer> <Leader>dd :OmniSharpDocumentation<CR>
        autocmd FileType razor nmap <silent> gd :OmniSharpGotoDefinition<CR>
        autocmd FileType razor nnoremap <buffer> <Leader>fc :OmniSharpCodeFormat<CR>
        autocmd FileType razor nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>
        autocmd FileType razor nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>
        autocmd FileType razor nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
        autocmd FileType razor nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
        autocmd FileType razor nnoremap <buffer> <Leader>rr :OmniSharpRename<CR>
        "autocmd FileTyperazors nnoremap <buffer> <Leader>rr :OmniSharpRenameTo<CR>
        autocmd FileType razor nnoremap <Leader> <Space> :OmniSharpGetCodeActions<CR>
        "autocmd FileTyperazors,BufWriteCmd <silent> :OmniSharpCodeFormat<CR>
        autocmd FileType razor nnoremap <buffer><C-c><C-c> :OmniSharpCodeFormat<CR>

        autocmd FileType cshtml nnoremap <buffer> <Leader>dd :OmniSharpDocumentation<CR>
        autocmd FileType cshtml nmap <silent> gd :OmniSharpGotoDefinition<CR>
        autocmd FileType cshtml nnoremap <buffer> <Leader>fc :OmniSharpCodeFormat<CR>
        autocmd FileType cshtml nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>
        autocmd FileType cshtml nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>
        autocmd FileType cshtml nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
        autocmd FileType cshtml nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
        autocmd FileType cshtml nnoremap <buffer> <Leader>rr :OmniSharpRename<CR>
        "autocmd FileTypecshtmls nnoremap <buffer> <Leader>rr :OmniSharpRenameTo<CR>
        autocmd FileType cshtml nnoremap <Leader> <Space> :OmniSharpGetCodeActions<CR>
        "autocmd FileTypecshtmls,BufWriteCmd <silent> :OmniSharpCodeFormat<CR>
        autocmd FileType cshtml nnoremap <buffer><C-c><C-c> :OmniSharpCodeFormat<CR>
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

let g:ale_linters = { 'cs': ['OmniSharp'], 'rs': ['analyzer'] }

" RUST {{{
        autocmd FileType rs nnoremap <silent> gd :ALEGoToDefinition<CR>
        autocmd FileType rs nnoremap <buffer> <Leader>fu :ALEFindReferences<CR>
    " }}}
" }}}

" THEME: {{{

    "if has('termguicolors')
    "    set termguicolors
    "endif

    colorscheme sourcerer
    "colorscheme bluewery
    "colorscheme gruvbox
    "colorscheme zenburn
    "colorscheme dracula
    let g:lightline = { 'colorscheme': 'dracula' }
    "let g:lightline = { 'colorscheme': 'bluewery' }
"}}}

" AIRLINE: {{{
    let g:airline#extensions#tabline#enabled = 1
"}}}

" Scrollbar: {{{
"    augroup ScrollbarInit
"        autocmd!
"        autocmd WinScrolled,VimResized,QuitPre * silent! lua require('scrollbar').show()
"        autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()
"        autocmd WinLeave,BufLeave,BufWinLeave,FocusLost            * silent! lua require('scrollbar').clear()
"    augroup end
" }}}

" Minimap: {{{
    let g:minimap_width = 10
    let g:minimap_auto_start = 1
    left g:minimap_auto_start_win_enter = 1
    nnoremap <silent> `` :nohlsearch<CR>:call minimap#vim#ClearColorSearch()<CR>
" }}}

" nvim-transparent: {{{
    "let g:transparent_enabled = v:false
" }}}
