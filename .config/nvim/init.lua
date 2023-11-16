local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

plugins = require("extensions")
require("lazy").setup(plugins)

vim.g.tex_flavor = 'latex'
vim.g.loaded_python_provider = 0
vim.g.python3_host_prog = vim.env.NVIM_PYTHON_PATH

-- dein settings {{{
--vim.cmd [[
--" dein.vimのディレクトリ
--let s:dein_dir = expand('~/.cache/dein')
--let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
--
--" なければgit clone
--if !isdirectory(s:dein_repo_dir)
--  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
--endif
--execute 'set runtimepath^=' . s:dein_repo_dir
--
--if dein#load_state(s:dein_dir)
--  call dein#begin(s:dein_dir)
--
--  " 管理するプラグインを記述したファイル
--  let s:toml = '~/dein.toml'
--  let s:lazy_toml = '~/dein_lazy.toml'
--  call dein#load_toml(s:toml, {'lazy': 0})
--  call dein#load_toml(s:lazy_toml, {'lazy': 1})
--  
--  call dein#end()
--  "call dein#save_state()
--endif
--" プラグインの追加・削除やtomlファイルの設定を変更した後は
--" 適宜 call dein#update や call dein#clear_state を呼んでください。
--" そもそもキャッシュしなくて良いならload_state/save_stateを呼ばないようにしてください。
--
--" その他インストールしていないものはこちらに入れる
--if dein#check_install()
--  call dein#install()
--endif
--]]
---- }}}

vim.api.nvim_set_var("mapleader", " ")
vim.opt.wrap = false
vim.opt.backup = false
vim.opt.writebackup = false
--set backspace=indent,eol,start
-- nnoremap <leader>l $
vim.keymap.set('n', "<leader>l", "$")

vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.wrapscan = true
-- nmap <Esc><Esc> :nohlsearch<CR><Esc>
vim.keymap.set('n', "<Esc><Esc>", [[:nohlsearch<CR><ESC>]])

vim.opt.autoindent = true
vim.opt.autoread = true

vim.opt.title = true
vim.opt.ruler = true
vim.opt.number = true
vim.opt.list = true
vim.opt.wildmenu = true
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.matchtime=1
vim.opt.wildmode="list:longest"
vim.opt.smartindent = true
vim.opt.cmdheight=2

vim.opt.shiftwidth=4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.tabstop=2
vim.opt.smarttab = true
vim.opt.fenc = "utf-8"

vim.keymap.set("n", "sj", "<C-w>j")
vim.keymap.set("n", "sk", "<C-w>k")
vim.keymap.set("n", "sl", "<C-w>l")
vim.keymap.set("n", "sh", "<C-w>h")

vim.opt.clipboard:append({unnamedeplus = true})
--vim.opt.clipboard="unnamedeplus"
