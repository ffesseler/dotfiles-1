set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'skammer/vim-css-color'
Bundle 'chaquotay/ftl-vim-syntax'
Bundle 'groenewege/vim-less'
Bundle 'mattn/emmet-vim'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-markdown'
Bundle 'mattn/gist-vim'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'scrooloose/nerdcommenter'
Bundle 'vim-scripts/VimClojure'
Bundle 'davidbeckingsale/Smyck-Color-Scheme'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'vim-scripts/groovy.vim'
Bundle 'alampros/cf.vim'
Bundle 'tjennings/git-grep-vim'
Bundle 'kien/ctrlp.vim'
Bundle 'AndrewRadev/splitjoin.vim'
Bundle 'rizzatti/dash.vim'
Bundle 'fatih/vim-go'
Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}

let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files --exclude-standard -co']

set backupdir=~/.vim/backup
set directory=~/.vim/backup
" persistent undo
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000
" always use utf8
set encoding=utf-8

" show line numbers
set number
" show file position
set ruler
" always show status bar
set laststatus=2
" make backspace do what you expect
set backspace=indent,eol,start
" use abbreviations in messages
set shortmess=aI
" always set terminal title
set title
" don't put ugly |s into vbars
set fillchars=vert:\ 
" always leave 5 lines around cursor
set scrolloff=5
set sidescrolloff=5


set tabstop=6
set shiftwidth=4
set softtabstop=4
set expandtab

" highlight tabs & trailing spaces
set list listchars=tab:\>\ ,trail:·

filetype plugin indent on

set autoindent

colorscheme dracula


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



au BufNewFile,BufRead *.json set ft=javascript

au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby
" au BufRead,BufNewFile *.less set ft=css

au BufNewFile,BufRead *.ftl set ft=html.ftl

au BufNewFile,BufRead *.gradle setf groovy
au BufNewFile,BufRead *.cljs set ft=clojure

au BufNewFile,BufRead {*.cfm,*.cfc} set expandtab!

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
nmap , <C-w><C-w>
vnoremap < <gv
vnoremap > >gv
nmap <D-/> <leader>c

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" remember last file location
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal g'\"" | endif
endif

syntax on

command -nargs=+ Ggr execute 'Ggrep' <q-args> | cw


" golang stuff
" $GOPATH
let g:go_bin_path = expand("~/src/gocode/bin")
" disable go autoinstall
let g:go_disable_autoinstall = 1
