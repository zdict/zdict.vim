setlocal noswapfile
setlocal buftype=nofile
setlocal nonu
setlocal nornu
setlocal conceallevel=3
setlocal concealcursor=nic
setlocal cc=

autocmd BufEnter * :call s:check_if_only_zdict_window()

function! s:check_if_only_zdict_window ()
    let l:tabnr = tabpagenr()
    if tabpagewinnr(l:tabnr, '$') == 1 && gettabwinvar(tabnr, 1, 'id') is 'zdict'
        q
    endif
endfunction
