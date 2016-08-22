" {{{ Plugin Install (junegunn/vim-plug)
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
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

" load vimrc in each directory
set exrc

" strip trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e
