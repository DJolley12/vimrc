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
set completeopt=menu,menuone,noselect

"syntax on

call plug#begin('~/.nvim/plugged')
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
Plug 'https://github.com/sickill/vim-monokai.git'
Plug 'https://github.com/TroyFletcher/vim-colors-synthwave.git'
Plug 'artanikin/vim-synthwave84'
Plug 'https://github.com/fcpg/vim-farout.git'
Plug 'burntcarrot/punchy.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'mhartington/oceanic-next'
Plug 'https://github.com/iandwelker/rose-pine-vim.git'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
" }}}

" Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
Plug 'https://github.com/zchee/deoplete-go'
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
Plug 'honza/vim-snippets'
Plug 'https://github.com/tpope/vim-dadbod.git', {'do': ':CocInstall coc-db'}
Plug 'https://github.com/kristijanhusak/vim-dadbod-ui.git'
Plug 'nanotee/sqls.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'deoplete-plugins/deoplete-clang'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'williamboman/nvim-lsp-installer'

Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'ray-x/guihua.lua' " float term, codeaction and codelens gui support

Plug 'ray-x/go.nvim'
Plug 'TimUntersberger/neogit'
Plug 'nvim-lua/plenary.nvim'
Plug 'sindrets/diffview.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" nvim-cmp
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'

" For luasnip users.
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

call plug#end()

" LUA: {{{
lua <<EOF
    require('treesitter')
    require('devicons-config')
    require('diffview-config')
    require('neogit-config')
    require('db')
    require('sqls')
    require('cmp-setup')
    require('go-nvim')
    require('lsp-installer')
EOF
" }}}

" DB, sqls lspconfig {{{
" }}}

" General Remappings: {{{
    let mapleader = "\<space>"
    nnoremap <Leader>gc :execute '!git commit -m "'.input('Enter message: ').'"'<cr>
    nnoremap <Leader>ga :execute '!git add .'<cr>
    nnoremap <Leader>gp :execute '!git push -u origin .'<cr>
    nnoremap <Leader>nw :! tmux neww<CR>
    nnoremap <Leader>vs :vsplit<CR>
    nnoremap <Leader>hs :split<CR>
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
    " inoremap <silent><expr> <TAB>
    "       \ pumvisible() ? "\<C-n>" :
    "       \ <SID>check_back_space() ? "\<TAB>" :
    "       \ coc#refresh()
    " imap <C-l> <Plug>(coc-snippets-expand-jump)
    " vmap <C-j> <Plug>(coc-snippets-select)
    " let g:coc_snippet_prev = '<c-k>'
" }}}

" NERDTree: {{{
    nnoremap <expr> <C-f> g:NERDTree.IsOpen() ? ':NERDTreeClose<CR>' : @% == '' ? ':NERDTree<CR>' : ':NERDTreeFind<CR>'
    map <C-h> <C-w>h
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-w>l

    "autocmd VimEnter * NERDTree

    filetype plugin on
" }}}
"
" Fzf: {{{
    nnoremap <Leader>ff :BLines<CR>
    "nnoremap <C-f> :Rg 
    nnoremap <Leader>p :GFiles<CR>
    nnoremap <C-p> :Files<CR>
    "command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
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
    let g:OmniSharp_server_use_net6 = 1
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
        autocmd FileType cs nnoremap <Leader>ar :execute '!dotnet add '.input('Enter project: ').' reference '.input('Enter reference: ').''<cr>
        autocmd FileType cs nnoremap <Leader>acr :execute '!dotnet add reference '.input('Enter reference: ').''<cr>
        autocmd FileType cs nnoremap <Leader>bb :wa \| ! dotnet build<CR>
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
        nnoremap <Leader>rc :! tmux splitw -v tmux send-keys "dotnet run" ENTER<CR>

        "autocmd FileType razor nnoremap <Leader>bb :wa \| ! dotnet build<CR>
        "autocmd FileType razor nnoremap <buffer> <Leader>dd :OmniSharpDocumentation<CR>
        "autocmd FileType razor nmap <silent> gd :OmniSharpGotoDefinition<CR>
        "autocmd FileType razor nnoremap <buffer> <Leader>fc :OmniSharpCodeFormat<CR>
        "autocmd FileType razor nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>
        "autocmd FileType razor nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>
        "autocmd FileType razor nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
        "autocmd FileType razor nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
        "autocmd FileType razor nnoremap <buffer> <Leader>rr :OmniSharpRename<CR>
        ""autocmd FileTyperazors nnoremap <buffer> <Leader>rr :OmniSharpRenameTo<CR>
        "autocmd FileType razor nnoremap <Leader> <Space> :OmniSharpGetCodeActions<CR>
        ""autocmd FileTyperazors,BufWriteCmd <silent> :OmniSharpCodeFormat<CR>
        "autocmd FileType razor nnoremap <buffer><C-c><C-c> :OmniSharpCodeFormat<CR>

        autocmd FileType cshtml nnoremap <Leader>bb :wa \| ! dotnet build<CR>
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

let g:ale_linters = { 'cs': ['OmniSharp'], 'rust': ['analyzer'], 'cpp': ['clang'], 'c': ['clang'], 'python': ['pylint'] }
" let g:ale_linters = { 'cs': ['OmniSharp'], 'cpp': ['clang'], 'c': ['clang'], 'python': ['pylint'] }

" custom setting for clangformat
let g:neoformat_cpp_clangformat = {
    \ 'exe': 'clang-format',
    \ 'args': ['--style="{IndentWidth: 4}"']
\}
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']

" RUST {{{
        autocmd FileType rs nnoremap <Leader>bb :wa \| ! cargo build<CR>
        autocmd FileType rs nnoremap <Leader>bu :wa \| ! cargo update<CR>
        autocmd FileType rs nnoremap <silent> gd :ALEGoToDefinition<CR>
        autocmd FileType rs nnoremap <buffer> <Leader>fu :ALEFindReferences<CR>
    " }}}
" }}}
"
" GO {{{
    " autocmd BufWritePre *.go :silent! lua require('go.format').gofmt()
    " :lua require('go').setup()
    " if has('nvim')" Enable deoplete on startuplet g:deoplete#enable_at_startup = 1
    " endif
    "     :lua require'lspconfig'.gopls.setup {
    "         on_attach = function(client)
    "         require 'illuminate'.on_attach(client)
    "     end,
    "     }
" }}}

" THEME: {{{

    "if has('termguicolors')
    "    set termguicolors
    "endif

    syntax enable
    " colorscheme sourcerer
    " colorscheme bluewery
    let g:gruvbox_contrast_dark = 'medium' 
    let g:gruvbox_contrast_dark = 'soft' 
    let g:gruvbox_underline=1
    let g:gruvbox_bold=1
    let g:gruvbox_italic=1
    let g:gruvbox_transparent_bg = 1
    ""medium, hard, soft
    " colorscheme gruvbox
    colorscheme tokyonight
    " let g:spacegray_low_contrast = 1
    " colorscheme spacegray
    hi! Normal ctermbg=NONE guibg=NONE
    " set termguicolors
    "colorscheme PaperColor
    "colorscheme zenburn
    "colorscheme dracula
    " colorscheme OceanicNext
    " colorscheme rose-pine-dark
    " let g:lightline = { 'colorscheme': 'dracula' }
    "let g:lightline = { 'colorscheme': 'bluewery' }
    if (has("termguicolors"))
        set termguicolors
    endif
    if (has("nvim"))
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    " let g:enable_bold_font = 1
    " let g:enable_italic_font = 1
    " let g:hybrid_transparent_background = 1
    " colorscheme hybrid_material
    let g:airline_theme = "hybrid"
    " let g:airline_theme = "tokyonight"
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
