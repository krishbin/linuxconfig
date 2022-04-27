local auto = {}
local a_cmd = vim.api.nvim_create_autocmd
local a_grp = vim.api.nvim_create_augroup
local o = vim.o
local wo = vim.wo
function legacy()
vim.api.nvim_exec([[
  " and binding to an autocmd will mess with window that change those settings

  if has("autocmd")
    filetype plugin indent on
  endif

  set laststatus=3
  highlight WinSeparator guifg=#4C566A
  au TextYankPost * silent! lua require'vim.highlight'.on_yank({ timeout=200 })

  au FileType scheme set ft=query
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType cpp setlocal ts=2 sts=2 sw=2 expandtab
  au FileType python set tabstop=4 shiftwidth=4 noexpandtab
  au FileType markdown set tabstop=4 shiftwidth=4 conceallevel=2
  au FileType typescriptreact,typescript,javascript,javascriptreact,lua set tabstop=2 shiftwidth=2

  autocmd Filetype help nmap <silent><buffer> q :q<CR>
  autocmd Filetype help wincmd K

  autocmd FileType tex nnoremap <F5> :silent VimtexCompile<CR>
  autocmd FileType tex inoremap <F5> <esc>:silent VimtexCompile<CR>

  autocmd FileType markdown set foldexpr=NestedMarkdownFolds()

  cabbrev W w
  cabbrev E e
  cabbrev Wq wq
  ]], '')
end
function auto.setup()
  legacy()
end

return auto
