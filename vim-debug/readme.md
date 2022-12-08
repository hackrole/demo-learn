# how to debug vim config

## about vim startup

```vimscript
:h startup
```

sourced scriptgs
```vimscript
scriptnames
```

### load order

`after` directory
`plugin` directory
`ftpplugin` directory

check before

```vimscript
if !exists(":FZF")
  finish
fi
map <silent> <C-space> :Files<CR>
map <silent> <leader>t :Tags<CR>
map <silent> <leader>m :Marks<CR>
let g:fzf_layout = {"down": "~20%"}
```

## debug vim startup slow

```bash
vim --startuptime <fname>
```

```vimscript
:h profile
```

```vismcript
:verbose
```

## what option/mapping/command come from

```vimscript
:verbose set shiftwidth?
:verbose map <C-a>
:verbose abbreviate teh
:verbose highlight Visual
```

### maps list app mapping with this prefix

```vimscript
verbose imap <leader>
```

### scriptease.vim

plugin help to debug vimscript

## run vim with noplugin

-u NONE
-u NORC
--noplugin
-u <other-vimrc>
-u <other-vimrc> --noplugin

## hard debug with half-search

work with :finish and comment code

# config vim module way

## using :source to split file

:runtime
'runtimepath'

## vim variable scope

:help script-variable

## Short-circuiting and load guards
```vimscript
if &compatible || exists('g:loaded_myplugin') || v:version < 700 || !has('folding')
  finish
endif
let g:loaded_myplugin = 1
```

## about mapping

<Plug> prefix

```vimscript
nnoremap <Plug>command :<C-u>call <SID>somefunc()<CR>
# user define
nmap <Leader>x <Plug>command
```

## use group and autocmd and `buffer-local`

augroup ftmail
  autocmd!
  autocmd FileType mail setlocal spell
augroup END

## undo filetype settings

```vimscript
setlocal speel
let b:undo_ftplugin .= "|setlocal speel<"

-- see the undo var
let b:undo_ftplugin
```

## .vim/indent/ for 'autoinden' or 'indentexpr' ..

## ftdetect directory

```vimscript
autocmd BufNewFile,BufRead */irc/*.log setfiletype irssilog
```
