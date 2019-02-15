if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'junegunn/vim-easy-align'
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
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
Plug 'lervag/vimtex'
Plug 'brennier/quicktex'
Plug 'Valloric/YouCompleteMe'
Plug 'artur-shaik/vim-javacomplete2'
" Plug 'typeintandem/vim'
" Plug 'w0rp/ale'
Plug   'KeitaNakamura/tex-conceal.vim', {'for': 'tex'} " for VimPlug
call plug#end()

syntax on
filetype off
filetype plugin indent on

augroup vimtex_config
    autocmd User VimtexEventInitPost VimtexCompile
augroup END

set conceallevel=2
let g:tex_conceal="abdgm"

source ~/.vim/plugged/quicktex/ftplugin/tex.vim

if !exists('g:ycm_semantic_triggers')
let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme

" autocmd FileType java setlocal omnifunc=javacomplete#Complete
nmap <leader>jR <Plug>(JavaComplete-Imports-RemoveUnused) <Plug>(JavaComplete-Imports-AddMissing)

inoremap jj <Esc>l
nnoremap ; :
nnoremap : ;
vnoremap ; :
set tabstop=4
set number
set relativenumber

noremap <silent><c-s> :update<CR>l
inoremap <silent><c-s> <c-o>:update<CR><Esc>l

set laststatus=2
set statusline+=%F

set splitright

set mouse=a

set ignorecase
set smartcase
set smartindent

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

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\" zz" | endif
endif



" Auto pastemode
" Pressing ctrl-shift-v will automagically enter pastemode, paste the text,
" and exit paste mode
" Obtained from: https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode
" Apparently special consideration has to be taken if using tmux
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" Auto

" Format code

function! Format()
    normal gg=G ''
endfunction

nnoremap <s-H> :call Format()<CR>

