let g:ale_linters = {
\   'javascript': ['eslint'],
\}

let g:ale_fixers = {
\   'javascript': ['eslint'],
\   '*': ['remove_trailing_lines'],
\}

let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

" Symbols
let g:ale_sign_error = '✕'
let g:ale_sign_warning = '✕'

" Options
let g:ale_list_vertical = 1
" let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
" let g:ale_completion_enabled = 1

" Keybindings
nnoremap \    :ALEDetail<CR>
nnoremap ]    :ALENext<CR>
nnoremap [    :ALEPrevious<CR>
nnoremap <CR> :ALEHover<CR>
