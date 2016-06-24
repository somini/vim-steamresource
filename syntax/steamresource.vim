if exists("b:current_syntax")
	finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn match srComment "//.*$" contains=@Spell
syn keyword srCommentCommand include contained containedin=srComment

syn region srString start=+"+  skip=+\\\\\|\\"+  end=+"+ contains=srOperator,srNumber,srCoordinate
syn match srNumber "\-\?\<\d\+\>"
syn match srCoordinate "\<[xy]\d\+\>"

syn match srOption "^\s*\"\?\zs\(\w\|[-_]\)\+\ze\"\?\s*\(=\|\"\|{.*}\?\|\n\s*{\)"

syn match srOperator ",\|(\|)\|=\|{\|}"

syn match srMarkOSX    "\[\$OSX\]"
syn match srMarkNotOSX "\[\!\$OSX\]"

"{{{ HiLink
if version < 508
	let did_json_syn_inits = 1
	command -nargs=+ HiLink hi link <args>
else
	command -nargs=+ HiLink hi def link <args>
endif
"}}}

HiLink  srComment         Comment
HiLink  srCommentCommand  SpecialComment
HiLink  srString          String
HiLink  srNumber          Number
HiLink  srCoordinate      Type
HiLink  srOperator        Operator
HiLink  srCommand         Identifier
HiLink  srOption          Identifier
HiLink  srMarkOSX         Include
HiLink  srMarkNotOSX      Typedef

"{{{ HiLink
delcommand HiLink
"}}}

let b:current_syntax = 'steamresource'

let &cpo = s:cpo_save
unlet s:cpo_save
" vim: ts=2 sw=2 noet fdm=marker
