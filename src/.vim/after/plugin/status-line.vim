let g:lightline = {}

let g:lightline.colorscheme = 'nord'

" let g:lightline.separator = {
"       \ 'left': '', 'right': ''
"       \}

" let g:lightline.subseparator = {
"       \ 'left': '', 'right': ''
"       \}

let g:lightline.component_function =  {
      \ 'filename': 'LightlineFilename',
      \ 'filetype': 'WebDevIconsGetFileTypeSymbol',
      \ 'mode': 'LightlineMode',
      \ 'readonly': 'LightlineReadonly',
      \ 'fileencoding': 'LightlineFileEncoding',
      \ 'fileformat': 'LightlineFileFormat',
      \}

let g:lightline.component_expand = {
      \ 'buffers': 'lightline#bufferline#buffers',
      \ 'linter_checking': 'lightline#ale#checking',
      \ 'linter_infos': 'lightline#ale#infos',
      \ 'linter_warnings': 'lightline#ale#warnings',
      \ 'linter_errors': 'lightline#ale#errors',
      \ 'linter_ok': 'lightline#ale#ok',
      \}

let g:lightline.component_type = {
      \ 'buffers': 'tabsel',
      \ 'linter_checking': 'right',
      \ 'linter_infos': 'right',
      \ 'linter_warnings': 'warning',
      \ 'linter_errors': 'error',
      \ 'linter_ok': 'right',
      \}

" Component arrangement
let g:lightline.tabline = {
      \ 'left': [['buffers']],
      \ 'right': []
      \}

let g:lightline.active = {
      \ 'left': [
      \   [ 'mode', 'paste' ],
      \   [ 'filename', 'readonly', 'modified' ]
      \ ],
      \ 'right': [
      \   [ 'fileformat', 'fileencoding', 'filetype' ],
      \   [ 'linter_errors', 'linter_warnings' ]
      \ ]
      \}

let g:lightline.inactive = {
      \ 'left': [
      \   [ 'paste' ],
      \   [ 'filename', 'readonly', 'modified' ]
      \ ],
      \ 'right': [
      \   [ 'fileformat', 'filetype' ]
      \ ]
      \}


" Bufferline
let g:lightline#bufferline#unicode_symbols = 1
let g:lightline#bufferline#clickable = 1
let g:lightline#bufferline#enable_devicons = 1
" required for clickable to work
" let g:lightline.component_raw = {'buffers': 1}

" ALE indicators
let g:lightline#ale#indicator_checking = "\uf110 "
let g:lightline#ale#indicator_infos = "\uf129 "
let g:lightline#ale#indicator_warnings = "\uf071 "
let g:lightline#ale#indicator_errors = "\uf05e "
let g:lightline#ale#indicator_ok = "\uf00c "

" helpers
let s:plugin_files = [
      \  '__vista__'
      \]

function IsSpecial()
 return index(s:plugin_files, expand('%:t')) != -1
endfunction

" component functions
function! LightlineMode() abort
  if IsSpecial()
    return ''
  endif

  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! LightlineFilename() abort
  if IsSpecial()
    return ''
  endif

  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

function! LightlineReadonly() abort
  if IsSpecial()
    return ''
  endif

  return &readonly ? '' : ''
endfunction

" Display the file encoding only if it differs from the expected default (utf-8)
function! LightlineFileEncoding() abort
  let l:encoding = strlen(&fileencoding) ? &fileencoding : &encoding
  return l:encoding !=? 'utf-8' ? l:encoding : ''
endfunction

" Display the file format only if it differs from the expected default (unix)
function! LightlineFileFormat() abort
  return &fileformat !=? 'unix' ? &fileformat : ''
endfunction
