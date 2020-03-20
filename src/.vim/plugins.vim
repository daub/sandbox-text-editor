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

call plug#end()

