# syntastic-local-solhint.vim

Prefer local repo install of solhint over global install with syntastic

Installation Instructions
-------------------------

Using [vim plugged](https://github.com/junegunn/vim-plug) you just need to add:

```
Plug 'sohkai/syntastic-local-solhint.vim'
```

Inspired By
-----------

Completely ripped off of [syntastic-local-solium](https://github.com/sohkai/syntastic-local-solium.vim),
which was a complete rip-off of [mtscout6's awesome syntastic-local-eslint](https://github.com/mtscout6/syntastic-local-eslint.vim/blob/master/ftplugin/javascript.vim),
who was inspired by [pixelastic's blog post](http://blog.pixelastic.com/2015/10/05/use-local-eslint-in-syntastic/).
Total, unapologetic `%s/solium/solhint/g`, for greater good.

I imagine in the future we could create some generic `syntastic-local-npm-loader` plugin for
syntastic where options could be used to flag should be loaded locally, but that's for another day.
Maybe if enough linters start publishing via npm.

-----------------

Turns out I can't fork [syntastic-local-eslint](https://github.com/mtscout6/syntastic-local-eslint.vim/blob/master/ftplugin/javascript.vim)
more than once, so this unfortunately has a clean state.
