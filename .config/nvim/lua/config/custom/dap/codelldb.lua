local M = {}
function M.node_dap()
  require("dap").adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
      command = '/sbin/codelldb',
      args = { "--port", "${port}" },
      -- On windows you may have to uncomment this:
      -- detached = false,
    }
  }
end

M.configuration = {
  name = "Launch file",
  type = "codelldb",
  request = "launch",
  program = function()
    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
  end,
  cwd = '${workspaceFolder}',
  stopOnEntry = false,
}


return M
