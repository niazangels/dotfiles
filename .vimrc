set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set nocompatible              " be iMproved, required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'easymotion/vim-easymotion'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'

" All Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" Themes
let g:airline_theme='powerlineish'

" Hybrid line numbers
set number relativenumber

" Ctrl + s to save
inoremap <C-s> <esc>:w<cr>                 " save files
nnoremap <C-s> :w<cr>
" Ctrl + d to save and exit
inoremap <C-d> <esc>:wq!<cr>               " save and exit
nnoremap <C-d> :wq!<cr>
" Ctrl + q to quit without saving
inoremap <C-q> <esc>:q!<cr>               " quit discarding changes
nnoremap <C-q> :q!<cr>
