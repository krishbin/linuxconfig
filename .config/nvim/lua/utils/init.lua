local utils = {}

function utils.map(mode,key,to,opts)
  vim.api.nvim_set_keymap(
    mode,
    key,
    to,
    opts or {}
  )
end

return utils
