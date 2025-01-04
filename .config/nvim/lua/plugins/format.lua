return {
  "stevearc/conform.nvim",
  ft = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    "css",
    "scss",
    "svelte",
    "lua",
  },
  config = function()
    local conform = require("conform")
    local formatter = { "prettierd", "prettier", stop_after_first = true }
    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "isort", "black" },
        javascript = formatter,
        typescript = formatter,
        svelte = formatter,
      },
    })

    vim.keymap.set("n", "<C-f>", function()
      conform.format()
    end, { desc = "format" })
  end,
}
