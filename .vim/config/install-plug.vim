let s:vim_plug_url =
  \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

let s:vim_plug_path = $HOME . '/.vim/autoload/plug.vim'

if !filereadable(s:vim_plug_path)
  echo 'Installing vim-plug'

  call system(
    \ 'curl -fLo '
    \ . ' ' . s:vim_plug_path
    \ . ' --create-dirs'
    \ . ' ' . s:vim_plug_url
    \ )

  runtime autoload/plug.vim
endif
