" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'ctags'

" Set the executive for some filetypes explicitly. Use the explicit executive
" instead of the default one for these filetypes when using `:Vista` without
" specifying the executive.
let g:vista_executive_for = {
  \ 'dart': 'coc',
  \ 'rs': 'coc'
  \ }


" UI

let g:vista_disable_statusline = 1
let g:vista_sidebar_width = 40

" Ensure you have installed some decent font to show these pretty symbols, then
" you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" TODO: needs more attention
let g:vista#renderer#icons = {
      \ 'field': '',
      \ 'fields': '',
      \ 'enumerator': 'הּ',
      \ 'enum': 'הּ',
      \}

" let g:vista#renderer#icons = {
"      \ 'functions': '',
"      \ 'function': '',
"      \ 'func': '',
"      \ 'namespace': '',
"      \ 'class': '',
"      \ 'map': 'פּ',
"      \ 'method': '',
"      \ 'const': '',
"      \ 'variables': '',
"      \ 'var': '',
"      \ 'property': '襁',
"      \ 'subroutine': '羚',
"      \ 'interface': '',
"      \ 'implementation': '',
"      \ 'enumerator': '',
"      \ 'enum': '',
"      \ 'types': '',
"      \ 'type': '',
"      \ 'typedef': '',
"      \ 'packages': '',
"      \ 'default': '',
"      \ 'augroup': 'פּ',
"      \ 'macro': '',
"      \ 'macros': '',
"      \ 'target': '',
"      \ 'variable': '',
"      \ 'modules': '',
"      \ 'constant': '',
"      \ 'struct': '',
"      \ 'module': '',
"      \ 'typeParameter': '',
"      \ 'package': '',
"      \ 'member': '',
"      \ 'union': '鬒'
"      \}
