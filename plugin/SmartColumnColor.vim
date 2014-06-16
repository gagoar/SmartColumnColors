if exists('g:loaded_SmartColumnColor')
  finish
endif
let g:loaded_SmartColumnColor = 1

function! s:SmartColumnColor()
  if exists('b:disable_smartColumnColor') && b:disable_SmartColumnColor
    return
  endif

  hi ColorColumn guibg=#2d2d2d ctermbg=246
  let before  = '\%'
  let after   = 'v'
  let default_max_columns = 81

  if exists('g:max_column')
    let default_max_columns = g:max_column
  endif

  let pattern = before . default_max_columns . after
  let w:m1 = matchadd('Search', pattern, -1)
endfunction

autocmd BufWinEnter * SmartColumnColor

command SmartColumnColor :call <SID>SmartColumnColor()
