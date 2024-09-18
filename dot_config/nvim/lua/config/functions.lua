LIST_PLUGINS = function()
  local plugins = require("lazy").plugins()
  for _, tbl in pairs(plugins) do
      local name = tbl['name']
      local url = tbl['url']
      io.stdout:write("- [" .. name .. "](" .. url .. ")\n")
  end
end
