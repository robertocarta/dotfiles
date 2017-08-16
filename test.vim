let g:test_command='python -m'
 fun! Tests(A, L, P)
 	let s = 'grep '. "\'class \\(.*\\):\' ". expand('%:p') ." |sed \'s/class //\'| sed \'s/://\'|sed \'s/\\((.*)\\)//\'"
 	let funcs = systemlist(s)
 	return funcs
 endfun

" com! -nargs=1 -bang -complete= customlist, Test
"  			\ Testthis edit <bang> <args>
"
command! -nargs=1 Testhis :split|te python2 -m unittest tvsquared.tmp.rc.test_generateRawSpot.<f-args>

com! -nargs=1 -bang -complete=customlist,Tests
			\ Testt Testhis <bang> <args>



function! Lasttest()
	let i =0
	let countt=0
	let limit=50
	let commands = []
	while histget('cmd', i) !~ '^Tes' && countt <limit
		let i-=1
		let countt+=1
		let commands += [histget('cmd', i)] 
	endwhile
	if count <limit
		execute histget('cmd', i)
	else
		echo 'none'
	endif
endfun

nnoremap <C-t> :call Lasttest() <CR>

command! L :w |source % 


