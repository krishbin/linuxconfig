local utils = {}

function utils.map(mode,key,to,opts)
  vim.keymap.set(
    mode,
    key,
    to,
    opts or {}
  )
end

function utils.reload_config()
    require('config').setup()
    require('keymaps').setup()
    require('notify')("Reloaded config","info",{
        render="compact",
        timeout=1000,
        title="Config",
    })
end

return utils
