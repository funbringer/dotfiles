" *****************************************
if !exists('g:vscode') " for vscode + nvim
" *****************************************



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

" Add custom helper functions
runtime config/helpers.vim

" Plugins
runtime config/install-plug.vim
let plugin_dir = $HOME . '/.vim/plugins/'
call plug#begin(plugin_dir)
  " Keymap
  set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
  Plug 'lyokha/vim-xkbswitch'
  if executable('xkb-switch')
    let g:XkbSwitchEnabled = 1
  endif

  " Themes
  Plug 'tomasiser/vim-code-dark'
  Plug 'tomasr/molokai'

  " Look & feel (interface)
  Plug 'RRethy/vim-illuminate'
  Plug 'camspiers/lens.vim'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'ryanoasis/vim-devicons'

  " FZF
  Plug 'zackhsi/fzf-tags'
  Plug 'junegunn/fzf.vim'
    let g:fzf_history_dir = '~/.fzf_history'
    let g:fzf_colors =
      \ {
      \ 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment']
      \ }
    nnoremap <silent> fzf  :FZF<CR>
    nnoremap <silent> fzt  :Tags<CR>
    nnoremap <silent> fzb  :BTags<CR>
    nnoremap <silent> fzc  :Commits<CR>
    nnoremap <silent> ;    :Buffers<CR>

    nmap <C-]> <Plug>(fzf_tags)

  Plug 'dstein64/vim-startuptime'

  " Fancy file manager
  Plug 'scrooloose/nerdtree'
    noremap <silent> \    :NERDTreeToggle<CR>
    noremap <silent> <F2> :NERDTreeFind<CR> <c-w><c-p>

  " Fancy status bar
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
    set laststatus=2
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#hunks#enabled = 0
    let g:airline#extensions#whitespace#checks = ['trailing']

  " Language support
  Plug 'ahf/cocci-syntax'
  Plug 'arrufat/vala.vim'
  Plug 'cespare/vim-toml'
  Plug 'derekelkins/agda-vim'
  Plug 'florentc/vim-tla'
  Plug 'idris-hackers/idris-vim'
  Plug 'lervag/vimtex'
  Plug 'mmarchini/bpftrace.vim'
  Plug 'runoshun/vim-alloy'
  Plug 'rust-lang/rust.vim'
  Plug 'vmchale/dhall-vim'

  Plug 'neovimhaskell/haskell-vim'
    let g:haskell_enable_pattern_synonyms = 1
    let g:haskell_enable_quantification   = 1
    let g:haskell_indent_after_bare_where = 2
    let g:haskell_indent_before_where     = 2

  Plug 'octol/vim-cpp-enhanced-highlight'
    let g:cpp_member_variable_highlight = 1

  " Git
  Plug 'APZelos/blamer.nvim'
  Plug 'airblade/vim-gitgutter'
  Plug 'rhysd/git-messenger.vim'
  Plug 'tpope/vim-fugitive'

  " Preview
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

  " Formatting
  Plug 'godlygeek/tabular'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-sleuth'
  Plug 'tpope/vim-surround'

  " Abbreviations
  Plug 'arthurxavierx/vim-unicoder'
    let g:unicoder_command_abbreviations = 1
    let g:unicoder_exclude_filetypes = ['tex', 'latex', 'plaintex']

  " LSP
  runtime config/lsp.vim
call plug#end()

" NOTE: unfortunately, this won't work inside the plug block
if isdirectory(plugin_dir . 'vim-airline') " *sigh*
  let g:airline_section_z =
    \ airline#section#create(['linenr', 'maxlinenr', ':%3c'])
endif

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

" Color scheme
colorscheme codedark
if has("termguicolors")
  set termguicolors
endif

" Quick run
runtime config/quickrun.vim

" Per project .vimrc
set exrc
set secure



" *****************************************
endif " for vscode + nvim
" *****************************************
