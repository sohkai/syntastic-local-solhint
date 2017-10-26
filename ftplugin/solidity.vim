" return full path with the trailing slash
"  or an empty string if we're not in an npm project
fun! s:GetNodeModulesAbsPath ()
  let lcd_saved = fnameescape(getcwd())
  silent! exec "lcd" expand('%:p:h')
  let path = finddir('node_modules', '.;')
  exec "lcd" lcd_saved

  " fnamemodify will return full path with trailing slash;
  " if no node_modules found, we're safe
  return path is '' ? '' : fnamemodify(path, ':p')
endfun

" return full path of local solium executable
"  or an empty string if no executable found
fun! s:GetSoliumExec (node_modules)
  let solium_guess = a:node_modules is '' ? '' : a:node_modules . '.bin/solium'
  return exepath(solium_guess)
endfun

" if solium_exec found successfully, set it for the current buffer
fun! s:LetSoliumExec (solium_exec)
  if a:solium_exec isnot ''
    let b:syntastic_solidity_solium_exec = a:solium_exec
  endif
endfun

fun! s:main ()
  let node_modules = s:GetNodeModulesAbsPath()
  let solium_exec = s:GetSoliumExec(node_modules)
  call s:LetSoliumExec(solium_exec)
endfun

call s:main()
