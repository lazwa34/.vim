" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

""""""""""""
" My Plugs "
""""""""""""
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'Xuyuanp/nerdtree-git-plugin'

""""""""""""

" Initialize plugin system
call plug#end()

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

""""""""""""
" nerdtree "
""""""""""""
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>

let NERDTreeHighlightCursorline = 1       " 高亮当前行
let NERDTreeShowLineNumbers     = 1       " 显示行号
let NERDTreeShowHidden          = 1       " 显示隐藏文件

" 忽略列表中的文件
let NERDTreeIgnore = [ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.egg$', '^\.git$', '^\.repo$', '^\.svn$', '^\.hg$' ]

" 启动 vim 时打开 NERDTree
" autocmd vimenter * NERDTree

" 当打开 VIM，没有指定文件时和打开一个目录时，打开 NERDTree
autocmd StdinReadPre * let s:std_in = 1

" 当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" 关闭 NERDTree，当没有文件打开的时候
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end



""""""""""""""""
" vim-devicons "
""""""""""""""""
set encoding=utf8
set guifont=DroidSansMono_Nerd_Font:h11
