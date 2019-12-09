if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set bs=2
set sw=2

set number relativenumber
set hidden
set cursorline

set fdm=manual

set nocompatible
filetype plugin on
syntax on

let mapleader=" "
let g:markdown_folding = 1
set runtimepath+=~/.vim/my-snippets/

set undofile

set clipboard=unnamed

set directory=$HOME/.vim/swp//
set undodir=$HOME/.vim/undodir

call plug#begin('~/.vim/plugged')
  Plug 'heavenshell/vim-pydocstring'

  Plug 'vim-perl/vim-perl', { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }
  Plug 'vim-airline/vim-airline'
  let g:airline_powerline_fonts = 1

  Plug 'Shougo/vimproc.vim', {'do' : 'make'}
  Plug 'Quramy/tsuquyomi'
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'

  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-unimpaired'
  Plug 'ap/vim-buftabline'
  Plug 'jiangmiao/auto-pairs'

  Plug 'plasticboy/vim-markdown'
  Plug 'chmp/mdnav'

  Plug 'racer-rust/vim-racer'
  let g:racer_experimental_completer = 1

  Plug 'scrooloose/nerdcommenter'
  let g:NERDCreateDefaultMappings = 0

  Plug 'deoplete-plugins/deoplete-jedi'
  Plug 'davidhalter/jedi-vim'
  let g:jedi#completions_enabled = 0
  let g:jedi#goto_stubs_command = ''

  Plug 'othree/yajs.vim'
  Plug 'mxw/vim-jsx'
  Plug 'mhartington/oceanic-next'

  Plug 'ervandew/supertab'

  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  let g:UltiSnipsExpandTrigger = "<Tab>"
  let g:UltiSnipsJumpForwardTrigger="<c-b>"
  let g:UltiSnipsJumpBackwardTrigger="<c-z>"
  let g:UltiSnipsEditSplit="vertical"

  Plug 'mattn/emmet-vim'

  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'

  Plug 'dense-analysis/ale'
  let g:ale_linters = {
			  \'javascript': ['eslint'],
			  \'typescript': ['tsserver', 'tslint'],
			  \'python': ['flake8', 'pylint']
			  \}
  let g:ale_fixers = {
			  \'javascript': ['prettier', 'eslint'],
			  \'typescript': ['prettier'],
			  \'python': ['autopep8', 'isort'],
			  \'rust': ['rustfmt']
			  \}
  let g:ale_rust_rls_config = {'rust': {'clippy_preference': 'on'}}
  let g:ale_virtualenv_dir_names = []
  let g:ale_fix_on_save = 1
  let g:ale_python_autopep8_options = "--max-line-length 120"

  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  let $FZF_DEFAULT_COMMAND = 'ag -g ""'

  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#sources#flow#flow_bin = 'flow'

  Plug 'mileszs/ack.vim'
  if executable('ag')
    let g:ackprg = 'ag --vimgrep'
  endif

call plug#end()

" Abbreviations
cabbr <expr> %% expand('%:p:h')

" <TAB>: completion.
let g:ulti_expand_or_jump_res = 0 "default value, just set once
function! Ulti_ExpandOrJump_and_getRes()
 call UltiSnips#ExpandSnippetOrJump()
 return g:ulti_expand_or_jump_res
endfunction

nnoremap <SPACE> <Nop>

" Enhanced Movement
 nnoremap H 10h
 nnoremap J 10j
 nnoremap K 10k
 nnoremap L 10l

" b -> Buffer commands
nnoremap <Leader>bd :b#<bar>bd#<CR>
nnoremap <Leader>bb :bn<CR>
nnoremap <Leader>bv :bp<CR>
nnoremap <Leader>bo :%bd<bar>e#<CR>
nnoremap <Leader>ba :%bd<CR>

" c -> Code/Comment commands
nmap <leader>cc <plug>NERDCommenterToggle
nnoremap <leader>cf zfa{
nmap <leader>ce <C-y>,

" k -> Split commands
nmap <leader>kb :NERDTreeToggle<CR>
nmap <leader>kv :vsp<CR>
nmap <leader>kn :sp<CR>

nnoremap <leader>kk <C-W><C-K>
nnoremap <leader>kj <C-W><C-J>
nnoremap <leader>kh <C-W><C-H>
nnoremap <leader>kl <C-W><C-L>

" w -> Wiki-like (Notes helpers)
nmap <Leader>ww :e ~/Projects/Planning/index.md<CR>

nnoremap <leader>s :w<CR>

" f -> File options
nnoremap <leader>ff :FZF!<cr>
nnoremap <leader>fs :Ack!<Space>

" v -> vim options
nmap <leader>vl :setlocal rnu!<cr>

" / -> Search options
nnoremap <leader>// /
nnoremap <leader>/. :noh<cr>

nmap <tab> <plug>SuperTabForward

" Autocommands
aug toggle_relative
  au! 
  au InsertEnter,WinLeave * :setlocal norelativenumber
  au InsertLeave,WinEnter * :setlocal relativenumber
aug END

