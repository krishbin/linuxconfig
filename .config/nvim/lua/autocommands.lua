local auto = {}
function legacy()
vim.api.nvim_exec([[
  " we have to set these window options here because vim.o won't accept them and vim.wo wont set for each window automatically
  " and binding to an autocmd will mess with window that change those settings

  if has("autocmd")
  filetype plugin indent on
  endif

  au FileType scheme set ft=query
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType cpp setlocal ts=2 sts=2 sw=2 expandtab
  au FileType python set tabstop=4 shiftwidth=4 noexpandtab
  au FileType markdown set tabstop=4 shiftwidth=4 conceallevel=2
  au FileType typescriptreact,typescript,javascript,javascriptreact,lua set tabstop=2 shiftwidth=2
  au FileType vim set fdm=marker
  au TextYankPost * silent! lua require'vim.highlight'.on_yank({ timeout=500 })

  autocmd Filetype help nmap <silent><buffer> q :q<CR>
  autocmd Filetype help wincmd K
  autocmd FileType tex nnoremap <F5> :silent VimtexCompile<CR>
  autocmd FileType tex inoremap <F5> <esc>:silent VimtexCompile<CR>

  augroup CompletionTriggerCharacter
  autocmd!
  autocmd BufEnter * let g:completion_trigger_character = ['.']
  autocmd BufEnter *.c,*.cpp let g:completion_trigger_character = ['.', '::']
  augroup end
  autocmd FileType markdown set foldexpr=NestedMarkdownFolds()

  autocmd Filetype c,cpp nnoremap <leader><C-s> m`:w!<cr>:%!clang-format --style=Google %<cr>:w<cr>``

  cabbrev W w
  cabbrev E e
  cabbrev Wq wq
  ]], '')
end
function auto.setup()
  legacy()
end

return auto
