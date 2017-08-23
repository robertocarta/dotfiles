let g:test_command='python -m'
 fun! Tests(A, L, P)
 	let s = 'grep '. "\'class \\(.*\\):\' ". expand('%:p') ." |sed \'s/class //\'| sed \'s/://\'|sed \'s/\\((.*)\\)//\'"
 	let funcs = systemlist(s)
 	return funcs
 endfun

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


let s:path = resolve(expand('<sfile>:p'))
function! CloseTests()
    pyfile ~/dotfiles/closetests.py
endfunc

command! -nargs=1 Testhis :call Run(<f-args>)

com! -nargs=1 -bang -complete=customlist,Tests
			\ Testt Testhis <bang> <args>

function! Run(testname)
	let n = winnr()
	call CloseTests()
	split
	let l:com = 'python2 -m unittest tvsquared.tmp.rc.test_generateRawSpot'.a:testname
	execute 'te' l:com
	file testtt
	execute n."wincmd w"
	stopinsert 
endfunction

nnoremap <S-T> :bdelete! testtt  <CR>
	


