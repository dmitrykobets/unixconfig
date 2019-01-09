if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'junegunn/vim-easy-align'
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'vim-scripts/Tabmerge'
Plug 'terryma/vim-smooth-scroll'
Plug 'tpope/vim-surround'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'majutsushi/tagbar'
Plug 'jewes/Conque-Shell'
Plug 'flazz/vim-colorschemes'
Plug 'mbbill/undotree'
Plug 'tomasiser/vim-code-dark'
Plug 'ntpeters/vim-better-whitespace'
Plug 'mhinz/vim-signify'
Plug 'aserebryakov/vim-todo-lists'
call plug#end()

syntax on
filetype plugin indent on

inoremap jj <Esc>
nnoremap ; :
nnoremap : ;
vnoremap ; :
set tabstop=4
set number
set relativenumber

noremap <silent><c-s> :update<CR>
vnoremap <silent><c-s> <c-c>:update<CR>
inoremap <silent><c-s> <c-o>:update<CR><Esc>

set laststatus=2
set statusline+=%F

set splitright

set mouse=n

set ignorecase
set smartcase

" noremap <c-p> :FZF ~/sync/VoiceServices/VoiceServices<CR>
noremap <c-p> :FZF<CR>

" smooth scroll
noremap <silent> <c-u> :call smooth_scroll#up(winheight(0)/3, 0, 1)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(winheight(0)/3, 0, 1)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(winheight(0)/2, 0, 2)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(winheight(0)/2, 0, 2)<CR>
noremap <silent> <c-k> <c-y>
noremap <silent> <c-j> <c-e>

set tabstop=4
set shiftwidth=4
set expandtab

set tags=tags

let g:tagbar_autofocus=1
let g:tagbar_autoclose=1

set hlsearch

let g:ConqueTerm_ToggleKey='<F9>'

noremap <F7> :ConqueTermTab bash<CR>
noremap <F6> :UndotreeToggle<CR>
noremap <F8> :BTags<CR>
noremap <s-F8> :Tagbar<CR>

let g:undotree_HighlightChangedText=1

inoremap <Esc> <Esc>l

set colorcolumn=120

" Sometimes need this sometimes don't
" set termguicolors
colorscheme codedark

set spelllang=en
set spell spelllang=en_us
hi clear SpellBad
hi SpellBad cterm=underline

" Don't highlight trailing whitespace (because it's annoying).
" Instead remove it on save
let g:strip_whitespace_on_save=1
let g:better_whitespace_enabled=0

let g:tagbar_width=winwidth(0)/2

set cursorline

set incsearch
