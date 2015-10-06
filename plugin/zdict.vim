if !exists('g:zdict_query_key') || type(g:zdict_query_key) != type('')
    let g:zdict_query_key = '<leader>z'
endif

if !exists('g:zdict_close_window_key') || type(g:zdict_close_window_key) != type('')
    let g:zdict_close_window_key = '<leader><leader>z'
endif

if !exists('g:zdict_configuration_key') || type(g:zdict_configuration_key) != type('')
    let g:zdict_configuration_key = '<leader>Z'
endif

if !exists('g:zdict_default_dict') || type(g:zdict_default_dict) != type('')
    let g:zdict_default_dict = 'yahoo'
endif

if !exists('g:zdict_max_window_width') || type(g:zdict_max_window_width) != type('')
    let g:zdict_max_window_width = 50
endif

execute 'nnoremap <silent> '. g:zdict_query_key .' :call zdict#query()<CR>'
execute 'vnoremap <silent> '. g:zdict_query_key .' :call zdict#query_visual()<CR>'

execute 'nnoremap <silent> '. g:zdict_close_window_key .' :call zdict#close_zdict_window()<CR>'

execute 'nnoremap <silent> '. g:zdict_configuration_key .' :call zdict#configuration()<CR>'
