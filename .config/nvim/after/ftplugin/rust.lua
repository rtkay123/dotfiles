local bufnr = vim.api.nvim_get_current_buf()
-- vim.keymap.set(
--   "n",
--   "<leader>ca",
--   function()
--     vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
--   end,
--   { silent = true, buffer = bufnr }
-- )

vim.keymap.set(
  "n",
  "<leader>dc",
  function()
    -- vim.cmd.rustlsp('debug')
    vim.cmd.RustLsp('debuggables')
  end,
  { silent = true, buffer = bufnr }
)

vim.keymap.set(
  "n",
  "<s-f5>",
  function()
    print("quitting")
  end,
  { silent = true, buffer = bufnr }
)
