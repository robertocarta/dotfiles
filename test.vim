let g:test_command='python -m'
 fun! Tests(A, L, P)
 	let s = 'grep '. "\'class \\(.*\\):\' ". expand('%:p') ." |sed \'s/class //\'| sed \'s/://\'|sed \'s/\\((.*)\\)//\'"
 	let funcs = systemlist(s)
 	return funcs
 endfun

" com! -nargs=1 -bang -complete= customlist, Test
"  			\ Testthis edit <bang> <args>
"
command! Testt :vs|te <args>

com! -nargs=1 -bang -complete=customlist,Tests
			\ Hey Testt <bang> <args>

