local M = {}

M.ruff_lsp = function(client, bufnr)
  -- Disable ruff_lsp hover in favor of pyright
  if client.name == "ruff_lsp" then client.server_capabilities.hoverProvider = false end
end

return M
