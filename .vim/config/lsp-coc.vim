" ***************************
"  Setup
" ***************************

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf'


" ***************************
"  API bindings
" ***************************

function! LspShowDocumentation()
  call CocActionAsync('doHover')
endfunction

function! LspGotoDefinition()
  call CocActionAsync('jumpDefinition')
endfunction

function! LspShowReferences()
  call CocActionAsync('jumpReferences')
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
