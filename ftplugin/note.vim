" Vim filetype plugin file
" Language:     Note
" Maintainer:   J.W

if exists('b:did_ftplugin')
    finish
endif

let s:cpo_save = &cpo
set cpo&vim


let &l:comments = ':##,f:#'
let &l:commentstring = '#%s'

"let &l:path = '.,,'
"let &l:include = '^\s*#\s*include\s'
let &l:includeexpr = ''
let &l:define = ''
let &l:isident = '@,48-57,_'
let &l:iskeyword = '@,48-57,_'
let &l:suffixesadd = '.note,.txt'
let &l:matchpairs = '(:),{:},[:]'
let b:undo_ftplugin = 'setlocal comments< commentstring< path< include<'
            \ . ' includeexpr< define< isident< iskeyword< suffixesadd<'
            \ . ' matchpairs<'

let b:match_ignorecase = 0
let b:match_skip = 's:Comment'
let b:match_words = '(:),\[:\],{:}'
let b:undo_ftplugin .= ' | unlet b:match_ignorecase b:match_skip b:match_words'
source $VIMRUNTIME/macros/matchit.vim

let b:undo_ftplugin .= ' | call note#RulerToggle(0)'
call note#RulerToggle(1)


let &cpo = s:cpo_save
unlet s:cpo_save

let b:did_ftplugin = 1
