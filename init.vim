set nocompatible
filetype off

let g:vundle_default_git_proto = 'git'
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'cloudhead/neovim-fuzzy'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'frankier/neovim-colors-solarized-truecolor-only'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'vim-latex/vim-latex'
Plugin 'lervag/vimtex'
Plugin 'myusuf3/numbers.vim'
Plugin 'mbbill/undotree'
" runtime! ftplugin/man.vim
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-fugitive'
Plugin 'JuliaEditorSupport/julia-vim'

call vundle#end()

filetype plugin indent on   " Automatic filetype detection
syntax on                   " Syntax highlighting
set mouse=a                 " Automatically enable mouse usage
set mousehide               " Hide the mouse cursor while typing
set history=1000            " Store more history (50 by default)
set spell                   " Enable spell checking
set hidden                  " Allow buffer switching without saving

set nobackup
set noswapfile
set writebackup
set undofile
set undodir=~/tmp/.vimundo
set undolevels=1000
set undoreload=10000        " Maximum number of lines to save for undo on a buffer reload

""neovim set termguicolors
set cursorline              " Highlight current line

set laststatus=2                       " Always show status bar
set statusline=%<%f\                   " Filename
set statusline+=%w%h%m%r               " Flags
"set statusline+=%{fugitive#statusline()}
set statusline+=[%{&ff}/%Y]            " Filetype
set statusline+=[%{getcwd()}]          " Current dir
set statusline+=%=%l,%c%V\ %P          " Right aligned file nav info

set encoding=utf-8
set backspace=indent,eol,start         " Make backspace always work
set number                             " Show line numbers
set showmatch                          " Show matching brackets/parens
set incsearch                          " Search while typing
set hlsearch                           " Highlight search results
set wildmenu                           " Show completion list
set wildmode=list:longest,full
set scrolljump=1                       " Lines to scroll when cursor leaves screen
set scrolloff=1                        " Minimum lines above/below cursor
set nofoldenable                       " Disable folds
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

set nowrap
set autoindent
set shiftwidth=4
set expandtab
set tabstop=4
set softtabstop=4
set nojoinspaces
set splitright
set splitbelow

let mapleader = ','

" restore cursor position after file reopen
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" terminal

":tnoremap <A-h> <C-\><C-n><C-w>h
":tnoremap <A-j> <C-\><C-n><C-w>j
":tnoremap <A-k> <C-\><C-n><C-w>k
":tnoremap <A-l> <C-\><C-n><C-w>l
":nnoremap <A-h> <C-w>h
":nnoremap <A-j> <C-w>j
":nnoremap <A-k> <C-w>k
":nnoremap <A-l> <C-w>l

" BUNDLES CONFIGURATION

" Solarized
if isdirectory(expand("~/.vim/bundle/vim-colors-solarized"))
    let g:solarized_termcolors=256
    "let g:solarized_termtrans=1
    "let g:solarized_contrast="normal"
    "let g:solarized_visibility="normal"
    set background=dark
    colorscheme solarized             " Load a colorscheme
endif

" Solarized neovim
if isdirectory(expand("~/.vim/bundle/neovim-colors-solarized-truecolor-only"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    set background=dark
    colorscheme solarized
endif

" NERDTree
if isdirectory(expand("~/.vim/bundle/nerdtree"))
    let NERDTreeQuitOnOpen=1
    map <leader>e :NERDTreeFind<CR>
endif

" UndoTree
if isdirectory(expand("~/.vim/bundle/undotree"))
    nnoremap <Leader>u :UndotreeToggle<CR>
    " If undotree is opened, it is likely one wants to interact with it.
    let g:undotree_SetFocusWhenToggle=1
endif

" CtrlP
if isdirectory(expand("~/.vim/bundle/ctrlp.vim"))
    let g:ctrlp_working_path_mode = 'ra'
    let g:ctrlp_custom_ignore = {
        \ 'dir':  '\.git$\|\.hg$\|\.svn$\|build',
        \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }
    if exists("g:ctrlp_user_command")
        unlet g:ctrlp_user_command
    endif
    " http://stackoverflow.com/questions/2372307/opening-files-in-vim-using-fuzzy-search
    if executable('ag')
        " Use Ag over Grep
        set grepprg=ag\ --nogroup\ --nocolor
        " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
        let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
      endif
endif

" fuzzy
if isdirectory(expand("~/.vim/bundle/neovim-fuzzy"))
    nnoremap <C-p> :FuzzyOpen<CR>
endif

" vimtex

let maplocalleader=','
