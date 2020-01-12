 " Note: Skip initialization for vim-tiny or vim-small.
 if 0 | endif

 if &compatible
   set nocompatible               " Be iMproved
 endif

 " Required:
 set runtimepath+=~/.vim/bundle/neobundle.vim/

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:

 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!
 NeoBundleFetch 'Shougo/neobundle.vim'
 "ファイルをtree構造で表示
 NeoBundle 'scrooloose/nerdtree'

 "vimproc
 "NeoBundle 'Shougo/vimproc', {
 " \ 'build' : {
 " \     'windows' : 'make -f make_mingw32.mak',
 " \     'cygwin' : 'make -f make_cygwin.mak',
 " \     'mac' : 'make -f make_mac.mak',
 " \     'unix' : 'make -f make_unix.mak',
 " \    },
 " \ }

NeoBundle 'Shougo/neocomplcache.vim'
"" "補完機能実装
if has('lua')
  NeoBundleLazy 'Shougo/neocomplete.vim', {
    \ 'depends' : 'Shougo/vimproc',
    \ 'autoload' : { 'insert' : 1,}
    \ }
endif

" neocomplete {{{
let g:neocomplete#enable_at_startup               = 1
let g:neocomplete#auto_completion_start_length    = 3
let g:neocomplete#enable_ignore_case              = 1
let g:neocomplete#enable_smart_case               = 1
let g:neocomplete#enable_camel_case               = 1
let g:neocomplete#use_vimproc                     = 1
let g:neocomplete#sources#buffer#cache_limit_size = 1000000
let g:neocomplete#sources#tags#cache_limit_size   = 30000000
let g:neocomplete#enable_fuzzy_completion         = 1
let g:neocomplete#lock_buffer_name_pattern        = '\*ku\*'
" }}}

"""括弧補完
NeoBundle 'Townk/vim-autoclose'
"if文終了宣言補完
NeoBundleLazy 'tpope/vim-endwise', {
  \ 'autoload' : { 'insert' : 1,}}

"整形 (ビジュアルモード->Enter)
NeoBundleLazy 'junegunn/vim-easy-align', {
			\ 'autoload': {
			\   'commands' : ['EasyAlign'],
			\   'mappings' : ['<Plug>(EasyAlign)'],
			\ }}

" vim-easy-align {{{
vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)
" }}}

"python
" html

NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'othree/html5.vim'

" javascript
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'moll/vim-node'
NeoBundle 'pangloss/vim-javascript'

" solarized
NeoBundle 'altercation/vim-colors-solarized'
"インデントの可視化
NeoBundle 'Yggdroot/indentLine'
"ここまで
call neobundle#end()

"YouCompleteMe
let g:ycm_server_python_interpreter = '/usr/bin/python3'
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

syntax enable
"set background=dark
"colorscheme solarized
"molokai設定

"" 行を跨いでのカーソル移動を有効にする
set whichwrap=b,s,h,l,<,>,[,]
"行数表示
set number
"対応する括弧の表示
set showmatch
"ファイル名表示
set title
"インデント表示
set smartindent
"smartindentで増減する幅
set shiftwidth=4
"インデントのスペースを設定
set tabstop=4

set autoindent

"検索
"大文字小文字を区別しない
set ignorecase
set wrapscan

autocmd BufWritePre * :%s/\s\+$//ge " 保存時に行末スペースを削除
" jjでエスケープ
inoremap <silent> jj <ESC>:call ImInActivate()<CR>
inoremap <silent> っｊ <ESC>:call ImInActivate()<CR>
" 日本語入力で”っj”と入力してもEnterキーで確定させればインサートモードを抜ける
inoremap<C-n> <Down>
inoremap<C-p> <Up>
inoremap<C-f> <Right>
inoremap<C-n> <Left>
inoremap<C-e> <End>


 " Required:
 filetype plugin indent on
 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.

 NeoBundleCheck

