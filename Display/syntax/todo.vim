" Vim syntax file
" Maintainer: Derek Louie
" Latest Revision: Nov 7 2013


" WORKING FILE FROM: http://stackoverflow.com/questions/2193157/vim-simple-steps-to-create-syntax-highlight-file-for-logfiles
" This creates a keyword ERROR and puts it in the highlight group called logError
:syn keyword logError ERROR
" This creates a match on the date and puts in the highlight group called logDate.  The
" nextgroup and skipwhite makes vim look for logTime after the match
:syn match logDate /^\d\{4}-\d\{2}-\d\{2}/ nextgroup=logTime skipwhite

" This creates a match on the time (but only if it follows the date)
:syn match logTime /\d\{2}:\d\{2}:\d\{2},\d\{3}/

" Now make them appear:
" Link just links logError to the colouring for error
hi link logError Error
" Def means default colour - colourschemes can override
hi def logDate guibg=yellow guifg=blue
hi def logTime guibg=green guifg=white
hi logError ctermfg=Blue guifg=Blue  

" To run:
" source ~/backupfiles/syntax/todo.vim

" Keywords
:syn keyword todoKeyWords TODO Todo todo " nextgroup=restOfLine skipwhite
:syn keyword doneKeyWords DONE Done done " nextgroup=restOfLine skipwhite

" Matches (keywords that correspond to regex's)
" syn match restOfLine '/.*(\n|\r)/'
:syn match restOfLine /(.*)$/
" :syn match aLine /\v(.*)$/
:syn match personalTodo /\v(TODO|Todo|todo)/ nextgroup=restOfLine skipwhite
:syn match personalDone /\v(DONE|Done|done)/ nextgroup=restOfLine skipwhite
:syn match myTodo contained "\<\(TODO\|FIXME\)"

" :syn match personalTodo /\<TODO\>/ nextgroup=restOfLine skipwhite
" :syn match personalDone /\<DONE\>/ nextgroup=restOfLine skipwhite
" Regions
" Color links 
" hi link todoKeyWords personalTodo 
" hi link doneKeyWords personalDone 

" Code to highlight
" hi todoKeyWords ctermfg=Green guifg=Green
" hi doneKeyWords ctermfg=Red guifg=Red
" hi personalTodo ctermfg=201 guifg=#ff00ff
hi myTodo ctermfg=201 guifg=#ff00ff
hi personalTodo ctermfg=Green guifg=Green
hi personalDone ctermfg=Red guifg=Red
:syn region personalTodo start=/\v\%^/ end=/\v\%$/ fold transparent
" Resources
" http://vim.wikia.com/wiki/Creating_your_own_syntax_files
" Tests:
" TODO
" DONE
" todo
" done
" myTodo
" myDone
