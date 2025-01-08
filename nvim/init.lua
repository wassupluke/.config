vim.cmd([[
" Install Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" -----------------------------------------------------------------------
" Plugins
" Vim-Plug Plugin Manager
call plug#begin('~/.vim/plugged')

" File Tree
Plug 'preservim/nerdtree'
" FZF File Finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'wakatime/vim-wakatime'
" Visuals
" ---
" Improved status line
Plug 'itchyny/lightline.vim'
" Color theme
Plug 'morhetz/gruvbox'
" Git hunk status in the gutter
Plug 'airblade/vim-gitgutter'
" Allow viewing of Hex colors in the buffer [ #fff ]
Plug 'norcalli/nvim-colorizer.lua'
Plug 'dense-analysis/ale' " async linting
Plug 'gabrielelana/vim-markdown'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

call plug#end()
" -----------------------------------------------------------------------
"
lua require("mason").setup()
lua require("mason-lspconfig").setup()

" -----------------------------------------------------------------------
" Ale

let g:ale_linters = {'css': ['csslint', 'vscodecss'], 'html': ['angular', 'htmlhint', 'tidy', 'vscodehtml'], 'python': ['flake8', 'pydocstyle', 'bandit', 'mypy'], 'markdown': ['markdownlint']}
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'], 'css': ['css-beautify', 'prettier'], 'html': ['html-beautify', 'prettier', 'tidy'], 'python': ['black', 'isort'], 'markdown': ['prettier', 'remark-lint']}
let g:ale_fix_on_save = 1

" -----------------------------------------------------------------------
"
" Native Config
" -------------

syntax on

set mouse=a

set ttyfast
set incsearch
set scrolloff=10

set number
set relativenumber
set ruler
set cursorline

set shiftwidth=4
set expandtab
set tabstop=4
set softtabstop=4
set autoindent

" Render the colors correctly
" (╯°□°）╯︵ ┻━┻
set termguicolors

" Enable copying
set clipboard=unnamedplus

" Spell Checking
" --------------

" F11 Toggle Spell Check
nnoremap <silent> <F11> :set spell!<cr>
inoremap <silent> <F11> <C-O>:set spell!<cr>
set spelllang=en

" Plugin Variables
" ----------------

" Git Gutter
set signcolumn=yes

nmap ]h <Plug>(GitGutterNextHunk) "same as default
nmap [h <Plug>(GitGutterPrevHunk) "same as default

let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'

" Gruvbox
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_tabline = '1'

" Lightline
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ }

" Enable Svelete plugin
let g:vim_svelte_plugin_load_full_syntax = 1
let g:svelte_preprocessors = ['typescript']

" Browser for Markdown
let g:mkdp_browser = 'firefox'

" Bindings
" --------


" [ ; ] - Open FZF Finder
map ; :Files<CR>

" [ Control + n ] - Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

" [ Control + c ] - Copy Visual Selection to wl-copy
vmap <C-c> y:call system("wl-copy", getreg("\""))<CR>

" Switch between windows with [ Control + h|j|k|l ]
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

" Centered half page up / down
nnoremap <silent> <C-u> <C-u>zz
nnoremap <silent> <C-d> <C-d>zz

" Colorscheme
colorscheme gruvbox
]])
