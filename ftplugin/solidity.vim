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

" return full path of local solhint executable
"  or an empty string if no executable found
fun! s:GetSolhintExec (node_modules)
  let solhint_guess = a:node_modules is '' ? '' : a:node_modules . '.bin/solhint'
  return exepath(solhint_guess)
endfun

" if solhint_exec found successfully, set it for the current buffer
fun! s:LetSolhintExec (solhint_exec)
  if a:solhint_exec isnot ''
    let b:syntastic_solidity_solhint_exec = a:solhint_exec
  endif
endfun

fun! s:main ()
  let node_modules = s:GetNodeModulesAbsPath()
  let solhint_exec = s:GetSolhintExec(node_modules)
  call s:LetSolhintExec(solhint_exec)
endfun

call s:main()
