set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'

" ========== My Plugins ==========
Plugin 'joker1007/vim-markdown-quote-syntax'
" Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'godlygeek/tabular'
Plugin 'Chiel92/vim-autoformat'
" ================================
"
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" 缩进
set autoindent " 缩进会自动跟上一行
set cindent " 以 C 语言的方式缩进
set tabstop=4 " 设置 tab 缩进
set shiftwidth=4 " >>, <<, == 缩进
set expandtab " 自动将 Tab 转为空格
set softtabstop=4

set number " 显示行号
set relativenumber " 显示光标所在的当前行的行号
set linebreak " 遇到指定符号折行
set textwidth=80 " 设置行宽
set laststatus=1 " 多窗口显示状态栏
set ruler " 显示光标当前位置

" 搜索
set showmatch" 自动高亮对应的另一个括号
set hlsearch " 高亮搜索
set ignorecase " 自动跳到第一个匹配的结果
set incsearch " 搜索时忽略大小写

" 编辑
" set spell spelllang=en_us " 拼写检查
set paste " 粘贴模式 右键粘贴
set undofile " 保留撤销历史
set autochdir " 自动切换工作目录
set listchars=tab:..,trail:. " 显示空格和 tab
set list
set wildmenu " 命令模式下，底部操作指令按下 Tab 键自动补全
set wildmode=longest:list,full

" 括号补全
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap < <><ESC>i
inoremap { {<CR>}<ESC>0

" nerdtree
let NERDTreeHighlightCursorline = 1       " 高亮当前行
let NERDTreeShowLineNumbers     = 1       " 显示行号
" 忽略列表中的文件
let NERDTreeIgnore = [ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.egg$', '^\.git$', '^\.repo$', '^\.svn$', '^\.hg$' ]
" 启动 vim 时打开 NERDTree
" autocmd vimenter * NERDTree
" 当打开 VIM，没有指定文件时和打开一个目录时，打开 NERDTree
" autocmd StdinReadPre * let s:std_in = 1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" 关闭 NERDTree，当没有文件打开的时候
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end
 
" <F3> 打开 nerdtree 窗口，在左侧栏显示
map <F3> :NERDTreeMirror<CR>
" <F3> 关闭当前的 tab
map <F3> :NERDTreeToggle<CR>
" <leader>to 关闭所有其他的 tab
map <leader>to :tabo<CR>
" <leader>ts 查看所有打开的 tab
map <leader>ts :tabs<CR>
" <leader>tp 前一个 tab
map <leader>tp :tabp<CR>
" <leader>tn 后一个 tab
map <leader>tn :tabn<CR>

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_min_num_of_chars_for_completion               = 2 " 输入第 2 个字符开始补全
let g:ycm_seed_identifiers_with_syntax                  = 1 " 语法关键字补全
let g:ycm_complete_in_comments                          = 1 " 在注释中也可以补全
let g:ycm_complete_in_strings                           = 1 " 在字符串输入中也能补全
let g:ycm_collect_identifiers_from_tag_files            = 1 " 使用 ctags 生成的 tags 文件
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释和字符串中的文字也会被收入补全
let g:ycm_cache_omnifunc                                = 0 " 每次重新生成匹配项，禁止缓存匹配项
let g:ycm_use_ultisnips_completer                       = 0 " 不查询 ultisnips 提供的代码模板补全，如果需要，设置成 1 即可
let g:ycm_show_diagnostics_ui                           = 0 " 禁用语法检查
let g:ycm_key_list_select_completion   = ['<Down>']   " 选择下一条补全，Default: ['<TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']     " 选择上一条补全，Default: ['<S-TAB>', '<Up>']
let g:ycm_key_list_stop_completion     = ['<Enter>']  " 中止此次补全，Default: ['<C-y>'] 

" Chiel92/vim-autoformat
"F5 自动格式化代码
noremap <F5> :Autoformat<CR>
let g:autoformat_verbosemode=1
