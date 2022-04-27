local Lsn = {}

function Lsn.setup()
  local function prequire(...)
  local status, lib = pcall(require, ...)
  if (status) then return lib end
      return nil
  end

  local ls = prequire('luasnip')

  ls.config.set_config({
    history = true,
    update_events = "TextChanged,TextChangedI",
    delete_check_events = "TextChanged"
  })

  vim.keymap.set({"i","s"},"<c-k>",function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
    end
  end,{silent = true})

  vim.keymap.set({"i","s"},"<c-j>",function()
  if ls.jumpable(-1) then
    ls.jump(-1)
    end
  end,{silent = true})
  vim.keymap.set("i","<c-l>",function()
    if ls.choice_active() then
      ls.change_choice(1)
    end
  end)

  require'lsp_lua.snippets'.setup()

end

return Lsn
