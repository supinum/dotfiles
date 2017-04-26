set nocompatible
set ic
if $TMUX == ''
  set clipboard+=unnamed
endif
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'davidoc/taskpaper.vim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'altercation/vim-colors-solarized'
Plugin 'junegunn/goyo.vim'
Plugin 'tpope/vim-surround'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'evidens/vim-twig'
Plugin 'nelsyeung/twig.vim'
Plugin 'ledger/vim-ledger'
Plugin 'bronson/vim-visual-star-search'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'vim-scripts/ReplaceWithRegister'
Plugin 'christoomey/vim-sort-motion'
Plugin 'christoomey/vim-system-copy'
Plugin 'ervandew/supertab'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mattn/emmet-vim'
Plugin 'mattn/webapi-vim'
call vundle#end()
filetype plugin indent on

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-m> :call NumberToggle()<cr>
let g:user_emmet_mode='a'  
let g:user_emmet_leader_key=','

let mapleader = ","
noremap <Leader>w :w<CR>
nmap <leader>r :! python odeo.py<CR>
nmap <leader>p "0p
nmap <leader>xx :q!<cr>
nmap <leader>nt :NERDTree<cr>

"Open NERDTree if no files specified
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" In many terminal emulators the mouse works just fine, thus enable it.
" if has('mouse')
"   set mouse=a
" endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif
au BufReadPost *.ezt set syntax=html

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
          \ if line("'\"") > 1 && line("'\"") <= line("$") |
          \   exe "normal! g`\"" |
          \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif
inoremap jj <ESC>

nmap ä /
:imap -ttt ---<CR>title: 'title'<CR>image: 'img/'<CR>---<CR># <ESC>ggj^f'ci'
nnoremap tl :tabnext<CR>
nnoremap th :tabprev<CR>
nnoremap tn :tabnew<CR>
nnoremap tc :tabclose<CR>

if has("gui_running")
  syntax on
  set hlsearch
  colorscheme macvim
  set bs=2
  set ai
endif
set ruler



nmap cpf :let @" = expand("%")<CR>OP
nmap cpp :let @" = expand("%:p")<CR>OP
iab <expr> stn strftime("%e-%b-%Y %H:%M")
iab <expr> stt strftime("%H:%M")
iab <expr> std strftime("%e-%b-%Y")

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set foldmethod=indent   
set foldnestmax=10
set nofoldenable
set foldlevel=2

imap <silent> <C-C> <C-R>=string(eval(input("Calculate: ")))<CR>

let g:AutoPairsShortcutFastWrap=''
