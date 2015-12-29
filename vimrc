" {{{ Plugin Install (junegunn/vim-plug)
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin('~/.vim/plugged')
Plug 'raimondi/delimitmate'                 " automatic closing of quotes, brackets, parentheses
Plug 'tpope/vim-commentary'                 " write comment
Plug 'ctrlpvim/ctrlp.vim'                   " fuzzy file, buffer, mru, tag, etc finder
Plug 'tacahiroy/ctrlp-funky'                " find fuzzy function name
Plug 'joonty/vim-phpqa'                     " php quality checking tool
Plug 'mikehaertl/pdv-standalone'            " generate phpdoc
Plug 'ludovicchabant/vim-gutentags'         " generate tags
call plug#end()

" }}}
" {{{ General

" improve performance
set lazyredraw

" intuitive backspacing in insert mode
set backspace=indent,eol,start

set splitbelow splitright
set noswapfile

" load vimrc in each directory
set secure exrc

" }}}
" {{{ File setting

set fileencodings=utf-8,cp932,euc-jp

" reload files if changed outside vim
set autoread

" this allows buffers to be hidden if you've modified a buffer.
set hidden

" restore cursor to file position in previous editing session
set nostartofline

syntax enable
set t_co=256
set background=dark
colorscheme solarized

set number ruler cursorline

" use filetype detection
filetype plugin indent on

" use spaces instead of tabs
set expandtab smarttab
set tabstop=4 shiftwidth=4 softtabstop=4
set autoindent smartindent

" }}}
" {{{ searching and indexing

" highlight search results and search while typing
set hlsearch incsearch

set wildmenu wildmode=longest,list

" statusline
set laststatus=2
set statusline=%<%f%m%r%h%=%y\ [%{&fenc}]\ [%{&ff}]\ \|\ %l:%c\ \|\ %-4p

" remove trailing white space
autocmd BufWritePre * :%s/\s\+$//e

" }}}
" {{{ mappings and shortcuts

" change leader key from backslash to comma
let mapleader = ","

" fast saving
nnoremap <leader>w :w<CR>

" change working directory to that of the current file
nnoremap <leader>h :lcd %:p:h<CR>

" smart way to move between windows
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" turn off search highlight
nnoremap <space> :nohlsearch<CR>

" paste content from os's clipboard
nnoremap <leader>p :set paste<CR>o<esc>"*]p:set nopaste<CR>

" copy from current position to the end of line
nnoremap Y y$

" select the text just pasted
nnoremap <leader>v `[v`]

" delete with black hole register
nnoremap <leader>d "_dd
vnoremap <leader>d "_d

" indent the whole file and return to original position
nnoremap <leader>= mzgg=g`zz

" list buffer
nnoremap <leader>l :ls<CR>:b

" }}}
" {{{ plugin setting

" delimitmate
let delimitmate_expand_cr = 2
let delimitmate_matchpairs = "(:),[:],{:}"

" vim-commentary
nmap <leader>c <Plug>CommentaryLine
vmap <leader>c <Plug>Commentary
autocmd filetype php setlocal commentstring=//\ %s

" ctrlp
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
endif

" ctrlp-funky plugin
nnoremap <leader>r :CtrlPFunky<CR>

" PDV
nnoremap <leader>* :call PhpDocSingle()<CR>

" Vim-phpqa
let g:phpqa_messdetector_autorun = 0
let g:phpqa_codesniffer_autorun = 0
let g:phpqa_codesniffer_args = "--standard=PSR2"

" Gutentags
nmap <leader>t :CtrlPTag<CR><C-\>w
let g:gutentags_exclude = ['*.css', '*.html']

" }}}
" {{{ Filetypes

autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby
autocmd BufNewFile,BufRead *.json set filetype=javascript
autocmd BufNewFile,BufRead {*.scss,*.sass} set filetype=css
autocmd BufNewFile,BufRead {*.ctp,*.tpl} set filetype=php
