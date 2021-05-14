" Vim plugin file
" Language:     Note
" Maintainer:   J.W

let s:cpo_save = &cpo
set cpo&vim


function! note#Indent()
    let l:delta = (mode() =~# '^[iR]$')
    return indent(prevnonblank(v:lnum - l:delta))
endfunction

function! note#RulerToggle(...)
    if a:0 < 1 ? !exists('w:note_ruled') : a:1
        call s:Setup()
    else
        call s:Cleanup()
    endif
endfunction

function! s:Setup()
    if exists('w:note_ruled')
        return
    endif
    let w:note_ruled = 0

    augroup note
        autocmd! * <buffer>
        autocmd BufWinEnter <buffer> call <SID>Setup()
        autocmd BufWinLeave <buffer> call <SID>Cleanup()
        if exists('##TextChanged')
            autocmd TextChanged <buffer> call <SID>ShowTrailingSpace(1)
        endif
        if exists('##TextChangedI')
            autocmd TextChangedI <buffer> call <SID>ShowTrailingSpace(1)
        else
            autocmd InsertEnter <buffer> call <SID>ShowTrailingSpace(0)
            autocmd InsertLeave <buffer> call <SID>ShowTrailingSpace(1)
        endif
    augroup end

    let w:note_ruled = 1
    call s:ShowRuler(1)
    call s:ShowTrailingSpace(1)
endfunction

function! s:Cleanup()
    if !exists('w:note_ruled')
        return
    endif
    unlet w:note_ruled

    autocmd! note * <buffer>

    call s:ShowRuler(0)
    call s:ShowTrailingSpace(0)

    unlet! w:note_trailing
endfunction

function! s:ShowTrailingSpace(yes)
    if exists('w:note_trailing') && w:note_trailing
        call matchdelete(w:note_trailing)
        let w:note_trailing = 0
    endif
    if a:yes && exists('w:note_ruled') && w:note_ruled
        let w:note_trailing = matchadd('Underlined', '\s\+\%#\@!$', -1)
    endif
endfunction

function! s:ShowRuler(yes)
    if a:yes && exists('w:note_ruled') && w:note_ruled
        if &l:textwidth <= 0
            let &l:textwidth = 72
        endif
        let &l:colorcolumn = '+1'
    else
        let &l:colorcolumn = ''
    endif
endfunction


let &cpo = s:cpo_save
unlet s:cpo_save
