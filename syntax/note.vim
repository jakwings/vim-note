" Vim syntax file
" Language:     Note
" Maintainer:   J.W

if exists('b:current_syntax')
    finish
endif

let s:cpo_save = &cpo
set cpo&vim


syn case match

syn match   noteCommentNoteOuch /\v\w@<!%(XXX+|NOTE|ALERT|WTF)\w@!/ contained
hi def link noteCommentNoteOuch Underlined
syn match   noteCommentNoteDamn /\v\w@<!%(FIXME|ISSUE)\w@!/ contained
hi def link noteCommentNoteDamn Error
syn match   noteCommentNoteTodo /\v\w@<!%(TODO|IDEA)\w@!/ contained
hi def link noteCommentNoteTodo Todo
syn cluster noteCommentNote     contains=noteCommentNote.*

syn match   noteComment         /\v%(\s\s|^\s*%(\|\s)?)@<=#.*$/ contains=@noteCommentNote
syn match   noteComment         /\%^#!.*$/
hi def link noteComment         Comment

syn match   noteQuoteMark       /\v^\s*\|($|\s)@=/
hi def link noteQuoteMark       Comment


let &cpo = s:cpo_save
unlet s:cpo_save

let b:current_syntax = 'note'
