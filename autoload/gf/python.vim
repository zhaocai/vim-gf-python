" =============== ============================================================
" Name           : python.vim
" Description    : |gf| - "goto file" for python module
" Author         : Zhao Cai <caizhaoff@gmail.com>
" HomePage       : https://github.com/zhaocai/vim-gf-python
" Date Created   : Sun 16 Sep 2012 04:37:14 PM EDT
" Last Modified  : Sun 16 Sep 2012 07:08:06 PM EDT
" Tag            : [ gf, python ]
" Copyright      : © 2012 by Zhao Cai,
"                  Released under current GPL license.
" =============== ============================================================



function gf#python#find()
    if &ft != 'python'
        return 0
    endif


    let path = gf#python#find_module_path(expand("<cfile>"))
    return
    \ path is ''
    \ ? 0
    \ : {
    \     'path': path,
    \     'line': 0,
    \     'col' : 0,
    \   }

endfunction

function gf#python#find_module_path(module)
python << __PY__
import os, sys
import vim
import inspect
def python_find_module_path():
    filepath = ''
    sys.path.append(os.getcwd())

    name = vim.eval('a:module')
    try:
        module = __import__(name)
        filepath = inspect.getfile(module)
        if filepath:
            import re
            filepath = re.sub(".py[co]", ".py", filepath)
        else:
            print "E447: can't find module `%s` source" % name
    except ImportError:
        print "E447: can't find `%s` module" % name
    return filepath
__PY__

    return pyeval('python_find_module_path()')
endfunction
