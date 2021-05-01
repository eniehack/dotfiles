"set nocompatiple

"runtime! setting/plug_setting.vim
"runtime! setting/dein_setting.vim

" dein settings {{{
if &compatible
  set nocompatible
endif
" dein.vimのディレクトリ
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" なければgit clone
if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " 管理するプラグインを記述したファイル
  let s:toml = '~/dein.toml'
  let s:lazy_toml = '~/dein_lazy.toml'
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  
  call dein#end()
  "call dein#save_state()
endif
" プラグインの追加・削除やtomlファイルの設定を変更した後は
" 適宜 call dein#update や call dein#clear_state を呼んでください。
" そもそもキャッシュしなくて良いならload_state/save_stateを呼ばないようにしてください。

" その他インストールしていないものはこちらに入れる
if dein#check_install()
  call dein#install()
endif
" }}}

filetype plugin indent on
syntax on

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
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h

set clipboard+=unnamedplus

"colorscheme darkblue

if has('win32')
	let g:python3_host_prog = 'C:\Python37\python.exe'
	let g:python_host_prog = 'C:\Python27\python.exe'
endif

if has('unix')
	let g:python3_host_prog = '/sbin/python'
	let g:python_host_prog = '/sbin/python2'
endif

let g:tex_flavor = "latex"

