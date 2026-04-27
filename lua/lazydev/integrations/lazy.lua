local Workspace = require("lazydev.workspace")

local M = {}

function M.setup()
  local ok, LazyConfig = pcall(require, "lazy.core.config")
  if not ok then
    return
  end
  for _, plugin_spec in pairs(LazyConfig.plugins or {}) do
    if plugin_spec.dev and type(plugin_spec.dir) == "string" then
      Workspace.global():add(plugin_spec.dir)
    end
  end
end

return M
