local M = require('kawaki/lsp')

require('lspconfig').rust_analyzer.setup({
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importPrefix = "by_self",
            },
            inlayHints = { locationLinks = false },
            cargo = {
                allFeatures = true
            },
            procMacro = {
                enable = true
            },
            checkOnSave = {
                command = "clippy"
            },
            diagnostics = {
                enable = true,
                disabled = { "unresolved-proc-macro" },
                enableExperimental = true,
            },
        }
    },
})

require('lspconfig').rust_analyzer.manager.try_add_wrapper()
