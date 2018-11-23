nnoremap  <C-d> :split<CR>:terminal python manage.py 
nnoremap  <C-d>t :split<CR>:terminal python manage.py test 
autocmd BufNewFile,BufRead *.jinja2 set syntax=htmldjango
