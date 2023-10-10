local M = {}

function M.ruff_lsp(client, bufnr)
  -- Disable ruff_lsp hover in favor of pyright
  if client.name == "ruff_lsp" then client.server_capabilities.hoverProvider = false end
end

return M
