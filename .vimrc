"------------------------------------------------------------------------- "
" Vundle 
    " Setup
    set nocompatible
    filetype off
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    " Ask Vundle to use git instead of https links when pulling
    let g:vundle_default_git_proto = 'git'
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
    Bundle 'vim-scripts/CmdlineComplete'
    Bundle 'tpope/vim-surround'
    " Bundle 'vim-scripts/SearchComplete'
    Bundle 'vim-scripts/listmaps.vim'
    Bundle 'godlygeek/tabular'
    Bundle 'Lokaltog/vim-powerline'
    Bundle 'mileszs/ack.vim'
    Bundle 'scrooloose/syntastic'
    Bundle 'nanotech/jellybeans.vim' 
    Bundle 'kchmck/vim-coffee-script'
    Bundle 'gregsexton/MatchTag'
    Bundle 'Lokaltog/vim-easymotion'
    Bundle 'mileszs/ack.vim'
    Bundle 'vim-scripts/vimgrep.vim'
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
" Vim 
    " Setup
    syntax on                                               " Syntax Highlighting
        au! BufRead,BufNewFile *.py set filetype=python
        au! BufRead,BufNewFile *.python set filetype=python
    set backspace=2                                         " Make sure backspace works
    set backspace=eol,start,indent
    set whichwrap+=<,>,h,l
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
    " Specify the behavior when switching between buffers 
    try
          set switchbuf=useopen,usetab,newtab
            set stal=2
        catch
    endtry
    " Return to last edit position when opening files (You want this!)
    autocmd BufReadPost *
         \ if line("'\"") > 0 && line("'\"") <= line("$") |
         \   exe "normal! g`\"" |
         \ endif
    " Remember info about open buffers on close
    set viminfo^=%
    " Delete trailing white space on save, useful for Python and CoffeeScript
    func! DeleteTrailingWS()
          exe "normal mz"
            %s/\s\+$//ge
              exe "normal `z"
          endfunc
    autocmd BufWrite *.py :call DeleteTrailingWS()
    autocmd BufWrite *.coffee :call DeleteTrailingWS()
    " OS LEVEL HACKS
    " LEFT COMMAND MAPPED TO CTRL
    " CAPSLOCK MAPPED TO EXC
" ------------------------------------------------------------------------- "

" ------------------------------------------------------------------------- "
" EasyMotion
 ":help easymotion
 let g:EasyMotion_leader_key = "'"

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
" FOR DOCS
" :help key-notation
" :map
" :imap
" :nmap
" :verbose map
" :help map-verbose
" :Listmaps
" :verbose map! <C-Q>
    let mapleader = "\<Space>"
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
    map <leader><Space> <plug>NERDCommenterToggle
    map <leader>t :Tabularize /
    map <leader>h :set hlsearch!<CR>
    map <leader>d daw
    map <leader>dd diwi<Space><Esc>
    " Fast source vimrc 
    map <leader>s <Esc>:source $MYVIMRC<CR>
    " Fast saving
    map <leader>w :w!<CR>
    " Ignore compiled files
    set wildignore=*.o,*~,*.pyc
    " Ignore case when searching
    set ignorecase
    " When searching try to be smart about cases 
    " set smartcase
    " Toggle case search, as smart/ignore conflict  BROKEN
    " command Case set smartcase!|set ignorecase!
    " Highlight search results
    set hlsearch
    " Makes search act like search in modern browsers
    set incsearch
    " Show matching brackets when text indicator is over them
    set showmatch
    " No annoying sound on errors
    set noerrorbells
    set novisualbell
    set t_vb=
    set tm=500
    " Use Unix as the standard file type
    set ffs=unix,dos,mac
    " Closed buffers not listed
    set hid 
    " Visual mode pressing * or # searches for the current selection
    " Search for selected text, forwards or backwards.
    vnoremap <silent> * :<C-U>
      \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
      \gvy/<C-R><C-R>=substitute(
      \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
      \gV:call setreg('"', old_reg, old_regtype)<CR>
    vnoremap <silent> # :<C-U>
      \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
      \gvy?<C-R><C-R>=substitute(
      \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
      \gV:call setreg('"', old_reg, old_regtype)<CR>
    " Switch CWD to the directory of the open buffer
    map <leader>cd :cd %:p:h<cr>:pwd<cr>
    " Move a line of text using shift+[j/k] on mac
    nmap <S-j> mz:m+<cr>`z
    nmap <S-k> mz:m-2<cr>`z
    vmap <S-j> :m'>+<cr>`<my`>mzgv`yo`z
    vmap <S-k> :m'<-2<cr>`>my`<mzgv`yo`z
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "" => Spell checking
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "" Pressing ,ss will toggle and untoggle spell checking
    "map <leader>ss :setlocal spell!<cr>
    "
    "" Shortcuts using <leader>
    "map <leader>sn ]s
    "map <leader>sp [s
    "map <leader>sa zg
    "map <leader>s? z=
    " Remove the Windows ^M - when the encodings gets messed up
    noremap <Leader>mm mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
    " Toggle paste mode on and off
    map <leader>pp :setlocal paste!<cr>
    " Browse Old files
    map <leader>oo :bro ol<cr>
    " Buffer Navigation
    " Quickly open a buffer
    map <leader>ls <esc>:ls<CR>:b<Space>
    map Q <esc>:bd<cr>
    map Q! <esc>:bd!<cr>
    map <S-o> :e 
    map <S-Right> <esc>:bnext<cr> 
    map <S-Left> <esc>:bprevious<cr> 
    " Tab Navigation
        " switch between tabs = gt,gT
        " gt (or :tabn) to go to next tab
        " gT (or :tabp or :tabN) to go to previous tab
        " #gt (or :tabn #) to go to #th tab
        " :tabr to go to first tab
        " :tabl to go to last tab
        " :tabm to move the current tab to the last position
        " :tabm # to move the current tab to the #th position
    "Old working mappings
    " map <C-o> <Esc>:tab sbnext<CR>
    " map <C-t> <Esc>:tabnew<CR>
    " map <leader>to :tabonly<cr>
    " Opens a new tab with the current buffer's path
    " Super useful when editing files in the same directory
    " map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
    nmap <C-o> <Esc>:tab sbnext<CR>
    nmap <C-t> <Esc>:tabnew<CR>
    nmap <leader>q <esc>:tabclose<cr>
    nmap <leader>m <esc>:tabm 
    nmap <Tab> <esc>:tabn<cr> 
    nmap <S-Tab> <esc>:tabp<cr> 
"------------------------------------------------------------------------- "
" TO print out what a setting is type ":set *SETTINGNAME*?
"
"
" CmdlineComplete
" When editing the command-line (: / etc.), press Ctrl-P or Ctrl-N to complete
" the word before the cursor, using keywords in the current file. E.g: you
" want to search for 'elephant' in the buffer, just type /ele and press
" Ctrl-P. So long as 'elephant' is in the buffer, you will get 'ele' completed
" into 'elephant'.
