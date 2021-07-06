autocmd FileType agda    nnoremap <buffer> <F5> :!agda %<CR>
autocmd FileType c       nnoremap <buffer> <F5> :!gcc -std=gnu11   -w % -o /tmp/test && /tmp/test<CR>
autocmd FileType cpp     nnoremap <buffer> <F5> :!g++ -std=gnu++17 -w % -o /tmp/test && /tmp/test<CR>
autocmd FileType go      nnoremap <buffer> <F5> :!go run %<CR>
autocmd FileType haskell nnoremap <buffer> <F5> :!stack runhaskell %<CR>
autocmd FileType idris   nnoremap <buffer> <F5> :!idris % -o /tmp/test && /tmp/test<CR>
autocmd FileType python  nnoremap <buffer> <F5> :!python %<CR>
autocmd FileType rust    nnoremap <buffer> <F5> :!cargo eval %<CR>
autocmd FileType sh      nnoremap <buffer> <F5> :!bash %<CR>
autocmd FileType tla     nnoremap <buffer> <F5> :!pcal % 2>/dev/null; tlc %<CR>
autocmd FileType zig     nnoremap <buffer> <F5> :!zig run %<CR>
