" Encoding settings
set encoding=utf-8

" Sane indentation defaults
set expandtab
set shiftwidth=4
set smartindent
set softtabstop=4
set tabstop=4

" Magics
set hidden
set lazyredraw
set nofoldenable

" Visible features
set cursorline
set guifont=Source\ Code\ Pro:h28
set linebreak
set list
set listchars=tab:→\ ,nbsp:·,trail:·
set mouse=a
set noshowmode
set number
set signcolumn=yes
syntax enable

" Clipboard
set clipboard+=unnamed,unnamedplus

" Search
set hlsearch
set incsearch
nnoremap * *``

" File changes, swap etc
set autoread
set updatetime=250
autocmd CursorHold * silent! checktime

" Spelling
autocmd FileType gitcommit,text
  \ setlocal spell spelllang=ru_ru,en_us

" Replace default leader key '\'
let mapleader = ","
let maplocalleader = ","

" Work around problems with VIRTUALENV
let g:python3_host_prog = '/usr/bin/python3'

" Markdown
let g:markdown_fenced_languages =
  \ [
  \ 'bash=sh',
  \ 'c',
  \ 'cpp',
  \ 'haskell',
  \ 'java',
  \ 'python',
  \ 'rust',
  \ ]

" Add custom helper functions
runtime config/helpers.vim

" Quick run
runtime config/quickrun.vim

" Plugins
runtime config/install-plug.vim
runtime config/load-plugins.vim

" Color scheme
if !exists('g:vscode')
  colorscheme codedark
  if has("termguicolors")
    set termguicolors
  endif
endif

" Per project .vimrc
set exrc
set secure
