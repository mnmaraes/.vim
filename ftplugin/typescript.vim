nmap <leader>ce <C-y>,

" Remap file search
nnoremap <leader>fs :Ack! --ts<Space>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> <leader>ct <cmd>call CocActionAsync('doHover')<CR>

nnoremap <leader>cv :Vista!!<CR>
nnoremap <leader>cs :Vista finder coc<CR>

aug ts_actions
  autocmd CursorHold * silent call CocActionAsync('highlight')
  autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
aug END
