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
	while histget('cmd', i) !~ '^Tes' || countt <3
		let i-=1
		let countt+=1
	endwhile
	if count <50
		echo histget('cmd', i)
		execute histget('cmd', i)
		echo histget('cmd', i)
	else
		echo 'none'
	endif
endfun

nnoremap <C-t> :call Lasttest() <CR>


