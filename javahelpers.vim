source ~/dotfiles/cstyle.vim
nnoremap ) ]m
nnoremap ( [m


nnoremap <leader>; m9A;<esc>`9

nnoremap <leader>ee :!javac-algs4 % && java-algs4 $(python -c "print('%'.split('.')[0])")<cr>

nnoremap <leader>ea :!javac-algs4 % && java-algs4 -ea $(python -c "print('%'.split('.')[0])")<cr>

nnoremap <leader>e :!javac-algs4 % && java-algs4 -ea $(python -c "print('%'.split('.')[0])") 

inoremap printj System.out.print
inoremap printf System.out.printf
abbr forl for (int i = 0; i < ; i++) {<esc>7hi
nnoremap <leader>m /public static void main<cr><esc>

" back to code after forloop
nnoremap <leader>[ f{a<cr><esc>O 

" main boilerplate
iabbr mainj public static void main(String[] args) {}
