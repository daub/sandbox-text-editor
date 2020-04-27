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

  Plug 'michaeljsmith/vim-indent-object'
  Plug 'jiangmiao/auto-pairs'
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}

  Plug 'editorconfig/editorconfig-vim'
    " ensure works well with `tpope/vim-fugitive`
    let g:EditorConfig_exclude_patterns = ['fugitive://.*']

  " Colors
  Plug 'arcticicestudio/nord-vim'

  " UI layout

  " Default start screen
  Plug 'mhinz/vim-startify'

  " Status line
  Plug 'itchyny/lightline.vim'
  Plug 'mengelbrecht/lightline-bufferline'
  Plug 'maximbaz/lightline-ale'

  " Zen mode

  Plug 'junegunn/limelight.vim'
  Plug 'junegunn/goyo.vim'

  " load this last
  Plug 'ryanoasis/vim-devicons'

  " Navigation

  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'

  Plug 'christoomey/vim-tmux-navigator'

  " IDE features

  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'dense-analysis/ale'

  " Syntax

  Plug 'rust-lang/rust.vim'
    let g:rustfmt_autosave = 1

  Plug 'pangloss/vim-javascript'
    " Enables syntax highlighting for JSDocs.
    let g:javascript_plugin_jsdoc = 1

  Plug 'posva/vim-vue'
    " Only highlight HTML, JavaScript, and CSS
    " No Pug, SCSS, etc.
    let g:vue_pre_processors = []

  Plug 'mattn/emmet-vim'
    " Trigger with `,,`
    let g:user_emmet_leader_key=','

  Plug 'kylef/apiblueprint.vim'

  Plug 'dart-lang/dart-vim-plugin'
   " let g:dart_style_guide = 2
   " let g:dart_format_on_save = 1

  " Snippets

  " Engine
  Plug 'SirVer/ultisnips'
    let g:UltiSnipsSnippetDirectories = ["UltiSnips", "snips"]

call plug#end()
