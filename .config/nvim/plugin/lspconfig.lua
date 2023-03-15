local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

local protocol = require('vim.lsp.protocol')
local capabilities = require("cmp_nvim_lsp").default_capabilities(protocol.make_client_capabilities())

local on_attach = function(_, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local opts = { noremap = true, silent = true }
  -- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gK', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
end

-- Auto Install Language Server
local servers = {
  "tsserver",
  "ruby_ls",
  "dockerls",
  "lua_ls",
  "tailwindcss",
  "html",
  "cssls",
  "solargraph",
  "bashls",
  "jsonls"
}


-- manually start the server and don't wait for the usual filetype trigger from lspconfig
local function buf_try_add(server_name, bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  require("lspconfig")[server_name].manager.try_add_wrapper(bufnr)
end

for _, server_name in pairs(servers) do
  nvim_lsp[server_name].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
  buf_try_add(server_name)
end

vim.diagnostic.config({
  virtual_text = true,
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focusable = true,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
    format = function(d)
      local code = d.code or (d.user_data and d.user_data.lsp.code)
      if code then
        return string.format("%s [%s]", d.message, code):gsub("1. ", "")
      end
      return d.message
    end,
  },
})
