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

  Plug 'itchyny/lightline.vim'
    let g:lightline = {}
    let g:lightline.colorscheme = 'nord'
    let g:lightline.component_function =  {
          \ 'filetype': 'WebDevIconsGetFileTypeSymbol',
          \ 'fileformat': 'WebDevIconsGetFileFormatSymbol',
          \}

  Plug 'mengelbrecht/lightline-bufferline'
    let g:lightline.tabline          = {'left': [['buffers']], 'right': []}
    let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
    let g:lightline.component_type   = {'buffers': 'tabsel'}
    let g:lightline#bufferline#unicode_symbols = 1
    let g:lightline#bufferline#clickable = 1
    let g:lightline#bufferline#enable_devicons = 1

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

call plug#end()

