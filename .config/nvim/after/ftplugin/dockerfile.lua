local M = require('kawaki/lsp')

require('lspconfig').dockerls.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
}

require 'lspconfig'.dockerls.manager.try_add_wrapper()
