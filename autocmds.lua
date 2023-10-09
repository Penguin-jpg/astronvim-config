-- Some commands that I want to execute in specific timing
vim.api.nvim_create_augroup("auto-commands", { clear = true })
-- vim.api.nvim_create_autocmd("BufEnter", {
--   desc = "Automatically activate shift-selecting",
--   group = "auto-commands",
--   command = "set keymodel=startsel,stopsel",
-- })
vim.api.nvim_create_autocmd("BufWinEnter", {
  desc = "Automatically change cursor type to default setting",
  group = "auto-commands",
  command = "set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20",
})
vim.api.nvim_create_autocmd("CursorHold", {
  desc = "Show diagnostics text when cursor hovers that line",
  group = "auto-commands",
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = "rounded",
      source = "always",
      prefix = " ",
      scope = "cursor",
    }
    vim.diagnostic.open_float(nil, opts)
  end,
})
vim.api.nvim_create_autocmd("InsertEnter", {
  desc = "Disable auto insert comment header",
  group = "auto-commands",
  command = "set formatoptions-=cro",
})