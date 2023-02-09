local M={}
local nvim_lsp = require'lspconfig'

local function on_attach(client,bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

local servers = {
  "clangd","rls","dartls","denols","texlab","gopls",
}

local function variableSet()
  vim.g.diagnostic_trimmed_virtual_text = "60"
end

local function diagnostic()
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = true;
      virtual_text = {
        spacing = 10;
        prefix = "";
      };
      signs = true;
      update_in_insert = false;
    }
  )
end

local function treeSitter()
  require'nvim-treesitter.configs'.setup {
      highlight = {
        enable = true,              -- false will disable the whole extension
        use_languagetree = false,
      },
      incremental_selection = {
        enable = true,
        keymaps = { -- mappings for incremental selection (visual mappings)
          init_selection = '<M-w>',    -- maps in normal mode to init the node/scope selection
          node_incremental = '<M-w>',  -- increment to the upper named parent
          scope_incremental = '<M-e>', -- increment to the upper scope (as defined in locals.scm)
          node_decremental = '<M-C-w>',  -- decrement to the previous node
        }
      },
      indent = { enable = true },
      refactor = {
        highlight_definitions = { enable = true },
        highlight_current_scope = { enable = true },
      }
    }
end

function M.setup()
  local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
  for _,lsp in ipairs(servers)
    do
    nvim_lsp[lsp].setup({
        on_attach=on_attach,
        capabilities = capabilities
      })
  end

  diagnostic()

  treeSitter()

  variableSet()
  require'lsp_lua.comp'.setup()
  require'lsp_lua.snip'.setup()
end

return M
