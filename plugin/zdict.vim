if !exists('g:zdict_query_key') || type(g:zdict_query_key) != type('')
    let g:zdict_query_key = '<leader>z'
endif

if !exists('g:zdict_close_window_key') || type(g:zdict_query_key) != type('')
    let g:zdict_close_window_key = '<leader><leader>z'
endif

execute "nnoremap <silent> ". g:zdict_query_key ." :call zdict#query()<CR>"
execute "vnoremap <silent> ". g:zdict_query_key ." :call zdict#query_visual()<CR>"

execute "nnoremap <silent> ". g:zdict_close_window_key ." :call zdict#close_zdict_window()<CR>"
