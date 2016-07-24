" {{{ Plugin Install (junegunn/vim-plug)
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'joonty/vim-phpqa'
call plug#end()

" }}}
" {{{ File setting

" list of character coding when load an existing file
set fileencodings=utf-8,euc-jp,sjis,cp932,iso-2022-jp

syntax on
colorscheme solarized

" show the number and relative number of line
set relativenumber

" use spaces instead of tabs
set expandtab

" use 4 spaces for a tab
set tabstop=4
set shiftwidth=4

" keep indent when create new line
set autoindent

" insert indent when insert the content of function
set smartindent

" }}}
" {{{ searching and indexing

" enable enhanced command-line completion
set wildmode=longest,list

" load vimrc in each directory
set exrc

" strip trailing whitespaces
autocmd BufWritePre,FileWritePre * :%s/\s\+$//e | %s/\r$//e

" }}}
" {{{ Plugin setting

" vim-phpqa
let g:phpqa_messdetector_autorun = 0
let g:phpqa_codesniffer_autorun = 0
