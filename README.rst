=============================
zdict.vim |version| |license|
=============================

The goal of zdict.vim is to integrated with zdict_ - an online dictionary framework written in Python.


Usage
-----

zdict.vim comes with some configurable key mappings:

* Query

  ..  code-block:: vim

      let g:zdict_query_key = '<leader>z'

  - Move cursor on a word, or select many with visual mode, and ``<leader>z``, zdict.vim gives you a split window to display the query result

* Close zdict window

  ..  code-block:: vim

      let g:zdict_close_window_key = '<leader><leader>z'

  - Press ``<leader><leader>z`` in normal mode to close zdict window
  - You can also query same word/sentence again to the same thing

* Open Configurations Window

  ..  code-block:: vim

      let g:zdict_configuration_key = '<leader>Z'

  - Change configurations on the fly, but remember to set them in your vimrc if you like them

* Set default dictionary

  ..  code-block:: vim

      let g:zdict_default_dict = 'yahoo'

  - zdict have multiple dictionary backends, currently these are available

    + ``yahoo``: Yahoo Dictionary
    + ``urban``: Urban Dictionary
    + ``moe``: 萌典
    + ``all``: query all backends

* Set Maximum zdict Window Size

  ..  code-block:: vim

      let g:zdict_max_window_width = 50

  - zdict.vim tries to get as more space as possible, and tries to leave 79 characters for user


Installation
------------

1.  Install zdict_

2.  Install zdict.vim with Vundle_

    ..  code-block:: vim

        Bundle 'zdict/zdict.vim'

    + Run ``:PluginInstall`` in vim

3.  Tada! Everything should works fine.  If not, please send me a issue


Versions
--------

The version number of zdict.vim looks like this: ``<major>.<minor>.<patch>``

For a user who installed zdict.vim,

* Major version number changed: Public interface or default configurations may changed, check change log before upgrade
* Minor version number changed: New feature added, and old feature should still work
* Patch version number changed: Just upgrade, some bugs is fixed


Environment
-----------

Tested with vim 7.4.729

..  _zdict: https://github.com/zdict/zdict
..  _Vundle: https://github.com/VundleVim/Vundle.vim

..  |version| image:: https://img.shields.io/badge/version-0.2.0-green.svg
    :target: https://github.com/zdict/zdict.vim

..  |license| image:: https://img.shields.io/badge/license-WTFPL-blue.svg
    :target: https://github.com/zdict/zdict.vim/blob/master/LICENSE.txt
