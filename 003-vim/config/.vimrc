" Show line numbers.
set number

" Ignore case unless the search pattern contains uppercase letters.
set ignorecase
set smartcase

" Show matches while typing the search pattern.
set incsearch

" Highlight all matches; clear with :nohlsearch.
set hlsearch

" Enable filetype detection, filetype plugins, and filetype-based indentation.
filetype plugin indent on

" Use four spaces for indentation instead of tab characters.
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smartindent

" Enable syntax highlighting in these Markdown fenced code blocks.
let g:markdown_fenced_languages = ['bash=sh', 'php', 'js=javascript', 'ts=typescript', 'elixir', 'sql', 'json', 'yaml']

" Manage plugins with vim-plug; run :PlugInstall after adding plugins.
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'          " Tree navigation
Plug 'ctrlpvim/ctrlp.vim'          " Fuzzy finder
Plug 'ervandew/supertab'           " Autocomplete
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy Finder++
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'       " Status bar
Plug 'yegappan/lsp'                " LSP client for Vim 9
Plug 'elixir-editors/vim-elixir'   " Elixir syntax highlighting
Plug 'wellle/context.vim'          " Display context (object, method)

call plug#end()
