if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set bs=2
set sw=2

set number relativenumber
set hidden

set termguicolors

set cursorline

set nobackup
set nowritebackup

set cmdheight=2

set updatetime=300
set autoread

set shortmess+=c

set signcolumn=yes

set fdm=manual

set exrc

set mouse=a

set nocompatible
filetype plugin on
syntax on

let mapleader=" "
let g:markdown_folding = 1
set runtimepath+=~/.vim/my-snippets/
set runtimepath^=/Users/murillo/Projects/Personal/central-interfaces/coc-central

set undofile

set clipboard=unnamed

set directory=$HOME/.vim/swp//
set undodir=$HOME/.vim/undodir

call plug#begin('~/.vim/plugged')
  Plug 'arzg/vim-colors-xcode'
  Plug 'ajh17/Spacegray.vim'
  let g:spacegray_low_contrast = 1

  Plug 'simeji/winresizer'

  Plug 'mhinz/vim-startify'
  let g:startify_session_autoload = 1
  let g:startify_session_persistence = 1
  let g:startify_change_to_dir = 0

  Plug 'vim-perl/vim-perl', { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }
  Plug 'vim-airline/vim-airline'
  let g:airline_powerline_fonts = 1

  Plug 'reasonml-editor/vim-reason-plus'

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

  Plug 'tpope/vim-markdown'
  let g:markdown_fenced_languages = ['javascript', 'js=javascript', 'json',  'jsx', 'reason']
  Plug 'chmp/mdnav'

  Plug 'scrooloose/nerdcommenter'
  let g:NERDCreateDefaultMappings = 0

  Plug 'othree/yajs.vim'
  Plug 'mxw/vim-jsx'
  Plug 'mhartington/oceanic-next'

  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  let g:UltiSnipsExpandTrigger=""

  Plug 'mattn/emmet-vim'

  Plug 'liuchengxu/vista.vim'
  let g:vista_default_executive = 'coc'
  let g:vista_fzf_preview = ['right:50%']

  Plug 'cespare/vim-toml'

  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'

  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  let $FZF_DEFAULT_COMMAND = 'ag -g ""'

  Plug 'mileszs/ack.vim'
  if executable('ag')
    let g:ackprg = 'ag --vimgrep'
  endif

  "Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
call plug#end()

" Abbreviations
cabbr <expr> %% expand('%:p:h')

" <TAB>: completion.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

inoremap <silent><expr> <c-space> coc#refresh()

nnoremap <SPACE> <Nop>
nnoremap Q <Nop>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

" Enhanced Movement
nnoremap H 10h
nnoremap J 10j
nnoremap K 10k
nnoremap L 10l
nnoremap <c-l> :bn<CR>
nnoremap <c-h> :bp<CR>

" b -> Buffer commands
nnoremap <Leader>bd :b#<bar>bd#<CR>
nnoremap <Leader>bo :%bd<bar>e#<CR>
nnoremap <Leader>ba :%bd<CR>

" c -> Code/Comment commands
nmap <leader>cc <plug>NERDCommenterToggle
nnoremap <leader>cf zfa{
nnoremap <silent> <leader>ct :call <SID>show_documentation()<CR>
nnoremap <leader>cd :CocList diagnostics<CR>
nnoremap <leader>cv :Vista!!<CR>
nnoremap <leader>cs :Vista finder coc<CR>

" k -> Split commands
nmap <leader>kb :NERDTreeToggle<CR>
nmap <leader>kv :vsp<CR>
nmap <leader>kn :sp<CR>

nnoremap <leader>kk <C-W><C-K>
nnoremap <leader>kj <C-W><C-J>
nnoremap <leader>kh <C-W><C-H>
nnoremap <leader>kl <C-W><C-L>

nnoremap <silent> <leader>kz :call <SID>zoom_toggle()<CR>

" w -> Wiki-like (Notes helpers)
nmap <Leader>ww :e ~/Projects/Planning/index.md<CR>

" Do things!
nnoremap <leader>s :w<CR>
nnoremap <leader>x :qa<CR>

" f -> File options
nnoremap <leader>ff :FZF!<cr>
nnoremap <leader>fs :Ack!<Space>

" v -> vim options
nmap <leader>vl :setlocal rnu!<cr>

" / -> Search options
nnoremap <leader>// /
nnoremap <leader>/. :noh<cr>

" Autocommands
aug toggle_relative
  au! 
  au InsertEnter,WinLeave * :setlocal norelativenumber
  au InsertLeave,WinEnter * :setlocal relativenumber

  autocmd CursorHold * silent call CocActionAsync('highlight')
  autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
aug END

" Functions
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

" Based on: https://github.com/justinmk/config/blob/master/.config/nvim/init.vim
function! s:zoom_toggle()
  if 1 == winnr('$')
    return
  endif

  let restore_cmd = winrestcmd()
  wincmd |
  wincmd _

  if exists('t:zoom_restore')
    exe t:zoom_restore
    unlet t:zoom_restore
  else
    let t:zoom_restore = restore_cmd
  endif
endfunction

colorscheme spacegray

set secure
