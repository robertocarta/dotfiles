nnoremap  <C-D> :split<CR>:terminal python manage.py 
nnoremap  <C-D>t :split<CR>:terminal python manage.py test 
autocmd BufNewFile,BufRead *.jinja2 set syntax=htmldjango
