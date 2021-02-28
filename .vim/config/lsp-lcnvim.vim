" ***************************
"  Setup
" ***************************

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \     'do': 'bash install.sh'
    \ }
  let g:LanguageClient_loadSettings     = 1
  let g:LanguageClient_useFloatingHover = 1
  let g:LanguageClient_useVirtualText   = "No"
  let g:LanguageClient_serverCommands   =
      \ {
      \ 'c':       ['ccls', '--init={"cache": {"directory": "/tmp/ccls"}}'],
      \ 'cmake':   ['cmake-language-server'],
      \ 'cpp':     ['ccls', '--init={"cache": {"directory": "/tmp/ccls"}}'],
      \ 'haskell': ['haskell-language-server-wrapper', '--lsp'],
      \ 'java':    ['jdtls'],
      \ 'python':  ['pyls'],
      \ 'rust':    ['rust-analyzer'],
      \ 'sh':      ['bash-language-server', 'start'],
      \ 'tex':     ['texlab'],
      \ }
      " \ 'c': ['clangd', '-background-index'],

" Completion suggestions
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  let g:deoplete#enable_at_startup = 1
  " autocmd InsertLeave  * silent! pclose! " auto close preview
  " autocmd CompleteDone * silent! pclose! " auto close preview (for c-y)

" Signatures in status line
Plug 'Shougo/echodoc.vim'
  let g:echodoc#enable_at_startup = 1
  let g:echodoc#type = 'echo'

" Floating completion previews
Plug 'ncm2/float-preview.nvim'
  let g:float_preview#docked = 0
  set completeopt-=preview
  function! FloatingWindowSettings()
    if has('nvim')
      call nvim_win_set_option(g:float_preview#win, 'number', v:false)
      call nvim_win_set_option(g:float_preview#win, 'signcolumn', 'no')
    endif
  endfunction
  autocmd User FloatPreviewWinOpen call FloatingWindowSettings()


" ***************************
"  API bindings
" ***************************

function! LspShowDocumentation()
  call LanguageClient#textDocument_hover()
endfunction

function! LspGotoDefinition()
  call LanguageClient#textDocument_definition()
endfunction

function! LspShowReferences()
  call LanguageClient#textDocument_references()
endfunction

function! LspRename()
  call LanguageClient#textDocument_rename()
endfunction

function! LspCodeAction()
  call LanguageClient#textDocument_codeAction()
endfunction

function! LspDisable()
  let g:LanguageClient_serverCommands = {}
endfunction
