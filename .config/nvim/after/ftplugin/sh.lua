local M = require('kawaki/lsp')

require('lspconfig').bashls.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
}

require 'lspconfig'.bashls.manager.try_add_wrapper()
