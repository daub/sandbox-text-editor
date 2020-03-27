set runtimepath+=~/.vim/

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync
endif

call plug#begin($HOME . "/.vim/plugged")
  " Enhancements
  Plug 'tpope/vim-fugitive'

  " Editing
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-speeddating'
  Plug 'tpope/vim-surround'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'jiangmiao/auto-pairs'

  " Colors
  Plug 'arcticicestudio/nord-vim'

  " UI layout

  " Status line
  Plug 'itchyny/lightline.vim'
  Plug 'mengelbrecht/lightline-bufferline'
  Plug 'maximbaz/lightline-ale'

  " Zen mode

  Plug 'junegunn/limelight.vim'
    let g:limelight_paragraph_span = 1
    let g:limelight_conceal_ctermfg = 'gray'
    let g:limelight_conceal_guifg = '#434C5E'

  Plug 'junegunn/goyo.vim'
    function! s:goyo_enter()
      if executable('tmux') && strlen($TMUX)
        silent !tmux set status off
        silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
      endif
      set noshowmode
      set noshowcmd
      set showtabline=0
      set scrolloff=999
      Limelight
      " ...
    endfunction

    function! s:goyo_leave()
      if executable('tmux') && strlen($TMUX)
        silent !tmux set status on
        silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
      endif
      set showmode
      set showcmd
      set showtabline=2
      set scrolloff=5
      Limelight!
      " ...
    endfunction

    autocmd! User GoyoEnter nested call <SID>goyo_enter()
    autocmd! User GoyoLeave nested call <SID>goyo_leave()

    nnoremap <Leader>z :Goyo<CR>

  " load this last
  Plug 'ryanoasis/vim-devicons'

  " Navigation

  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
    " Insert mode completion
    imap <c-x><c-k> <plug>(fzf-complete-word)
    imap <c-x><c-f> <plug>(fzf-complete-path)
    imap <c-x><c-j> <plug>(fzf-complete-file-ag)
    imap <c-x><c-l> <plug>(fzf-complete-line)

    " Advanced customization using autoload functions
    inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

    function! s:fzf_statusline()
      " Override statusline as you like
      " highlight fzf1 ctermfg=161 ctermbg=251
      " highlight fzf2 ctermfg=23 ctermbg=251
      " highlight fzf3 ctermfg=237 ctermbg=251
      setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
    endfunction

    autocmd! User FzfStatusLine call <SID>fzf_statusline()

    nnoremap <Leader>n :GFiles<CR>
    nnoremap <Leader>b :Buffers<CR>

  Plug 'christoomey/vim-tmux-navigator'

  " IDE features

  Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Use tab for trigger completion with characters ahead and navigate.
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
    " position. Coc only does snippet and additional edit on confirm.
    if has('patch8.1.1068')
      " Use `complete_info` if your (Neo)Vim version supports it.
      inoremap <expr> <c-space> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
    else
      imap <expr> <c-space> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    endif

    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Navigate snippet placeholders using tab
    let g:coc_snippet_next = '<Tab>'
    let g:coc_snippet_prev = '<S-Tab>'


  Plug 'dense-analysis/ale'
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


  " Syntax

  Plug 'rust-lang/rust.vim'
    let g:rustfmt_autosave = 1

  Plug 'pangloss/vim-javascript'
    " Enables syntax highlighting for JSDocs.
    let g:javascript_plugin_jsdoc = 1

  " Snippets

  " Engine
  Plug 'SirVer/ultisnips'
    let g:UltiSnipsSnippetDirectories = ["UltiSnips", "snips"]

call plug#end()
