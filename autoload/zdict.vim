function! s:get_word () " {{{
    let l:row = line('.')
    let l:col = col('.')
    normal! "zyiw
    call cursor(l:row, l:col)
    return @z
endfunction " }}}

function! s:initialize_window () " {{{
    if !exists('s:zdict_winnr') || winheight(s:zdict_winnr) == -1
        vnew
        let s:zdict_winnr = winnr()
    else
        execute 'silent '. s:zdict_winnr .'wincmd w'
        silent 1,$delete _
    endif
    execute "silent normal! \<C-w>L"
    vertical resize 50
    setlocal ft=zdict
endfunction " }}}

function s:query (word) " {{{
    execute 'setlocal statusline=[zdict]\ '. a:word
    execute 'silent r !zdict '. a:word
endfunction " }}}

function! s:post_query () " {{{
    call s:normalize_color_code()
    silent 1,1delete _
    execute "normal! \<C-w>\<C-w>"
endfunction " }}}

function! s:normalize_color_code () " {{{
    " Dark colors
    silent! %s/\v\[30m/[bb;/g " black
    silent! %s/\v\[31m/[rb;/g " red
    silent! %s/\v\[32m/[gb;/g " green
    silent! %s/\v\[33m/[yb;/g " yellow
    silent! %s/\v\[34m/[nb;/g " navy
    silent! %s/\v\[35m/[mb;/g " magenta
    silent! %s/\v\[36m/[cb;/g " cyan
    silent! %s/\v\[37m/[wb;/g " white

    " Light colors
    silent! %s/\v\[(1;30|30;1)m/[Bb;/g
    silent! %s/\v\[(1;31|31;1)m/[Rb;/g
    silent! %s/\v\[(1;32|32;1)m/[Gb;/g
    silent! %s/\v\[(1;33|33;1)m/[Yb;/g
    silent! %s/\v\[(1;34|34;1)m/[Nb;/g
    silent! %s/\v\[(1;35|35;1)m/[Mb;/g
    silent! %s/\v\[(1;36|36;1)m/[Cb;/g
    silent! %s/\v\[(1;37|37;1)m/[Wb;/g

    " End color escape sequence
    silent! %s/\v\[0?m/[;/g

    " Optimization
    " remove empty color string
    silent! %s/\v\[..;\[;//g

    " remove redundent closing color code
    silent! %s/\v\[;([^]*)\[;/[;\1/g

    " remove useless closing color code on line start
    silent! %s/\v^([^]*)\[;/\1/g
endfunction " }}}

function! zdict#query ()
    echo "Querying ..."
    let l:word = s:get_word()
    call s:initialize_window()
    call s:query(l:word)
    call s:post_query()
endfunction
