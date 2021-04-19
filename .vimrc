" Basics
set nocompatible
set title
set number
set scrolloff=2
set backspace=indent,eol,start
set nowrap
set noerrorbells
set belloff=all
set hlsearch
set incsearch
set signcolumn=yes
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set shortmess+=c
set path=$PWD/**
set showmode
set ignorecase
set relativenumber
set clipboard=unnamed

" Default tabs & spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set shiftround
set smarttab
set smartcase
set smartindent
set autoindent
set copyindent
set cursorline

" Spellcheck me
autocmd FileType gitcommit setlocal spell
autocmd FileType markdown,md,mdx setlocal spell

" Drill Sergeant Demchuk
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
inoremap <Up> <NOP>

" Make moving between splits easier
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'

Plug 'Rigellute/rigel'

call plug#end()

" netrw
let g:netrw_banner = 0

" BEGIN auto-pairs
let g:AutoPairsMultilineClose = 0
" END auto-pairs

" BEGIN CoC
let g:coc_global_extensions = [
\   'coc-tsserver',
\   'coc-json',
\   ]

" Add eslint/prettier if installed.
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

nnoremap <silent> K :call CocAction('doHover')<CR>

" Use <Tab> and <S-Tab> to navigate autocomplete list.
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" <CR> likes to insert another return when selecting items in the autocomplete
" list. This gets around that, somehow...
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" END CoC

" BEGIN coc-prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" END coc-prettier

" BEGIN fzf
" Ignores files in .gitignore but includes untracked files.
" Reference: https://github.com/junegunn/fzf.vim/issues/121#issuecomment-575922206
nnoremap <silent> <c-p> :GFiles --cached --others --exclude-standard<cr>
"END fzf

" Theme
set statusline=%f%=%m%r%h%w%y[%04l,%04v]
set termguicolors
syntax enable
colorscheme rigel
highlight Comment cterm=italic gui=italic
