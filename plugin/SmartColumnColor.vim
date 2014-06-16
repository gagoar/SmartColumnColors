if exists('g:loaded_SmartColumnColor')
  finish
endif
let g:loaded_SmartColumnColor = 1

function! s:SmartColumnColor()
  if exists('b:disable_smartColumnColor') && b:disable_SmartColumnColor
    return
  endif

  let opts = {'guifg': 'White', 'guibg': 'Red' , 'column': 80}
  let before  = '\%'
  let after   = 'v.'

  if has_key(g:smart_display_opts, 'column')
    let opts.column = g:smart_display_opts.column
  endif

  if has_key(g:smart_display_opts, 'guifg')
    let opts.guifg = g:smart_display_opts.guifg
  endif

  if has_key(g:smart_display_opts, 'guibg')
    let opts.guibg = g:smart_display_opts.guibg
  endif

  let pattern = before . opts.column . after

  exe 'highlight smart_column guifg = '. opts.guifg . ' guibg= ' . opts.guibg

  let w:m1 = matchadd('smart_column', pattern, -1)

endfunction

autocmd BufWinEnter * SmartColumnColor

command SmartColumnColor :call <SID>SmartColumnColor()
