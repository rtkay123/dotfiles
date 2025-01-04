local M =  {}
function M.node_dap()
  require("dap").adapters["pwa-node"] = {
    type = "server",
    host = "localhost",
    port = "${port}",
    executable = {
      command = "node",
      args = {"/sbin/dapDebugServer.js", "${port}"},
    }
  }
end

return M
