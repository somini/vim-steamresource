autocmd BufNewFile,BufRead *.res,*.style,*.layout call <SID>FTSteamResource()

function! s:FTSteamResource()
	let l:folders = [expand('%:p:h:t'), expand('%:p:h:h:t'),expand('%:p:h:h:h:t')]
	if index(l:folders,'resource',1) >= 0 ||
				\ index(l:folders, 'layout', 1) >= 0 ||
				\ index(l:folders, 'styles', 1) >= 0
		set filetype=steamresource
	endif
endfunction

" vim: set ts=2 sw=2 noet
