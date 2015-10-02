syn match ColorEscapeSequence _\v\[[^mh]*[mh]_ conceal cchar=.
syn match MyColorEscapeSequence _\v[⣐⣑⣒⣓⣔⣕⣖⣗⣀⣁⣂⣃⣄⣅⣆⣇]_ conceal cchar=.

syn match BlackColorText        _\v(⣐)@<=[^⣐⣑⣒⣓⣔⣕⣖⣗⣀⣁⣂⣃⣄⣅⣆⣇]+([⣐⣑⣒⣓⣔⣕⣖⣗⣀⣁⣂⣃⣄⣅⣆⣇])@=_
syn match DarkRedColorText      _\v(⣑)@<=[^⣐⣑⣒⣓⣔⣕⣖⣗⣀⣁⣂⣃⣄⣅⣆⣇]+([⣐⣑⣒⣓⣔⣕⣖⣗⣀⣁⣂⣃⣄⣅⣆⣇])@=_
syn match DarkGreenColorText    _\v(⣒)@<=[^⣐⣑⣒⣓⣔⣕⣖⣗⣀⣁⣂⣃⣄⣅⣆⣇]+([⣐⣑⣒⣓⣔⣕⣖⣗⣀⣁⣂⣃⣄⣅⣆⣇])@=_
syn match DarkYellowColorText   _\v(⣓)@<=[^⣐⣑⣒⣓⣔⣕⣖⣗⣀⣁⣂⣃⣄⣅⣆⣇]+([⣐⣑⣒⣓⣔⣕⣖⣗⣀⣁⣂⣃⣄⣅⣆⣇])@=_
syn match DarkBlueColorText     _\v(⣔)@<=[^⣐⣑⣒⣓⣔⣕⣖⣗⣀⣁⣂⣃⣄⣅⣆⣇]+([⣐⣑⣒⣓⣔⣕⣖⣗⣀⣁⣂⣃⣄⣅⣆⣇])@=_
syn match DarkMagentaColorText  _\v(⣕)@<=[^⣐⣑⣒⣓⣔⣕⣖⣗⣀⣁⣂⣃⣄⣅⣆⣇]+([⣐⣑⣒⣓⣔⣕⣖⣗⣀⣁⣂⣃⣄⣅⣆⣇])@=_
syn match DarkCyanColorText     _\v(⣖)@<=[^⣐⣑⣒⣓⣔⣕⣖⣗⣀⣁⣂⣃⣄⣅⣆⣇]+([⣐⣑⣒⣓⣔⣕⣖⣗⣀⣁⣂⣃⣄⣅⣆⣇])@=_
syn match LightGrayColorText    _\v(⣗)@<=[^⣐⣑⣒⣓⣔⣕⣖⣗⣀⣁⣂⣃⣄⣅⣆⣇]+([⣐⣑⣒⣓⣔⣕⣖⣗⣀⣁⣂⣃⣄⣅⣆⣇])@=_
hi        BlackColorText        ctermfg=Black
hi        DarkRedColorText      ctermfg=DarkRed
hi        DarkGreenColorText    ctermfg=DarkGreen
hi        DarkYellowColorText   ctermfg=DarkYellow
hi        DarkBlueColorText     ctermfg=DarkBlue
hi        DarkMagentaColorText  ctermfg=DarkMagenta
hi        DarkCyanColorText     ctermfg=DarkCyan
hi        LightGrayColorText    ctermfg=LightGray

syn match DarkGrayText          _\v(⣀)@<=[^⣐⣑⣒⣓⣔⣕⣖⣗⣀⣁⣂⣃⣄⣅⣆⣇]+([⣐⣑⣒⣓⣔⣕⣖⣗⣀⣁⣂⣃⣄⣅⣆⣇])@=_
syn match RedColorText          _\v(⣁)@<=[^⣐⣑⣒⣓⣔⣕⣖⣗⣀⣁⣂⣃⣄⣅⣆⣇]+([⣐⣑⣒⣓⣔⣕⣖⣗⣀⣁⣂⣃⣄⣅⣆⣇])@=_
syn match GreenColorText        _\v(⣂)@<=[^⣐⣑⣒⣓⣔⣕⣖⣗⣀⣁⣂⣃⣄⣅⣆⣇]+([⣐⣑⣒⣓⣔⣕⣖⣗⣀⣁⣂⣃⣄⣅⣆⣇])@=_
syn match YellowColorText       _\v(⣃)@<=[^⣐⣑⣒⣓⣔⣕⣖⣗⣀⣁⣂⣃⣄⣅⣆⣇]+([⣐⣑⣒⣓⣔⣕⣖⣗⣀⣁⣂⣃⣄⣅⣆⣇])@=_
syn match BlueColorText         _\v(⣄)@<=[^⣐⣑⣒⣓⣔⣕⣖⣗⣀⣁⣂⣃⣄⣅⣆⣇]+([⣐⣑⣒⣓⣔⣕⣖⣗⣀⣁⣂⣃⣄⣅⣆⣇])@=_
syn match MagentaColorText      _\v(⣅)@<=[^⣐⣑⣒⣓⣔⣕⣖⣗⣀⣁⣂⣃⣄⣅⣆⣇]+([⣐⣑⣒⣓⣔⣕⣖⣗⣀⣁⣂⣃⣄⣅⣆⣇])@=_
syn match CyanColorText         _\v(⣆)@<=[^⣐⣑⣒⣓⣔⣕⣖⣗⣀⣁⣂⣃⣄⣅⣆⣇]+([⣐⣑⣒⣓⣔⣕⣖⣗⣀⣁⣂⣃⣄⣅⣆⣇])@=_
syn match GrayColorText         _\v(⣇)@<=[^⣐⣑⣒⣓⣔⣕⣖⣗⣀⣁⣂⣃⣄⣅⣆⣇]+([⣐⣑⣒⣓⣔⣕⣖⣗⣀⣁⣂⣃⣄⣅⣆⣇])@=_
hi        DarkGrayText          ctermfg=DarkGray
hi        RedColorText          ctermfg=Red
hi        GreenColorText        ctermfg=Green
hi        YellowColorText       ctermfg=Yellow
hi        BlueColorText         ctermfg=Blue
hi        MagentaColorText      ctermfg=Magenta
hi        CyanColorText         ctermfg=Cyan
hi        GrayColorText         ctermfg=White
