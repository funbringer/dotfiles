" Provide default functions
runtime config/lsp/default.vim

" Choose LSP engine
" runtime config/lsp/lcnvim.vim
runtime config/lsp/coc.vim

function s:SetKeyMappings()
  nnoremap <buffer> <silent> K  :call LspShowDocumentation()<CR>

  nnoremap <buffer> <silent> gd :call LspGotoDefinition()<CR>
  nnoremap <buffer> <silent> gl :call LspListSymbols()<CR>
  nnoremap <buffer> <silent> gr :call LspShowReferences()<CR>
  nnoremap <buffer> <silent> gt :call LspGotoTypeDefinition()<CR>

  nnoremap <buffer> <silent> tr :call LspRename()<CR>
  noremap  <buffer> <silent> ta :call LspCodeAction()<CR>
endfunction

autocmd FileType * call s:SetKeyMappings()
