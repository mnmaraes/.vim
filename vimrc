let g:python_host_prog  = '/usr/local/bin/python'
let g:python3_host_prog  = '/usr/local/bin/python3'

set bs=2
set sw=2

set number relativenumber
set hidden

set termguicolors

set cursorline

set nobackup
set nowritebackup

set cmdheight=2

set updatetime=100
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

set undofile

set clipboard=unnamed

set directory=$HOME/.vim/swp//
set undodir=$HOME/.vim/undodir

let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let g:vista_fzf_preview = ['right:50%']
let g:vista_default_executive = 'coc'

" set fzf help
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Completion setting
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent> <c-.> <Plug>(completion_trigger)

let g:completion_enable_snippet = 'UltiSnips'

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" Abbreviations
cabbr <expr> %% expand('%:p:h')

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nnoremap <SPACE> <Nop>
nnoremap Q <Nop>

nmap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nmap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>

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
nmap <silent> <leader>cd <Plug>(jsdoc)
nnoremap <leader>cf zfa{
nnoremap <silent> <leader>c. <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <leader>ct <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>cx <cmd>lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR>

" k -> Split commands
nmap <leader>kb :NERDTreeToggle<CR>
nmap <leader>kv :vsp<CR>
nmap <leader>kn :sp<CR>

nnoremap <leader>kx <C-W><q>
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

autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 1000)

" Autocommands
aug toggle_relative
  au! 
  au InsertEnter,WinLeave * :setlocal norelativenumber
  au InsertLeave,WinEnter * :setlocal relativenumber
aug END

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

hi LspDiagnosticsUnderlineError        	ctermbg=NONE   ctermfg=NONE     guibg=NONE  guifg=#CC6666  cterm=NONE      gui=underline
hi LspDiagnosticsUnderlineWarning 	ctermbg=NONE   ctermfg=NONE     guibg=NONE  guifg=#B294BB  cterm=NONE      gui=underline
hi LspDiagnosticsUnderlineHint        	ctermbg=NONE   ctermfg=NONE     guibg=NONE  guifg=#81A2BE  cterm=NONE      gui=underline
hi LspDiagnosticsUnderlineInfo      	ctermbg=NONE   ctermfg=NONE     guibg=NONE  guifg=#8ABEB7  cterm=NONE      gui=underline

set secure
