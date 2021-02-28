" ***************************
"  Setup
" ***************************

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf'


" ***************************
"  API bindings
" ***************************

function! LspShowDocumentation()
  call CocAction('doHover')
endfunction

function! LspGotoDefinition()
  call CocAction('jumpDefinition')
endfunction

function! LspShowReferences()
  call CocAction('jumpReferences')
endfunction

function! LspRename()
  call CocActionAsync('rename')
endfunction

function! LspCodeAction()
  execute 'CocAction'
endfunction

function! LspDisable()
  " call Unimplemented(expand('<sfile>'))
endfunction
