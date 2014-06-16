Smart Column Colors
=

This plugin alert us when we reach a defined amount of characters per line.

Install
-

if you are using [janus](https://github.com/carlhuda/janus), put it under ~/.janus like this:

``` bash
  git clone git@github.com:gagoar/SmartColumnColors.git
```

then all you need to do is restart your vim/mvim

Options
-

Custom column number? (on your .vimrc/.vimrc.after)
``` vim
  g:max_column = NN
```

Disabling
-

To disable it globally place the following in your `.vimrc`:
``` vim
  let g:loaded_SmartColumnColors = 1
```

To disable it for just the current buffer set the following anywhere it makes sense:
``` vim
  let b:disable_SmartColumnColors = 1
```

If you just wanted to do that temporarily you can execute in your vim:
``` vim
  set b:disable_SmartColumnColors = 0
```

or

``` vim
  unlet b:disable_SmartColumnColors` and it will start working again.
```
