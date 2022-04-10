let plugin_dir = $HOME . '/.vim/plugins/'
call plug#begin(plugin_dir)
  " Keymap
  set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
  Plug 'lyokha/vim-xkbswitch'
  if executable('xkb-switch')
    let g:XkbSwitchEnabled = 1
  endif

  if !exists('g:vscode') " for vscode + nvim
    " Themes
    Plug 'tomasiser/vim-code-dark'
    Plug 'tomasr/molokai'

    " Look & feel (interface)
    Plug 'camspiers/lens.vim'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'ryanoasis/vim-devicons'

    " Fuzzy Finder Menu
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
      nnoremap <silent> fzf   :FZF<CR>
      nnoremap <silent> fzt   :Tags<CR>
      nnoremap <silent> fzb   :BTags<CR>
      nnoremap <silent> fzc   :Commits<CR>
      nnoremap <silent> ;     :Buffers<CR>
      nmap              <C-]> <Plug>(fzf_tags)

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

    " Treesitter for syntax highlighting
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    " Copilot
    Plug 'github/copilot.vim'
      " let g:copilot_filetypes = {
      "   \ '*': v:true,
      "   \ }

    " Language support
    Plug 'ahf/cocci-syntax'
    Plug 'derekelkins/agda-vim'
    Plug 'idris-hackers/idris-vim'
    Plug 'lervag/vimtex'
    Plug 'mmarchini/bpftrace.vim'
    Plug 'runoshun/vim-alloy'
    Plug 'rust-lang/rust.vim'
    Plug 'vmchale/dhall-vim'

    Plug 'florentc/vim-tla'
      " TODO: do we still need this?
      function! s:TlaSetup()
        set conceallevel=2

        function! s:Prefixed(default, rep)
          if getline('.')[col('.')-2]=='\'
            return "\<bs>".a:rep
          else
            return a:default
          endif
        endfunction

        inoreab and <c-r>=<sid>Prefixed('and', '/\')<cr>
        inoreab or  <c-r>=<sid>Prefixed('or',  '\/')<cr>
      endfunction
      autocmd FileType tla call s:TlaSetup()

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

    " Formatting (vim only)
    Plug 'jiangmiao/auto-pairs'

    " Abbreviations
    Plug 'arthurxavierx/vim-unicoder'
      let g:unicoder_command_abbreviations = 0
      let g:unicoder_exclude_filetypes =
        \ ['vim', 'tla', 'tex', 'latex', 'plaintex']

    " Language Server Protocol
    runtime config/lsp.vim
  endif " g:vscode

  " Formatting (common)
  Plug 'godlygeek/tabular'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-sleuth'
  Plug 'tpope/vim-surround'
call plug#end()


if !exists('g:vscode')
  " NOTE: unfortunately, this won't work inside the plug block
  if isdirectory(plugin_dir . 'vim-airline') " *sigh*
    let g:airline_section_z =
      \ airline#section#create(['linenr', 'maxlinenr', ':%3c'])
  endif
endif
