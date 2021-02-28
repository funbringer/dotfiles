" Provide default functions
runtime config/lsp-dummy.vim

" Choose LSP engine
" runtime config/lsp-lcnvim.vim
runtime config/lsp-coc.vim

function! s:lspGetDocs()
  try
    call LspShowDocumentation()
    return 1
  catch /.*/
    return 0
  endtry
endfunction

function __LspShowDocumentation()
  let types = ['vim', 'help', 'man']
  let special = index(types, &filetype) >= 0

  if special || !s:lspGetDocs()
    try
      let prefix = (&keywordprg == ':help') ? '' : '!'
      execute prefix . &keywordprg . ' ' . expand('<cword>')
    catch /.*/
      call EchoError('No docs found for ' . expand('<cword>'))
    endtry
  endif
endfunction

function s:SetKeyMappings()
  nnoremap <buffer> <silent> K  :call __LspShowDocumentation()<CR>

  nnoremap <buffer> <silent> gd :call LspGotoDefinition()<CR>
  nnoremap <buffer> <silent> gr :call LspShowReferences()<CR>

  nnoremap <buffer> <silent> tr :call LspRename()<CR>
  noremap  <buffer> <silent> ta :call LspCodeAction()<CR>
endfunction

autocmd FileType * call s:SetKeyMappings()
