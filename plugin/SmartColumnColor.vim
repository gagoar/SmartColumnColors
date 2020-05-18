if exists('g:loaded_SmartColumnColor')
  finish
endif
let g:loaded_SmartColumnColor = 1

function! s:SmartColumnColor()
  if exists('b:disable_smartColumnColor') && b:disable_SmartColumnColor
    return
  endif

  let opts = {'guifg': 'White', 'guibg': 'Red' , 'column': 80}
  let before = '\%'
  let after = 'v.'

  if exists('g:smart_display_opts')
    if has_key(g:smart_display_opts, 'column')
      let opts.column = g:smart_display_opts.column
    endif

    if has_key(g:smart_display_opts, 'guifg')
      let opts.guifg = g:smart_display_opts.guifg
    endif

    if has_key(g:smart_display_opts, 'guibg')
      let opts.guibg = g:smart_display_opts.guibg
    endif
  endif

  exe 'highlight smart_column guifg='. opts.guifg .' guibg='. opts.guibg .' ctermfg='. opts.guifg .' ctermbg='. opts.guibg

  let pattern = before . opts.column . after

  let w:m1 = matchadd('smart_column', pattern, -1)

  if (exists('b:enable_alternative_smart_column') && b:enable_alternative_smart_column) ||
    \ exists('g:smart_display_alternative_opts')

    let alt_opts = {'guifg': 'White', 'guibg': 'Red' , 'column': 120}

    if exists('g:smart_display_alternative_opts')
      if has_key(g:smart_display_alternative_opts, 'column')
        let alt_opts.column = g:smart_display_alternative_opts.column
      endif

      if has_key(g:smart_display_alternative_opts, 'guifg')
        let alt_opts.guifg = g:smart_display_alternative_opts.guifg
      endif

      if has_key(g:smart_display_alternative_opts, 'guibg')
        let alt_opts.guibg = g:smart_display_alternative_opts.guibg
      endif
    endif

    exe 'highlight smart_column_alt guifg='. alt_opts.guifg .' guibg='. alt_opts.guibg .' ctermfg='. alt_opts.guifg .' ctermbg='. alt_opts.guibg

    let alt_pattern = before . alt_opts.column . after

    let w:m2 = matchadd('smart_column_alt', alt_pattern, -1)
  endif
endfunction

autocmd BufWinEnter * SmartColumnColor

command SmartColumnColor :call <SID>SmartColumnColor()
