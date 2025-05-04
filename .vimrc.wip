" Vim configuration for gtags integration with any project
" Optimized for code navigation
" - Supports jumping to definitions/references (Ctrl-], :Gtags)
" - Uses environment variables (PROJECT_ROOT, TAG_DIR) for flexibility
" - Ignores .git, test, etc., via g:gutentags_ctags_exclude
" - Designed for use with a Volume
" - Compatible with tmux (Ctrl-b prefix) and git (with command completion)
" Sourced from: https://github.com/HowHsu/development/.vimrc

" Initialize Vim-Plug, a minimalistic plugin manager
" Manages installation of gtags.vim, gtags-cscope.vim, and vim-gutentags
call plug#begin('~/.vim/plugged')

" gtags.vim: Provides basic GNU Global integration
" Enables :Gtags commands for jumping to definitions and references
Plug 'vim-scripts/gtags.vim'

" gtags-cscope.vim: Integrates gtags with Vim's cscope interface
" Supports tag stack (Ctrl-t) for easier navigation, ideal for large projects
Plug 'vim-scripts/gtags-cscope.vim'

" vim-gutentags: Automatically generates and updates gtags files
" Ensures tags are always up-to-date when editing source code
Plug 'ludovicchabant/vim-gutentags'

" gutentags_plus: Enhances vim-gutentags with quickfix integration
" Improves searching for references and displaying results
Plug 'skywind3000/gutentags_plus'

call plug#end()

" General Vim settings for better usability
set nocompatible              " Disable Vi compatibility mode for modern Vim features
filetype plugin indent on     " Enable file type detection and plugin-specific settings
syntax on                     " Enable syntax highlighting for C++, Python, etc.
set number                    " Show line numbers for easier navigation
set cursorline                " Highlight the current line for visual clarity
set hlsearch                  " Highlight search matches
set incsearch                 " Incremental search for faster feedback
set ignorecase                " Case-insensitive search
set smartcase                 " Case-sensitive search if query contains uppercase
set tabstop=4                 " Set tab width to 4 spaces
set shiftwidth=4              " Set indentation width to 4 spaces
set expandtab                 " Convert tabs to spaces for consistent formatting

" gtags.vim settings
" Configures GNU Global integration for code jumping
let g:Gtags_Auto_Map = 1      " Automatically map gtags keybindings (e.g., :Gtags)
let g:Gtags_Auto_Update = 1   " Update tags automatically when saving files
let g:Gtags_No_Auto_Jump = 1  " Show quickfix window instead of auto-jumping to first result
let g:Gtags_VerticalWindow = 1 " Use vertical split for quickfix window (better for wide screens)

" gtags-cscope.vim settings
" Integrates gtags with cscope for tag stack support
set cscopetag                 " Use cscope-style tag jumping (e.g., Ctrl-] for definitions)
set cscopeprg='gtags-cscope'  " Use gtags-cscope as the cscope backend
let g:GtagsCscope_Auto_Load = 1 " Automatically load GTAGS database on startup
let g:GtagsCscope_Auto_Map = 1  " Automatically map cscope keybindings (e.g., :cs find)
let g:GtagsCscope_Quiet = 1   " Suppress loading messages for a cleaner interface

" vim-gutentags settings
" Automates tag generation for any project
let g:gutentags_modules = ['gtags_cscope']  " Use gtags-cscope for tag generation
" Use $TAG_DIR environment variable if set, else default to /workspace
let g:gutentags_cache_dir = exists('$TAG_DIR') ? $TAG_DIR : '/work/tags'
" Use $PROJECT_ROOT environment variable if set, else default to common markers
let g:gutentags_project_root = exists('$PROJECT_ROOT') ? split($PROJECT_ROOT, ',') : ['.git', 'Makefile', 'configure.ac']
" Exclude irrelevant directories to optimize indexing
" - .git: Version control metadata
" - test, tests: Test code (e.g., Bitcoin Core's test/functional)
" - doc: Documentation (e.g., doc/man)
" - build: Build artifacts
" - contrib, share: Auxiliary tools and scripts
let g:gutentags_ctags_exclude = ['.git', 'test', 'tests', 'doc', 'build', 'contrib', 'share']
let g:gutentags_plus_switch = 1  " Focus on quickfix window after searches

" Custom key mappings for efficient code navigation
" Designed for complex codebases
nnoremap <C-g> :GtagsCursor<CR>  " Jump to definition or references of symbol under cursor
nnoremap <C-r> :Gtags -r <C-r><C-w><CR>  " Find references to symbol under cursor
nnoremap <C-n> :cnext<CR>  " Go to next quickfix result (e.g., next reference)
nnoremap <C-p> :cprev<CR>  " Go to previous quickfix result
nnoremap <C-q> :copen<CR>  " Open quickfix window to browse search results

" Enable gutentags debugging (optional)
" Useful for troubleshooting tag generation issues
let g:gutentags_define_advanced_commands = 1
