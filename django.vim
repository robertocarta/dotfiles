
nnoremap  <C-d> :split<CR>:terminal python mgmt/manage.py test
nnoremap  <C-d>t :split<CR>:terminal python mgmt/manage.py test 
autocmd BufNewFile,BufRead *.jinja2 set syntax=htmldjango
