
" ------------------------------------------------------------------------- "
" Vim 
    " Setup
    syntax on                                               " Syntax Highlighting
        au! BufRead,BufNewFile *.py set filetype=python
        au! BufRead,BufNewFile *.python set filetype=python
    set backspace=2                                         " Make sure backspace works
    set mouse=a                                             " Use mouse and scrolling
    set nowrap                                              " No line wrapping
    set number                                              " Show line numbers
    set hlsearch                                            " Set highlighting when searching
    " Indentation
        set tabstop=4
        set shiftwidth=4
        set smarttab
        set expandtab
        set smartindent
        set softtabstop=4
        set autoindent
    set clipboard=unnamed                                   " Use os level copy-paste buffer
    set wildmenu                                            " Allows auto-completion in :mode
    set wildmode=longest:full,full                          " On tab wildmenu shows up
    set t_Co=256                                            " Set color limit to 256
    color jellybeans
    set ignorecase
    " Setting wrapping: http://vim.wikia.com/wiki/Word_wrap_without_line_breaks
    set wrap
    set linebreak
    " OS LEVEL HACKS
    " LEFT COMMAND MAPPED TO CTRL
    " CAPSLOCK MAPPED TO EXC
" ------------------------------------------------------------------------- "

" ------------------------------------------------------------------------- "
" Vundle 
    " Setup
    set nocompatible
    filetype off
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    
    " --------------------------------------------------------------------- "
    " Packages
    Bundle 'gmarik/vundle'
    Bundle 'scrooloose/nerdtree'
    Bundle 'majutsushi/tagbar'
    Bundle 'kien/ctrlp.vim'
    Bundle 'docunext/closetag.vim'
    Bundle 'kevinw/pyflakes-vim'
    Bundle 'scrooloose/nerdcommenter'
    Bundle 'ervandew/supertab'
    Bundle 'tpope/vim-surround'
    Bundle 'vim-scripts/SearchComplete'
    Bundle 'godlygeek/tabular'
    Bundle 'Lokaltog/vim-powerline'
    Bundle 'mileszs/ack.vim'
    Bundle 'scrooloose/syntastic'
    Bundle 'nanotech/jellybeans.vim' 
    Bundle 'kchmck/vim-coffee-script'
    Bundle 'gregsexton/MatchTag'
"    Bundle 'Raimondi/delimitMate'
    " --------------------------------------------------------------------- "
    
    filetype plugin indent on     " required! for vundle
    
        " Brief help
        " :BundleList          - list configured bundles
        " :BundleInstall(!)    - install(update) bundles
        " :BundleSearch(!) foo - search(or refresh cache first) for foo
        " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
        "
        " see :h vundle for more details or wiki for FAQ
        " NOTE: comments after Bundle command are not allowed..
" ------------------------------------------------------------------------- "

" ------------------------------------------------------------------------- "
" Tagbar
    " Setup
    let g:tagbar_ctags_bin='/usr/local/bin/ctags'  " Proper Ctags locations
    " Settings
    let g:tagbar_width=26                          " Default is 40, seems too wide
    "map <F7> :!ctags -R .<CR>
    " Usage
    " In root directory type: 'ctags -R ' and that will make tag files for the whole directory
" ------------------------------------------------------------------------- "

" ------------------------------------------------------------------------- "
" Syntastic
    " Setup
    let g:syntastic_enable_signs = 1
    " Settings
    let g:syntastic_error_symbol = '✗'
    let g:syntastic_warning_symbol = '⚠'
" ------------------------------------------------------------------------- "

" ------------------------------------------------------------------------- "
" Powerline
    " Setup
    set laststatus=2   " Always show the statusline
    set encoding=utf-8 " Necessary to show Unicode glyphs
" ------------------------------------------------------------------------- "

" ------------------------------------------------------------------------- "
" Nerd_Commenter 
    " Setup
    let NERDSpaceDelims=1
" ------------------------------------------------------------------------- "

" ------------------------------------------------------------------------- "
" Mappings 
    " Ctrl + s = Save
    map <C-s> :w<CR>
    imap <C-s> <Esc>:w<CR>i
    " Ctrl + Y = Redo " 
    map <C-y> <C-R> "Ctrl + Y = redo
    " Ctrl + n = Toggle NERDTree"
    map <C-n> <ESC>:NERDTreeToggle<CR>
    " Ctrl + t = Toggle TagBar
    map <C-t> <ESC>:TagbarToggle<CR>
    " Ctrl + [h, j, k, l] = Move to split ← ↓ ↑ → 
        noremap <C-H> <C-W>h
        noremap <C-J> <C-W>j
        noremap <C-K> <C-W>k
        noremap <C-L> <C-W>l
    let mapleader = "\<Space>"
    map <leader><Space> <plug>NERDCommenterToggle
    map <leader>t :Tabularize /
    map <leader>h :set hlsearch!<CR>
    map <leader>d daw
    map <leader>dd diwi<Space><Esc>
" ------------------------------------------------------------------------- "
