" =============== ============================================================
" Name           : python.vim
" Description    : |gf| - "goto file" for python module
" Author         : Zhao Cai <caizhaoff@gmail.com>
" HomePage       : https://github.com/zhaocai/vim-gf-python
" Date Created   : Sun 16 Sep 2012 04:37:14 PM EDT
" Last Modified  : Sun 16 Sep 2012 07:17:19 PM EDT
" Tag            : [ gf, python ]
" Copyright      : © 2012 by Zhao Cai,
"                  Released under current GPL license.
" =============== ============================================================






if exists('g:loaded_gf_python')
  finish
endif
let g:loaded_gf_python = 1

call gf#user#extend('gf#python#find', 200)

command! -nargs=1 PyOpenModule exec 'silent edit ' . gf#python#find_module_path(<f-args>)





