return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            {
                'j-hui/fidget.nvim',
                config = true,
            },

        }
    },
    {
        'lvimuser/lsp-inlayhints.nvim',
        ft = { 'rust', 'typescript', "typescriptreact", "lua", "go" },
        config = function()
            require('lsp-inlayhints').setup({
                inlay_hints = {
                    parameter_hints = {
                        prefix = "  ",
                    },
                },
            })
        end
    },
    {
        'jose-elias-alvarez/null-ls.nvim',
        ft = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "css",
            "scss",
            "html",
            "json",
            "jsonc",
            "python"
        },
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.prettierd,
                    --                    null_ls.builtins.diagnostics.pylint,
                    --                    null_ls.builtins.diagnostics.pycodestyle,
                    null_ls.builtins.formatting.black,
                },
            })
        end
    }
}
