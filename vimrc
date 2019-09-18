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

set directory=$HOME/.vim/swp//
set undodir=$HOME/.vim/undodir

call plug#begin('~/.vim/plugged')

  Plug 'Shougo/vimproc.vim', {'do' : 'make'}
  Plug 'Quramy/tsuquyomi'

  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-unimpaired'
  Plug 'ap/vim-buftabline'
  Plug 'jiangmiao/auto-pairs'

  Plug 'plasticboy/vim-markdown'
  Plug 'chmp/mdnav'

  Plug 'scrooloose/nerdcommenter'
  let g:NERDCreateDefaultMappings = 0

  Plug 'othree/yajs.vim'
  Plug 'mxw/vim-jsx'
  Plug 'mhartington/oceanic-next'

  Plug 'ervandew/supertab'
  let g:SuperTabDefaultCompletionType = "<c-n>"

  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  let g:UltiSnipsExpandTrigger = "<Tab>"
  let g:UltiSnipsJumpForwardTrigger="<c-b>"
  let g:UltiSnipsJumpBackwardTrigger="<c-z>"
  let g:UltiSnipsEditSplit="vertical"

  Plug 'mattn/emmet-vim'
  let g:user_emmet_leader_key='<leader>e'

  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'

  Plug 'dense-analysis/ale'
  let g:ale_linters = {
			  \'javascript': ['flow', 'eslint', 'prettier'],
			  \'typescript': ['tsserver', 'tslint']
			  \}
  let g:ale_fixers = {
			  \'javascript': ['prettier'],
			  \'typescript': ['prettier']
			  \}
  let g:ale_fix_on_save = 1

  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

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

" b -> Buffer commands
nnoremap <Leader>bl :ls<CR>
nnoremap <Leader>bd :bd<CR>
nnoremap <Leader>bb :bn<CR>
nnoremap <Leader>bv :bp<CR>
nnoremap <Leader>bg :e#<CR>
nnoremap <Leader>b1 :1b<CR>
nnoremap <Leader>b2 :2b<CR>
nnoremap <Leader>b3 :3b<CR>
nnoremap <Leader>b4 :4b<CR>
nnoremap <Leader>b5 :5b<CR>
nnoremap <Leader>b6 :6b<CR>
nnoremap <Leader>b7 :7b<CR>
nnoremap <Leader>b8 :8b<CR>
nnoremap <Leader>b9 :9b<CR>
nnoremap <Leader>b0 :10b<CR>

" c -> Code/Comment commands
map <leader>cc <plug>NERDCommenterToggle
nnoremap <leader>cf zfa{

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
