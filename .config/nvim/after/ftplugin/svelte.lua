local M = require('config.custom.dap.node');
vim.bo.formatprg = 'pnpm exec prettier --stdin-filepath %'
M.node_dap()

require("dap").configurations.svelte = {
  {
    type = "pwa-node",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    cwd = "${workspaceFolder}",
  },
}
