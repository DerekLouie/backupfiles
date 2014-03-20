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
    Bundle 'scrooloose/nerdcommenter'
    Bundle 'ervandew/supertab'
    Bundle 'vim-scripts/CmdlineComplete'
    Bundle 'tpope/vim-surround'
    Bundle 'vim-scripts/listmaps.vim'
    Bundle 'godlygeek/tabular'
    Bundle 'mileszs/ack.vim'
    Bundle 'scrooloose/syntastic'
    Bundle 'nanotech/jellybeans.vim'
    Bundle 'gregsexton/MatchTag'
    Bundle 'Lokaltog/vim-easymotion'
    Bundle 'airblade/vim-gitgutter'
    Bundle 'xolox/vim-misc'
    Bundle 'xolox/vim-notes'
    Bundle 'tpope/vim-fugitive'
    Bundle 'DerekLouie/vimTodoWithNotes'
    " Must have NPM and a ruby gem
    Bundle 'suan/vim-instant-markdown'
    " Must install tmux
    Bundle 'benmills/vimux'
    Bundle 'christoomey/vim-tmux-navigator'
    Bundle 'xolox/vim-session'
    Bundle 'MarcWeber/vim-addon-mw-utils'
    Bundle 'tomtom/tlib_vim'
    Bundle 'garbas/vim-snipmate'
    Bundle 'honza/vim-snippets'
    Bundle 'tsaleh/vim-matchit'
    Bundle 'corntrace/bufexplorer'
    Bundle 'sandeepcr529/Buffet.vim'
    Bundle 'troydm/easybuffer.vim'
    Bundle 'sjl/gundo.vim'
    Bundle 'jeetsukumaran/vim-buffersaurus'
    Bundle 'DerekLouie/LastBuf-Personal'
    Bundle 'vim-scripts/mru.vim'
    Bundle 'pangloss/vim-javascript'
    "Install Later""
    " Bundle 'kevinw/pyflakes-vim'
    " Bundle 'bling/vim-airline'
    " Bundle 'kchmck/vim-coffee-script'
    " Bundle 'mivok/vimtodo'
    " Bundle 'ervandew/screen'
    " Bundle 'Raimondi/delimitMate'
    " Bundle 'Lokaltog/powerline-fonts'
    " Bundle 'Lokaltog/vim-powerline'
    " Bundle 'mhinz/vim-startify'
    " Bundle 'sjl/clam.vim'
    " Bundle 'sjl/vitality.vim'
    " Bundle 'coderifous/textobj-word-column.vim'
    " Bundle 'troydm/pb.vim'
    " Bundle 'kshenoy/vim-signature'
    " Bundle 'vim-scripts/YankRing.vim'
    " Bundle 'chrisbra/Recover.vim'
    " Bundle 'mihaifm/vimpanel'
    " Bundle 'goldfeld/vim-seek'
    " Bundle 'junegunn/vim-scroll-position'
    " Bundle 'justincampbell/vim-eighties.git'
    " Bundle 'mhinz/vim-signify'
    " Bundle 'sk1418/Join'
    " Bundle 'drmikehenry/vim-fixkey'
    " Bundle 'rhysd/clever-f.vim'
    """
    " MAY CRASH IF USED WITH FUGITIVE
    " Need to do some stuff with git-config to get working
    " http://sjl.bitbucket.org/splice.vim/#installation
    " Bundle 'sjl/splice.vim'
    " --------------------------------------------------------------------- "

    filetype plugin indent on     " required! for vundle

        " Brief help
        " :BundleList          - list configured bundles
        " :BundleInstall(!)    - install(update) bundles
        " FROM SHELL $vim +BundleInstall +qall
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
    set whichwrap+=<,>,h,l                                  " When reaching end of line go to next line
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
    set wrap                                                " Setting wrapping: http://vim.wikia.com/wiki/Word_wrap_without_line_breaks
    set linebreak
    set viminfo^=%                                          " Remember info about open buffers on close
    set exrc                                                " enable per-directory .vimrc files
    set secure                                              " disable unsafe commands in local .vimrc files

     " Set map leader
    let mapleader = "\<Space>"

     "Test if vimrc is being sourced
     nmap <leader>9 :echo expand('%:p:h').""<cr>

     " Make background in vim same transparency as terminal
     hi Normal          ctermfg=252 ctermbg=none

     " Create backupdir for storing files
     if !exists("*InitBackupDir")
       function InitBackupDir()
         if has('win32') || has('win32unix') "windows/cygwin
           let separator = "_"
         else
           let separator = "."
         endif
         let parent = $HOME .'/' . separator . 'vim/'
         let backup = parent . 'backup/'
         let tmp = parent . 'tmp/'
         if exists("*mkdir")
           if !isdirectory(parent)
             call mkdir(parent)
           endif
           if !isdirectory(backup)
             call mkdir(backup)
           endif
           if !isdirectory(tmp)
             call mkdir(tmp)
           endif
         endif
         let missing_dir = 0
         if isdirectory(tmp)
           execute 'set backupdir=' . escape(backup, " ") . "/,."
         else
           let missing_dir = 1
         endif
         if isdirectory(backup)
           execute 'set directory=' . escape(tmp, " ") . "/,."
         else
           let missing_dir = 1
         endif
         if missing_dir
           echo "Warning: Unable to create backup directories: " . backup ." and " . tmp
           echo "Try: mkdir -p " . backup
           echo "and: mkdir -p " . tmp
           set backupdir=.
           set directory=.
         endif
       endfunction
       call InitBackupDir()
     endif

     " Setup syntax file from custom dir
     " :echo &runtimepath.','.escape("~/backupfiles/syntax",'\,')
     " map <leader>1 :echo expand('%:p:h').""<cr>
     " let &runtimepath.=','.escape("~/backupfiles/syntax",'\,')

     "Make current line's number bold
         set cursorline
         " hi CursorLineNr   term=bold ctermfg=Yellow gui=bold guifg=Yellow
         hi clear CursorLine
         " augroup CLClear
             " autocmd! ColorScheme * hi clear CursorLine
         " augroup END
         hi CursorLineNR cterm=bold
         augroup CLNRSet
             autocmd! ColorScheme * hi CursorLineNR cterm=bold
         augroup END

 " ------------------------------------------------------------------------- "

 " ------------------------------------------------------------------------- "
 " Functions, autocmd, control blocks
     try                                                     " Specify the behavior when switching between buffers
           set switchbuf=useopen,usetab,newtab
             set stal=2
         catch
     endtry

     if has("autocmd")                                       " Return to last edit position when opening files
       au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
     endif

     func! DeleteTrailingWS()                                " Delete trailing white space on save, useful for Python and CoffeeScript
           exe "normal mz"
             %s/\s\+$//ge
               exe "normal `z"
           endfunc

     autocmd BufWrite *.py :call DeleteTrailingWS()
     autocmd BufWrite *.coffee :call DeleteTrailingWS()

     " setting the working directory to the current file's directory:
     autocmd BufEnter * lcd %:p:h

     " returns true iff is NERDTree open/active
     function! IsNTOpen()
         return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
     endfunction

     " returns true iff focused window is NERDTree window
     function! IsNTFocused()
         return -1 != match(expand('%'), 'NERD_Tree')
     endfunction

     " calls NERDTreeFind iff NERDTree is active, current window contains a modifiable file, and we're not in vimdiff
     function! NCSyncTree()
         let ntOpen = IsNTOpen()
         let ntFocused = !IsNTFocused()
         if &modifiable && ntOpen && ntFocused && strlen(expand('%')) > 0 && !&diff
             NERDTreeFind
             wincmd p
         endif
     endfunction

     " autocmd BufWinEnter * call NCSyncTree()


     " :cnoreabbrev q CloseSession<bar>q
     " :cnoreabbrev wq CloseSession<bar>w<bar>q
     " :cnoreabbrev <silent> q! CloseSession<bar>q!
     " :cnoreabbrev <silent> q CloseSession<bar>q
     " :cnoreabbrev <silent> Q CloseSession<bar>q
     " :cnoreabbrev <silent> wq CloseSession<bar>wa<bar>q
     " :cnoreabbrev <silent> WQ CloseSession<bar>wa<bar>q

     " exit with capitols
     :command WQ wq
     :command Wq wq
     :command W w
     :command Q q

     function! CloseSess()
         CloseSession
     endfunction

     function! MakeNoteFile()
         " Add stuff to this to put the line at the top of the file and :e
     endfunction

     function! SwitchToLastBuffer()
       b#
     endfunction

     " This doesn't work, kind of annoying
     " autocmd vimLeave * silent call CloseSess()

     if &term =~ '^screen'
         " tmux will send xterm-style keys when its xterm-keys option is on
         execute "set <xUp>=\e[1;*A"
         execute "set <xDown>=\e[1;*B"
         execute "set <xRight>=\e[1;*C"
         execute "set <xLeft>=\e[1;*D"
     endif

     " OS LEVEL HACKS
     " LEFT COMMAND MAPPED TO CTRL
     " CAPSLOCK MAPPED TO EXC
 " ------------------------------------------------------------------------- "

 " ------------------------------------------------------------------------- "
 " Ctrlp
     " :help ctrlp-options
     " :help ctrlp-mappings

 "Use this option to change the mapping to invoke CtrlP in Normal mode:
     " let g:ctrlp_map = '<c-p>'

 " Set the default opening command to use when pressing the above mapping: >
     " let g:ctrlp_cmd = 'CtrlPMixed'

 " Use this to disable the plugin completely:
    " let g:loaded_ctrlp = 1
    let g:ctrlp_tabpage_position = 'l'

 " When this is set to 1, the <c-o> and <c-y> mappings will accept one extra key
 " as an argument to override their default behavior:
    let g:ctrlp_arg_map = 1

 " Pressing <c-o> or <c-y> will then prompt for a keypress. The key can be:
    " - Open files marked by <c-z>.
    " - When no file has been marked by <c-z>, open a console dialog with the
       " following options:
       " Open the selected file:
         " t - in a tab page.
         " v - in a vertical split.
         " h - in a horizontal split.
         " r - in the current window.
         " i - as a hidden buffer.
         " x - (optional) with the function defined in |g:ctrlp_open_func|.
         " <esc>, <c-c>, <c-u> - cancel and go back to the prompt.
         " <cr> - use the default behavior specified with g:ctrlp_open_new_file and g:ctrlp_open_multiple_files.
       " Other options (not shown):
         " a - mark all files in the match window.
         " d - change CtrlP's local working directory to the selected file's
             " directory and switch to find file mode.
   " <F7>
     " - Wipe the MRU list.
     " - Delete MRU entries marked by <c-z>.

 " Once CtrlP is open:
     " Press <c-f> and <c-b> to cycle between modes.
     " Use <c-n>, <c-p> to select the next/previous string in the prompt's history.
     " Use <c-z> to mark/unmark multiple files and <c-o> to open them.
 " ------------------------------------------------------------------------- "

 " ------------------------------------------------------------------------- "
 " EasyMotion
     " :help easymotion
     let g:EasyMotion_leader_key = "\\"
     " let g:EasyMotion_leader_key = "'"

 " ------------------------------------------------------------------------- "

 " ------------------------------------------------------------------------- "
 " Airline
     set laststatus=2   " Always show the statusline
     set encoding=utf-8 " Necessary to show Unicode glyphs

     " To Turn on patched font support
     " let g:Powerline_symbols = 'fancy'
     let g:airline_powerline_fonts = 1

     " Use unicode symbols instead
     " if !exists('g:airline_symbols')
         " let g:airline_symbols = {}
     " endif

     " " Symbol Mappings
     " let g:airline#extensions#tabline#enabled = 1
     " let g:airline#extensions#tabline#left_sep = ' '
     " let g:airline#extensions#tabline#left_alt_sep = '▶'
     " " unicode symbols
     " let g:airline_left_sep = '»'
     " let g:airline_left_sep = '▶'
     " let g:airline_right_sep = '«'
     " let g:airline_right_sep = '◀'
     " let g:airline_symbols.linenr = '␊'
     " let g:airline_symbols.linenr = '␤'
     " let g:airline_symbols.linenr = '¶'
     " let g:airline_symbols.branch = '⎇'
     " let g:airline_symbols.paste = 'ρ'
     " let g:airline_symbols.paste = 'Þ'
     " let g:airline_symbols.paste = '∥'
     " let g:airline_symbols.whitespace = 'Ξ'
     " " powerline symbols
     " let g:airline_left_sep = ''
     " let g:airline_left_alt_sep = ''
     " let g:airline_right_sep = ''
     " let g:airline_right_alt_sep = ''
     " let g:airline_symbols.branch = ''
     " let g:airline_symbols.readonly = ''
     " let g:airline_symbols.linenr = ''
 " ------------------------------------------------------------------------- "

 " ------------------------------------------------------------------------- "
 " Nerd_Commenter
     " Setup
     let NERDSpaceDelims=1
 " ------------------------------------------------------------------------- "

 " ------------------------------------------------------------------------- "
 " Tagbar
     let g:tagbar_ctags_bin='/usr/local/bin/ctags'  " Proper Ctags locations
     let g:tagbar_width=26                          " Default is 40, seems too wide
     "map <F7> :!ctags -R .<CR>
     " Usage: In root directory type: 'ctags -R ' and that will make tag files for the whole directory
 " ------------------------------------------------------------------------- "

 " ------------------------------------------------------------------------- "
 " Gitgutter
     let g:gitgutter_realtime = 0
 " ------------------------------------------------------------------------- "

 " ------------------------------------------------------------------------- "
 " Syntastic
     let g:syntastic_enable_signs = 1
     let g:syntastic_error_symbol = '✗'
     let g:syntastic_warning_symbol = '⚠'
 " ------------------------------------------------------------------------- "

 " ------------------------------------------------------------------------- "
 " Vim-notes
     " Setup
     let g:notes_directories = ['~/backupfiles/Notes']
     let g:notes_suffix = '.markdown'
     let g:notes_tab_indents = 0
     " let g:notes_shadowdir = '~/backupfiles/Notes'

 " ------------------------------------------------------------------------- "

 " ------------------------------------------------------------------------- "
 " Vimtodo
 " help vimtodo
     " You can also add a new entry, with the 'cn' alias. In insert mode, type 'cn'
     " and a new todo entry along with the current date will be added.
     " You can also use <LocalLeader>cn in normal mode to add a new entry.
     " Press <LocalLeader>cs (\cs by default) to change the task status to 'DONE'
     " <LocalLeader>cb to add a checkbox to the beginning of a line.
     " To toggle a checkbox, use the <LocalLeader>cc command.
     " VimTODO can move all completed tasks to another file to reduce clutter. The
     " <LocalLeader>ca command is used for this. Any task that has been closed will
     " be moved to the done file, which by default is 'done.txt' in the same
     " directory as the todo file.
     " The name of the done file can be changed using the g:todo_done_file .vimrc
     " setting or on a per-file basis using the DONEFILE property.

     " Setup
     ":help cterm-colors
     " let g:todo_states=[['TODO(t)', 'NOTE(n)', '|', 'DONE(d)']]
     let g:todo_state_colors= {
         \'DONE': 'Green',
         \'CLOSED': 'Grey',
         \'CANCELLED': 'Red',
         \'TODO': 'Red',
         \'NOTE': 'Blue',
         \'NOTES': 'DarkMagenta',
         \'TASKS': 'DarkBlue'
         \}
     let g:todo_note_file = expand("%:t:r")."-note.txt"
     let g:todo_done_file = expand("%:t:r")."-done.txt"
 " ------------------------------------------------------------------------- "

 " ------------------------------------------------------------------------- "
 " Vim-session
     " let g:session_autosave = "prompt"
     let g:session_autosave = "yes"
     silent !mkdir ~/.vim/sessions > /dev/null 2>&1
     let g:session_directory = "~/.vim/sessions"
     let g:session_default_name = expand("%:t:r")."-session"
     let g:session_default_overwrite = 0
     let g:session_extension = ".vim"


     " Make sure when you quit and you open a new vim the files are not kept
     " open

     " autocmd VimEnter * :silent CloseSession

     " function! TearItDown()
         " exec ':CloseSession'
     " endfunction

     " au VimLeave * silent call TearItDown()


 " ------------------------------------------------------------------------- "

" ------------------------------------------------------------------------- "
" Silver searcher

if executable('ag')

  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  let g:ctrlp_use_caching = 0

  let g:ackprg = 'ag --nogroup --nocolor --column'

endif
" ------------------------------------------------------------------------- "

" ------------------------------------------------------------------------- "
" Ack.vim
" Make it not open in a new tab
" Also make it keep focus

" ------------------------------------------------------------------------- "

" Mappings
    " FOR MAPPINGS: http://hea-www.harvard.edu/~fine/Tech/vi.html
    " :help key-notation
    " :map
    " :imap
    " :nmap
    " :verbose map
    " :help map-verbose
    " :help daw
    " :Listmaps
    " :verbose map! <C-Q>


     " Open Session
     noremap <C-o> <esc>:OpenSession<Space><C-d>

     " Todo prompt
     nmap <leader>c \tp
     " Todo finish
     nmap <leader>f \tns
     " Todo move done
     nmap <leader>1 \tad
     " Todo move notes
     nmap <leader>2 \tmn
     " Todo archive notes
     nmap <leader>3 \tan
     nmap <leader>3 :call MakeNoteFile()<cr>
     " nmap <leader>1 <esc>ggi#<space>vim:ft=todo<cr>:SETTINGS:<cr><tab>+DONEFILE:<cr><esc>kA<esc>:put=expand('%:t:r')<cr>i<bs><esc>A-done.txt<cr>

     " Activate Easymotion
     " nmap ' \w
     nmap ' \W
     nmap " \B
     vmap ' \W
     vmap " \B


 " ------------------------------------------------------------------------- "
 " Vimux
     nmap <leader>0 <esc>:call VimuxOpenPane()<cr>
     nmap <leader>00 <esc>:call VimuxInspectRunner()<cr>
 " ------------------------------------------------------------------------- "

 " ------------------------------------------------------------------------- "
 " Gundo
     nnoremap <leader>9 <esc>:GundoToggle<CR>
 " ------------------------------------------------------------------------- "

 " ------------------------------------------------------------------------- "
 " lastbuf
     ":LastBuf mapping is <c-w><c-z> by default.
     "" You can remapping it by
     map <c-s-t> :LastBuf<CR>

     " g:lastbuf_num option decides the max reopen buf number.
     let g:lastbuf_num=30
     "
     " " this option decides to reopen which level of hided buffer.
     " " :hid   bufhidden  (will always be reopened)
     " " :bun   bufunload  (will be reopened if level >= 1)
     " " :bd    bufdelete  (will be reopened if level >= 2)
     " " :bw    bufwipeout (will never be reopened!CAUTION!!)
     " " default is 1 , means :bd and :bw not be reopened.
     " " if you want the same effect of 'nohidden'.
     " " set it to 0 and  set 'nohidden'
     let g:lastbuf_level=2
 " ------------------------------------------------------------------------- "

 " ------------------------------------------------------------------------- "
 " MRU
     let MRU_Max_Entries = 1000
     let MRU_File = '~/.vim/sessions/MRU'
     let MRU_Auto_Close = 0
 " ------------------------------------------------------------------------- "

 " ------------------------------------------------------------------------- "
 " NERDTree
    let NERDTreeQuitOnOpen=1
 " ------------------------------------------------------------------------- "

 " Mappings
     " FOR MAPPINGS: http://hea-www.harvard.edu/~fine/Tech/vi.html
     " :help key-notation
     " :map
     " :imap
     " :nmap
     " :verbose map
     " :help map-verbose
     " :help daw
     " :Listmaps
     " :verbose map! <C-Q>

     "Change redo command
     map <C-y> <C-R> "Ctrl + Y = redo

     " Ctrl + n = Toggle NERDTree"
     map <C-n> <ESC>:NERDTreeToggle<CR>

     " Ctrl + t = Toggle TagBar
     map <C-t> <ESC>:TagbarToggle<CR>

     " Press space twice to comment current/selected line(s)
     map <leader><Space> <plug>NERDCommenterToggle

     " Space+t is to align by character entered after command
     map <leader>t :Tabularize /

     " Toggle on and off highlight during search
     map <leader>h :set hlsearch!<CR>

     " Shortcut for delete a word
     map <leader>d daw

     " Shortcut for delete a word but keep spaces on either side
     map <leader>dd diwi<Space><Esc>

     " Fast source vimrc
     map <leader>s <Esc>:source $MYVIMRC<CR>

     " Fast saving
     nnoremap <leader>w :w<CR>

     " Ignore compiled files
     set wildignore=*.o,*~,*.pyc

     " Ignore case when searching
     set ignorecase

     " When searching try to be smart about cases
     " set smartcase

     " Toggle case search, as smart/ignore conflict  BROKEN
     " command Case set smartcase!|set ignorecase!

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

     " Hide buffers from :ls when closed
     set hid

     " Create a history of changes for this file that is not destroyed on close

     set undofile
     silent !mkdir ~/vimHistory > /dev/null 2>&1
     set undodir=~/vimHistory

     set splitright

     " Visual mode pressing * (for forward search)  or # (for backward search) searches for the current selection
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

     " Switch Current Working Directory to the directory of the open buffer
     map <leader>cd :cd %:p:h<cr>:pwd<cr>

     " Move a line of text using shift+[j/k] on mac
     nmap <S-Down> mz:m+<cr>`z
     nmap <S-Up> mz:m-2<cr>`z
     vmap <S-Down> :m'>+<cr>`<my`>mzgv`yo`z
     vmap <S-Up> :m'<-2<cr>`>my`<mzgv`yo`z

     " Remove the Windows ^M - when the encodings gets messed up
     noremap <Leader>mm mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

     " Toggle paste mode on and off
     map <leader>pp :setlocal paste!<cr>

     " Browse Old files
     map <leader>op :bro ol<cr>
     " map <leader>oo :CtrlPMRU<cr>

     " Ctrlp version of browsing old files (M.ost R.ecently U.sed)
     nmap ; :CtrlPMRU<cr>

     " Insert new line after current one
     nmap <leader><cr> <esc>:pu_<cr>

     " ------------------------------------------------------------------------- "
     " Split Navigation
         nmap <C-w>- <esc>:vertical resize -5<cr>
         nmap <C-w>= <esc>:vertical resize +5<cr>

        " inoremap  <Up>     <NOP>
        " inoremap  <Down>   <NOP>
        " inoremap  <Left>   <NOP>
        " inoremap  <Right>  <NOP>
        " noremap   <Up>     <NOP>
        " noremap   <Down>   <NOP>
        " noremap   <Left>   <NOP>
        " noremap   <Right>  <NOP>
        " noremap   <Del>  <NOP>
        " inoremap   <Del>  <NOP>

     " Ctrl + [h, j, k, l] = Move to split ← ↓ ↑ →
         noremap <C-H> <C-W>h
         noremap <C-J> <C-W>j
         noremap <C-K> <C-W>k
         noremap <C-L> <C-W>l

     " Open buffer in vertical split
         " noremap <leader>??? <esc>:ls<cr>:vert<space>belowright<space>sb<space>

     " Open a new vsplit with a specific number of lines:
         " noremap <leader>8 :20vnew<cr>

     " ------------------------------------------------------------------------- "

     " ------------------------------------------------------------------------- "
     " Buffer Navigation
         " Switch to buffer from the list
         map <leader>ls <esc>:ls<CR>:b<Space>

         " Q closes the current buffer
         map Q <esc>:bd<cr>

         " Q! force closes the current buffer
         map Q! <esc>:bd!<cr>

         " Close buffer number(s) [use this notation with buffers :1,3bd]
         map <leader>cb <esc>:ls<CR>:bd<left><left>

         " Open file in new buffer
         " REMAP
         " map <S-o> :e<space>

         " Navigate to different buffers
         map <S-Right> <esc>:bnext<cr>
         map <S-Left> <esc>:bprevious<cr>
     " ------------------------------------------------------------------------- "

     " ------------------------------------------------------------------------- "
     " Tab Navigation
         " switch between tabs = gt,gT
         " gt (or :tabn) to go to next tab
         " gT (or :tabp or :tabN) to go to previous tab
         " #gt (or :tabn #) to go to #th tab
         " :tabr to go to first tab
         " :tabl to go to last tab
         " :tabm to move the current tab to the last position
         " :tabm # to move the current tab to the #th position

         " Old working mappings
             " map <C-o> <Esc>:tab sbnext<CR>
             " map <C-t> <Esc>:tabnew<CR>
             " map <leader>to :tabonly<cr>

     " Opens a new tab with the current buffer's path
     map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

     " Open a new tab from specific buffer in the list
     map <leader>ts <esc>:ls<cr>:tabnew<Bar>b

     " Create a new tab, enter filename
     map <leader>nt <esc>:ls<cr>:tabnew<Space>

     nmap # :call SwitchToLastBuffer()<CR>

     " Open a new tab with next file in the buffer loaded
     nmap <leader><tab> <Esc>:tab sbnext<CR>

     " Open a new tab with no filename
     nmap <C-t> <Esc>:tabnew<CR>

     "Close the current tab
     nmap <leader>q <esc>:tabclose<cr>

     " Move to a tab number ( 0 indexed, despite :tabs output )
     nmap <leader>m <esc>:tabs<cr>:tabm<space>

     " Focus on the next tab
     noremap <Tab> <esc>:tabn<cr>

     " Focus on the previous tab
     noremap <S-Tab> <esc>:tabp<cr>

     " Clear all trailing spaces
     nmap \\ <esc>:%s/\s\+$//e<CR>

     " Make entire file of single lines a comma separated list
     nmap <leader>cl <esc><Bslash><Bslash>:%s/\n/, /g<cr>$i<BS><esc><Bslash><Bslash>

     " joining lines
     noremap ,j :join<cr>

 " ------------------------------------------------------------------------- "

 " ------------------------------------------------------------------------- "
 " TO print out what a setting is type:
     ":set *SETTINGNAME*?
 " In command mode (after pressing :)
     " pressing ctrl+f will allow you to see and edit command history
 " ------------------------------------------------------------------------- "

 " ------------------------------------------------------------------------- "
 " CmdlineComplete
     " When editing the command-line (: / etc.), press Ctrl-P or Ctrl-N to complete
     " the word before the cursor, using keywords in the current file. E.g: you
     " want to search for 'elephant' in the buffer, just type /ele and press
     " Ctrl-P. So long as 'elephant' is in the buffer, you will get 'ele' completed
     " into 'elephant'.
 " ------------------------------------------------------------------------- "

 " ------------------------------------------------------------------------- "
 " Printing errors:
     " :mess
     " OR
     " :redir > /tmp/mess.vim
     " :mess
     " G
     " <cr>
     " :redir END
     " :sp /tmp/mess.vim
 " ------------------------------------------------------------------------- "

 " ------------------------------------------------------------------------- "
 " Spell Checking
     "" Pressing ,ss will toggle and untoggle spell checking
     "map <leader>ss :setlocal spell!<cr>
     "
     "" Shortcuts using <leader>
     "map <leader>sn ]s
     "map <leader>sp [s
     "map <leader>sa zg
     "map <leader>s? z=
 " ------------------------------------------------------------------------- "
 "http://zmievski.org/files/talks/codeworks-2009/vim-for-php-programmers.pdf
 "http://learnvimscriptthehardway.stevelosh.com/chapters/40.html
 "http://takac.github.io/2013/01/30/vim-grammar/
 "http://yanpritzker.com/2011/12/16/learn-to-speak-vim-verbs-nouns-and-modifiers/
 "http://takac.github.io/2013/01/30/vim-grammar/
 "http://www.vim.org/docs.php
 "http://vimdoc.sourceforge.net/htmldoc/usr_toc.html
 "http://www.truth.sk/vim/vimbook-OPL.pdf
 "http://www.moolenaar.net/habits.html
 "http://www.oualline.com/vim-cook.html
 " REMOVE WHITESPACES
 "s/\v]\s+"/]"/
 " you can call vim functions defined in vimrc with ':call funct()'
 " Vimrc doesn't load sometimes cause of training whitespaces
