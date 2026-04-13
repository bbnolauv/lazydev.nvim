local Workspace = require("lazydev.workspace")
local plugins = require("lazy.core.config").plugins

local M = {}

function M.setup()
  local dev_paths = {}
  for _, plugin_spec in pairs(plugins) do
    if plugin_spec.dev then
      table.insert(dev_paths, plugin_spec.dir)
    end
  end
  for _, path in pairs(dev_paths) do
    Workspace.global():add(path)
  end
end

return M
