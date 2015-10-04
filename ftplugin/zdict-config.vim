setlocal noswapfile
setlocal buftype=nofile
setlocal nonu
setlocal nornu
setlocal conceallevel=3
setlocal concealcursor=nic
setlocal cc=

nnoremap <buffer> <silent> <UP> :call zdict#select_last_dictionary()<CR>
nnoremap <buffer> <silent> <DOWN> :call zdict#select_next_dictionary()<CR>
nnoremap <buffer> <silent> k :call zdict#select_last_dictionary()<CR>
nnoremap <buffer> <silent> j :call zdict#select_next_dictionary()<CR>
nnoremap <buffer> <silent> <CR> :call zdict#close_zdict_window()<CR>
execute 'nnoremap <buffer> <silent> '. g:zdict_query_key .' <NOP>'

autocmd BufEnter * :call s:check_if_only_zdict_window()

function! s:check_if_only_zdict_window ()
    let l:tabnr = tabpagenr()
    if tabpagewinnr(l:tabnr, '$') == 1 && gettabwinvar(tabnr, 1, 'id') is 'zdict'
        q
    endif
endfunction
