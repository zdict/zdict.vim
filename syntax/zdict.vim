syn match ColorEscapeSequence _\v\[[^mh]*[mh]_ conceal cchar=.
syn match MyColorEscapeSequence _\v\[(..)?;_ conceal cchar=.

syn match BlackColorText        _\v(\[bb;)@<=[^]+(\[;)@=_
hi        BlackColorText        ctermfg=Black
syn match DarkRedColorText      _\v(\[rb;)@<=[^]+(\[;)@=_
hi        DarkRedColorText      ctermfg=DarkRed
syn match DarkGreenColorText    _\v(\[gb;)@<=[^]+(\[;)@=_
hi        DarkGreenColorText    ctermfg=DarkGreen
syn match DarkYellowColorText   _\v(\[yb;)@<=[^]+(\[;)@=_
hi        DarkYellowColorText   ctermfg=DarkYellow
syn match DarkBlueColorText     _\v(\[nb;)@<=[^]+(\[;)@=_
hi        DarkBlueColorText     ctermfg=DarkBlue
syn match DarkMagentaColorText  _\v(\[mb;)@<=[^]+(\[;)@=_
hi        DarkMagentaColorText  ctermfg=DarkMagenta
syn match DarkCyanColorText     _\v(\[cb;)@<=[^]+(\[;)@=_
hi        DarkCyanColorText     ctermfg=DarkCyan
syn match LightGrayColorText    _\v(\[wb;)@<=[^]+(\[;)@=_
hi        LightGrayColorText    ctermfg=LightGray

syn match DarkGrayText          _\v(\[Bb;)@<=[^]+(\[;)@=_
hi        DarkGrayText          ctermfg=DarkGray
syn match RedColorText          _\v(\[Rb;)@<=[^]+(\[;)@=_
hi        RedColorText          ctermfg=Red
syn match GreenColorText        _\v(\[Gb;)@<=[^]+(\[;)@=_
hi        GreenColorText        ctermfg=Green
syn match YellowColorText       _\v(\[Yb;)@<=[^]+(\[;)@=_
hi        YellowColorText       ctermfg=Yellow
syn match BlueColorText         _\v(\[Nb;)@<=[^]+(\[;)@=_
hi        BlueColorText         ctermfg=Blue
syn match MagentaColorText      _\v(\[Mb;)@<=[^]+(\[;)@=_
hi        MagentaColorText      ctermfg=Magenta
syn match CyanColorText         _\v(\[Cb;)@<=[^]+(\[;)@=_
hi        CyanColorText         ctermfg=Cyan
syn match GrayColorText         _\v(\[Wb;)@<=[^]+(\[;)@=_
hi        GrayColorText         ctermfg=White
