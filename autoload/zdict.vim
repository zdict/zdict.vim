let s:VERSION = '0.2.0'
let s:STATE_NONE = 0
let s:STATE_QUERY = 1
let s:STATE_CONFIG = 2
let s:status = s:STATE_NONE
let s:last_queried_word = ''

let s:_supported_dicts = []
let s:_dict_info = {}
let s:dict_line_offset = 0

function! s:add_dict (dict, title) " {{{
    if has_key(s:_dict_info, a:dict)
        return
    endif
    let l:index = len(s:_supported_dicts)
    let s:_supported_dicts = s:_supported_dicts + [a:dict]
    let s:_dict_info[a:dict] = [l:index, a:title]
endfunction " }}}
function! s:get_dict_title (dict) " {{{
    if has_key(s:_dict_info, a:dict)
        return s:_dict_info[a:dict][1] .' ('. a:dict .')'
    endif
    return '('. a:dict .')'
endfunction " }}}
function! s:get_dict_number (dict) " {{{
    if has_key(s:_dict_info, a:dict)
        return s:_dict_info[a:dict][0]
    endif
    return 0
endfunction " }}}
function! s:get_dict_list () " {{{
    return s:_supported_dicts
endfunction " }}}
function! s:get_last_dict (dict) " {{{
    let l:dict_number = (s:get_dict_number(g:zdict_default_dict) - 1) % len(s:_supported_dicts)
    return s:_supported_dicts[l:dict_number]
endfunction " }}}
function! s:get_next_dict (dict) " {{{
    let l:dict_number = (s:get_dict_number(g:zdict_default_dict) + 1) % len(s:_supported_dicts)
    return s:_supported_dicts[l:dict_number]
endfunction " }}}

call s:add_dict('yahoo', 'Yahoo Dictionary')
call s:add_dict('urban', 'Urban Dictionary')
call s:add_dict('moe', '萌典')

function! s:get_word () " {{{
    let l:row = line('.')
    let l:col = col('.')
    let l:mode = mode()

    let l:old_z_reg = @z
    if l:mode == 'n'
        silent normal! "zyiw
    elseif l:mode == 'v' || l:mode == 'V' || l:mode == ""
        silent normal! "zy
    endif
    let l:word = @z
    let @z = l:old_z_reg

    call cursor(l:row, l:col)
    return l:word
endfunction " }}}

function! s:get_zdict_window_id () " {{{
    let l:tabnr = tabpagenr()
    for winnr in range(1, tabpagewinnr(l:tabnr, '$'))
        if gettabwinvar(tabnr, winnr, 'id') is 'zdict'
            return winnr
        endif
    endfor
    return 0
endfunction " }}}

function! s:initialize_window (window_type) " {{{
    let l:winnr = s:get_zdict_window_id()
    if l:winnr != 0
        execute 'silent '. l:winnr .'wincmd w'
        q
    endif
    vnew
    let w:id = 'zdict'
    set modifiable
    silent 1,$delete _
    execute "silent normal! \<C-w>L"
    vertical resize 50
    execute 'setlocal ft='. a:window_type
endfunction " }}}

function! s:query (word) " {{{
    let l:trimed_word = substitute(a:word, '\v[ \n\r]*$', '', '')
    let l:trimed_word = substitute(l:trimed_word, '\v[\n\r]', ' ', 'g')
    let l:statsline_word = substitute(l:trimed_word, '\v[ \n\r]', '\\ ', 'g')
    execute 'setlocal statusline=[zdict]\ '. l:statsline_word
    execute "silent r !zdict --dict ". g:zdict_default_dict ." '". l:trimed_word ."'"
endfunction " }}}

function! s:post_query () " {{{
    call s:normalize_color_code()
    silent 1,1delete _
endfunction " }}}

function! s:return_to_user () " {{{
    set nomodifiable
    execute "normal! \<C-w>\<C-w>"
endfunction " }}}

function! s:normalize_color_code () " {{{
    " Dark colors
    silent! %s/\v\[30m/⣐/g " black    (U+28D0)
    silent! %s/\v\[31m/⣑/g " red
    silent! %s/\v\[32m/⣒/g " green
    silent! %s/\v\[33m/⣓/g " yellow
    silent! %s/\v\[34m/⣔/g " navy
    silent! %s/\v\[35m/⣕/g " magenta
    silent! %s/\v\[36m/⣖/g " cyan
    silent! %s/\v\[37m/⣗/g " white    (U+28D7)

    " Light colors
    silent! %s/\v\[(1;30|30;1)m/⣀/g " U+28C0
    silent! %s/\v\[(1;31|31;1)m/⣁/g
    silent! %s/\v\[(1;32|32;1)m/⣂/g
    silent! %s/\v\[(1;33|33;1)m/⣃/g
    silent! %s/\v\[(1;34|34;1)m/⣄/g
    silent! %s/\v\[(1;35|35;1)m/⣅/g
    silent! %s/\v\[(1;36|36;1)m/⣆/g
    silent! %s/\v\[(1;37|37;1)m/⣇/g " U+28C7

    " End color escape sequence
    silent! %s/\v\[0?m/⣗/g

    " Optimization
    " remove empty color string
    silent! %s/\v[⣐⣑⣒⣓⣔⣕⣖⣗⣀⣁⣂⣃⣄⣅⣆⣇]⣗//g

    " remove redundent color code
    silent! %s/\v([⣐⣑⣒⣓⣔⣕⣖⣗⣀⣁⣂⣃⣄⣅⣆⣇])([^⣐⣑⣒⣓⣔⣕⣖⣗⣀⣁⣂⣃⣄⣅⣆⣇]*)\1/\1\2/g

    " remove useless closing color code on line start
    silent! %s/\v^([^⣐⣑⣒⣓⣔⣕⣖⣗⣀⣁⣂⣃⣄⣅⣆⣇]*)⣗/\1/g

    " compress color code
    silent! %s/\v[⣐⣑⣒⣓⣔⣕⣖⣗⣀⣁⣂⣃⣄⣅⣆⣇]([⣐⣑⣒⣓⣔⣕⣖⣗⣀⣁⣂⣃⣄⣅⣆⣇])/\1/g
endfunction " }}}

function! s:destroy_window () " {{{
    let l:winnr = s:get_zdict_window_id()
    if l:winnr != 0
        execute 'silent '. l:winnr .'wincmd w'
        q
    endif
endfunction " }}}

function! zdict#close_zdict_window () " {{{
    call s:destroy_window()
    redraw!
endfunction " }}}

function! zdict#query () " {{{
    if !executable('zdict')
        echo 'zdict is not installed, please install it first!'
        echo 'Please refer to https://github.com/M157q/zdict.git'
        return
    endif
    let l:word = s:get_word()
    if s:get_zdict_window_id() == 0 || s:status != s:STATE_QUERY || l:word !=? s:last_queried_word
        echo 'Querying ...'
        let s:status = s:STATE_QUERY
        call s:initialize_window('zdict')
        call s:query(l:word)
        call s:post_query()
        call s:return_to_user()
    else
        call zdict#close_zdict_window()
    endif
    let s:last_queried_word = l:word
endfunction " }}}

function! zdict#query_visual () range " {{{
    normal! gv
    call zdict#query()
endfunction " }}}

function! s:configuration_show () " {{{
    execute 'setlocal statusline=zdict\ Configurations'
    let l:zdict_version = system('zdict --version')
    let l:zdict_version = substitute(l:zdict_version, '\v[^mh]*[mh]', '', '')
    let l:zdict_version = substitute(l:zdict_version, '\v[\n\r\t]', '', '')
    let l:seperate_line = ' '. repeat('=', winwidth(0) - 2)
    call setline(1,  ' '. l:zdict_version .' Configurations')
    call setline(2,  l:seperate_line)
    call setline(3,  ' Available dictionaries:')
    let s:dict_line_offset = 4
    let l:offset = s:dict_line_offset
    for dict in s:get_dict_list()
        call setline(l:offset, ' ( ) '. s:get_dict_title(dict))
        let l:offset = l:offset + 1
    endfor
    call setline(l:offset + 0, '')
    call setline(l:offset + 1, ' j, k, up, down: select dictionary')
    call setline(l:offset + 2, ' Enter: close this window')
    call setline(l:offset + 3, l:seperate_line)
    call setline(l:offset + 4, ' These settings are temporary')
    call setline(l:offset + 5, ' Put them in your vimrc to make it permanent')
    call setline(l:offset + 6, l:seperate_line)
    call setline(l:offset + 7, ' zdict.vim-'. s:VERSION)
endfunction " }}}

function! s:configuration_select_dict (dict) " {{{
    set modifiable
    let l:dict_line_number = s:get_dict_number(g:zdict_default_dict) + s:dict_line_offset
    call setline(l:dict_line_number, ' ( ) '. s:get_dict_title(g:zdict_default_dict))
    let g:zdict_default_dict = a:dict
    let l:dict_line_number = s:get_dict_number(a:dict) + s:dict_line_offset
    call setline(l:dict_line_number, ' (*) '. s:get_dict_title(a:dict))
    call cursor(l:dict_line_number, 3)
endfunction " }}}

function! zdict#configuration () " {{{
    if s:get_zdict_window_id() == 0 || s:status != s:STATE_CONFIG
        let s:status = s:STATE_CONFIG
        call s:initialize_window('zdict-config')
        call s:configuration_show()
        call s:configuration_select_dict(g:zdict_default_dict)
        set nomodifiable
    else
        call zdict#close_zdict_window()
    endif
endfunction " }}}

function! zdict#select_last_dictionary () " {{{
    call s:configuration_select_dict(s:get_last_dict(g:zdict_default_dict))
    set nomodifiable
endfunction " }}}

function! zdict#select_next_dictionary () " {{{
    call s:configuration_select_dict(s:get_next_dict(g:zdict_default_dict))
    set nomodifiable
endfunction " }}}
