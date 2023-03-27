local M = require('kawaki/lsp')

require('lspconfig').texlab.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
}

require('lspconfig').texlab.manager.try_add_wrapper()
