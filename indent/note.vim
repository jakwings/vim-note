" Vim indent file
" Language:     Note
" Maintainer:   J.W

if exists('b:did_indent')
    finish
endif

let s:cpo_save = &cpo
set cpo&vim


try
    setlocal formatoptions+=j
catch
    setlocal fo-=j
endtry
setlocal fo+=1 fo+=2 fo+=m fo+=t fo+=c fo+=r fo+=o fo+=q fo+=l
setlocal nolisp nocindent nosmartindent autoindent cinwords=
setlocal indentexpr=note#Indent() indentkeys=!^F,o,O
setlocal tabstop=8 softtabstop=2 shiftwidth=2 smarttab
setlocal expandtab copyindent preserveindent

let b:undo_indent = 'setlocal formatoptions< lisp< cindent< smartindent<'
            \ . ' autoindent< cinwords< indentexpr< indentkeys< tabstop<'
            \ . ' softtabstop< shiftwidth< smarttab< expandtab< copyindent<'
            \ . ' preserveindent< textwidth< colorcolumn<'


let &cpo = s:cpo_save
unlet s:cpo_save

let b:did_indent = 1
