" 确保兼容性设置，优先于所有其他配置
set nocompatible
" 使用旧版正则表达式引擎以避免 vim-fugitive 的 E10 错误
set regexpengine=1
filetype plugin indent on
syntax enable

" 安装 vim-plug 插件管理器
call plug#begin('~/.vim/plugged')

" 代码编辑相关插件
Plug 'tomlion/vim-solidity'                            " Solidity 语言支持
Plug 'bronson/vim-trailing-whitespace'                " 高亮行尾空格
Plug 'tpope/vim-fugitive'                             " Git 集成（确保最新版本）
Plug 'itchyny/lightline.vim'                          " 状态栏美化
Plug 'dhruvasagar/vim-zoom'                           " 窗口缩放
Plug 'vivien/vim-linux-coding-style'                  " Linux 编码风格
Plug 'junegunn/vim-easy-align'                        " 代码对齐
Plug 'pbrisbin/vim-mkdir'                             " 自动创建不存在的目录
Plug 'w0rp/ale'                                       " 语法检查
Plug 'Shougo/echodoc.vim'                             " 函数参数提示

" 代码搜索相关插件
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }     " 模糊搜索
Plug 'ludovicchabant/vim-gutentags'                   " 自动生成 tags
Plug 'skywind3000/gutentags_plus'                     " 增强 gutentags
Plug 'skywind3000/vim-preview'                        " 预览搜索结果

" 语言增强插件
Plug 'vim-scripts/c.vim'                              " C 语言支持
Plug 'vim-scripts/a.vim'                              " 头文件切换
Plug 'octol/vim-cpp-enhanced-highlight'               " C++ 语法高亮

" 已注释的插件（按需启用）
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
" Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
" Plug 'altercation/vim-colors-solarized'
" Plug 'crusoexia/vim-monokai'

call plug#end()

" 通用设置
set number                        " 显示行号
set noshowmode                    " 隐藏模式显示（lightline 已显示）
set tabstop=4                     " Tab 宽度
set shiftwidth=4                  " 缩进宽度
set expandtab                     " Tab 转空格
set backspace=indent,eol,start    " 允许退格删除
set foldmethod=indent             " 按缩进折叠
set foldlevel=99                  " 默认展开所有折叠
set wrap                          " 自动换行
set cscopetag                     " 支持 cscope 标签
set colorcolumn=81                " 81 列高亮
set termguicolors                 " 启用真彩色（如果终端支持）
set laststatus=2                  " 总是显示状态栏

" 折叠颜色
highlight Folded guibg=black guifg=grey40 ctermfg=LightGrey ctermbg=DarkGrey

" 列高亮颜色
highlight ColorColumn ctermbg=darkgrey guibg=darkgrey

" diff 模式颜色
if &diff
    colorscheme github
endif

" LeaderF 设置
let g:Lf_WindowPosition = 'left'
noremap <leader>m :LeaderfFunction!<CR>

" vim-linux-coding-style 设置
let g:linuxsty_patterns = ['/linux/', '/kernel/']

" lightline 设置
if !has('gui_running')
    set t_Co=256
endif
let g:lightline = {
    \ 'colorscheme': 'PaperColor_dark',
    \ }

" gutentags 设置
set tags=./.tags;,.tags
let g:gutentags_project_root = ['.git', '.root', '.svn', '.hg', '.project']
let g:gutentags_cache_dir = expand('~/workspace/.cache/tags')
let g:gutentags_modules = []
if executable('ctags')
    let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
    let g:gutentags_modules += ['gtags_cscope']
endif
let g:gutentags_auto_add_gtags_cscope = 0
let g:gutentags_define_advanced_commands = 1

" gutentags-plus 设置
let g:gutentags_plus_switch = 1
let g:gutentags_plus_nomap = 1
noremap <silent> <leader>gs :GscopeFind s <C-R><C-W><CR>
noremap <silent> <leader>gg :GscopeFind g <C-R><C-W><CR>
noremap <silent> <leader>gc :GscopeFind c <C-R><C-W><CR>
noremap <silent> <leader>gt :GscopeFind t <C-R><C-W><CR>
noremap <silent> <leader>ge :GscopeFind e <C-R><C-W><CR>
noremap <silent> <leader>gf :GscopeFind f <C-R>=expand('<cfile>')<CR><CR>
noremap <silent> <leader>gi :GscopeFind i <C-R>=expand('<cfile>')<CR><CR>
noremap <silent> <leader>gd :GscopeFind d <C-R><C-W><CR>
noremap <silent> <leader>ga :GscopeFind a <C-R><C-W><CR>
noremap <silent> <leader>gz :GscopeFind z <C-R><C-W><CR>

" vim-preview 设置
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<CR>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<CR>

" 恢复上次光标位置
if has('autocmd')
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
