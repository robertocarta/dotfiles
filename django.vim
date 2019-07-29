" nnoremap  <C-S-D> :split<CR>:terminal python manage.py 
" nnoremap  <C-S-D>t :split<CR>:terminal python manage.py test 
autocmd BufNewFile,BufRead *.jinja2 set syntax=htmldjango
