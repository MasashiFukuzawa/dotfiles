" ==============
"  key bind
" ==============
" Normal Mode
" -----------------------------------
" init.vim呼び出し
cnoremap init :<C-u>edit $MYVIMRC<CR>
" init.vim読み込み
noremap <Space>s :source $MYVIMRC<CR>
" ファイル保存
noremap <Space>w :<C-u>w<CR>
" ;でコマンド入力
noremap ; :
" .でfやFの検索を繰り返し
noremap . ;
" :で前の操作を繰り返し
noremap : .

" Insert Mode
" -----------------------------------
" InsertMode抜けて保存
inoremap <silent> jj <ESC>:<C-u>w<CR>:
" Insert mode movekey bind
inoremap <C-d> <BS>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-k> <Up>
inoremap <C-j> <Down>

" ==============
" editor setting
" ==============

set encoding=utf-8
" タグファイルの指定
set tags=~/.tags
" スワップファイルは使わない
set noswapfile
" undoファイルは作成しない
set noundofile
" コマンドラインに使われる画面上の行数
set cmdheight=2
" エディタウィンドウの末尾から2行目にステータスラインを常時表示
set laststatus=2
" ステータス行に表示させる情報の指定(どこからかコピペしたので細かい意味はわかっていない)
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" ステータス行に現在のgitブランチを表示
set statusline+=%{fugitive#statusline()}
" ウインドウのタイトルバーにファイルのパス情報等を表示
set title
" コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set wildmenu
" 入力中のコマンドを表示
set showcmd
" 行番号表示
set number
" 水平分割時に下に表示
set splitbelow
" 縦分割時に右に表示
set splitright
" 分割時に自動調整を無効化
set noequalalways
" コマンドモードの補完
set wildmenu
" vimに全角を解釈させる
set ambiwidth=double
" バックスペースで何でも消せるようにする
set backspace=indent,eol,start
" 保存されていないファイルがある時でも別のファイルを開けるようにする
set hidden
" 不可視文字を表示
set list
" 対応する括弧やブレースを表示
set showmatch
" 構文毎に文字色を変化させる
syntax on
" クラッシュ防止
set synmaxcol=200
" カーソルの位置表示
set ruler
" カーソルハイライト
set cursorline
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" tabを複数のspaceに置き換え
set expandtab
" tabは半角2文字
set tabstop=2
" tabの幅
set shiftwidth=2
" 改行時に前の行のインデントを継承
set autoindent
" 改行時に前の行の構文をチェックし次の行のインデントを増減
set smartindent
" タブと行の続きを可視化する
set listchars=tab:>\ ,extends:<
" インクリメンタルサーチ. １文字入力毎に検索を行う
set incsearch
" 検索パターンに大文字小文字を無視
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase
" 検索結果をハイライト
set hlsearch
" 検索時にファイルの最後まで行ったら最初に戻る
set wrapscan

if &compatible
  set nocompatible
endif

" Pluginディレクトリのパス
let s:dein_dir = expand('~/.vim/dein')
" dein.vimのパス
let s:dein_repo_dir = s:dein_dir .  '/repos/github.com/Shougo/dein.vim'
" tomlのディレクトリへのパス
let s:toml_dir = expand('~/.config/nvim')

" Required:
execute 'set runtimepath^=' . s:dein_repo_dir

" Required:
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " 起動時に読み込むプラグイン群のtoml
  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})

  " 利用時に読み込むプラグインのtoml
  call dein#load_toml(s:toml_dir . '/lazy.toml', {'lazy': 1})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

""""""""""""""""""""""""""""""
" Unit.vimの設定
""""""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" vim-indent-guidesの設定
""""""""""""""""""""""""""""""
let g:indent_guides_enable_on_vim_startup = 1
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" vim-auto-saveの設定
""""""""""""""""""""""""""""""
let g:auto_save = 1
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 全角スペースの表示
""""""""""""""""""""""""""""""
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 挿入モード時、ステータスラインの色を変更
""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=black ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 最後のカーソル位置を復元する
""""""""""""""""""""""""""""""
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 自動的に閉じ括弧を入力
""""""""""""""""""""""""""""""
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
""""""""""""""""""""""""""""""

" filetypeの自動検出(最後の方に書いた方がいいらしい)
filetype on
