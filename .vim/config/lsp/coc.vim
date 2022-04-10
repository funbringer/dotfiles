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
  execute 'CocAction'
endfunction

function! LspListSymbols()
  execute 'CocFzfList symbols'
endfunction

function! LspDisable()
  " call Unimplemented(expand('<sfile>'))
endfunction

let g:coc_default_semantic_highlight_groups = 1
