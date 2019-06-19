"set nocompatiple

runtime! setting/dein_setting.vim
"runtime! setting/plug_setting.vim

set nowrap
set nobackup
set nowritebackup
set backspace=indent,eol,start
nnoremap <Space>l $

set hlsearch
set ignorecase
set smartcase
set incsearch
set wrapscan
nmap <Esc><Esc> :nohlsearch<CR><Esc>

set autoindent
set autoread

set title
set ruler
set number
set list
set wildmenu
set showcmd
set showmatch
set matchtime=1
set wildmode=list:longest
set smartindent
set cmdheight=2
"nnoremap j gj
"nnoremap j gk

set shiftwidth=4
set softtabstop=4
set expandtab
set tabstop=2
set smarttab
set fenc=utf-8

nnoremap sn gt
nnoremap sp gT

set clipboard=unnamed

colorscheme darkblue

let g:python3_host_prog = 'C:\Python37\python.exe'
let g:python_host_prog = 'C:\Python27\python.exe'
