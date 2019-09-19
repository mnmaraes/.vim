function ToggleDone()
  let pos = getpos('.')

  norm 0f[l
  let char = matchstr(getline('.'), '\%' . col('.') . 'c.')
  if char == 'x'
    norm r 
  else
    norm rx
  endif

  call setpos('.', pos)
endfunction

" m -> Markdown Actions
nmap <leader>mt :call append('.', '- [ ] ')<cr>jA
nmap <leader>ml :norm a[]()<esc>F]i
nmap <leader>mx :call ToggleDone()<cr>
