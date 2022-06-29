" ***************************
"  Setup
" ***************************

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf'


" ***************************
"  API bindings
" ***************************

function! LspShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

function! LspGotoDefinition()
  call CocActionAsync('jumpDefinition')
endfunction

function! LspGotoTypeDefinition()
  call CocActionAsync('jumpTypeDefinition')
endfunction

function! LspShowReferences()
  call CocActionAsync('jumpReferences')
endfunction

function! LspRename()
  call CocActionAsync('rename')
endfunction

function! LspCodeAction()
  execute 'CocFzfList actions'
endfunction

function! LspListSymbols()
  execute 'CocFzfList symbols'
endfunction

function! LspDisable()
  " call Unimplemented(expand('<sfile>'))
endfunction

let g:coc_default_semantic_highlight_groups = 1
