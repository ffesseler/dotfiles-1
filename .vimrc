set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'davidbeckingsale/Smyck-Color-Scheme'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'gmarik/vundle'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'skammer/vim-css-color'
Plugin 'tjennings/git-grep-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()

let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files --exclude-standard -co']

set backupdir=~/.vim/backup
set directory=~/.vim/backup
" persistent undo
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000
" always use utf8
set encoding=utf-8

" show relative line numbers
set rnu
" always show status bar
set laststatus=2
" make backspace do what you expect
set backspace=indent,eol,start
" use abbreviations in messages
set shortmess=aI
" always set terminal title
set title
" don't put ugly |s into vbars
set fillchars=vert:\ " needs a space
" always leave 5 lines around cursor
set scrolloff=5
set sidescrolloff=5

" indenting
set tabstop=6
set shiftwidth=4
set softtabstop=4
set expandtab

" highlight tabs & trailing spaces
set list listchars=tab:\>\ ,trail:·

filetype plugin indent on

set autoindent

colorscheme smyck


" highlight last search term
set hlsearch
" incremental search
set incsearch
" case insensitive
set ignorecase
" case sensitive if search string contains uppercase
set smartcase
" always replace all matches on line
set gdefault

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme="base16"

" filetype stuff
au BufNewFile,BufRead *.json set ft=javascript
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" press F2 before a paste to turn off autoindent
set pastetoggle=<F2>
" create blank line without entering insert
nnoremap <silent> zj o<Esc>
nnoremap <silent> zk O<Esc>
" w!! to save with sudo
cmap w!! %!sudo tee > /dev/null %
" use space to pagedown
noremap <Space> <PageDown>
" switch windows with ,
"nmap , <C-w><C-w>
"vnoremap < <gv
"vnoremap > >gv
" ctrl+/ comment
nmap <S-c> <leader>c<space>
vmap <S-c> <leader>c<space>
" disable arrows
"noremap <Up> <NOP>
"noremap <Down> <NOP>
"noremap <Left> <NOP>
"noremap <Right> <NOP>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" remember last file location
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal g'\"" | endif
endif

syntax on

command -nargs=+ Ggr execute 'Ggrep' <q-args> | cw

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
