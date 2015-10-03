syn match zdict_config_title    _zdict Configurations_
hi        zdict_config_title    ctermfg=Yellow

syn match zdict_config_title_line   _\v\=+_
hi        zdict_config_title_line   ctermfg=DarkGray

syn match zdict_selected_single_item    _\v\(\*\)_
hi        zdict_selected_single_item    ctermfg=LightGreen

syn match zdict_unselected_single_item  _\v\(\ \)_
hi        zdict_unselected_single_item  ctermfg=White
