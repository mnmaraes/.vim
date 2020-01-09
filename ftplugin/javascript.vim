nmap <leader>ce <C-y>,
nnoremap <leader>c/ :norm o//=====[  ]=====<esc>0t]ha

nnoremap <leader>fs :Ack! --js<Space>
nnoremap <leader>fS "zyiw:exe "Ack! --js -w ".@z.""<CR>

nnoremap <leader>fR "zyiw:exe "Ack! --js 'redux/".@z."'"<CR>
