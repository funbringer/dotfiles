function! LspShowDocumentation()
  throw 'reuse code'
endfunction

function! LspGotoDefinition()
  execute "normal \<C-]>"
endfunction

function! LspShowReferences()
  call Unimplemented(expand('<sfile>'))
endfunction

function! LspRename()
  call Unimplemented(expand('<sfile>'))
endfunction

function! LspCodeAction()
  call Unimplemented(expand('<sfile>'))
endfunction

function! LspDisable()
  " This function does nothing
endfunction
