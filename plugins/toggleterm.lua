-- Use powershell for toggleterm
return {
  "akinsho/toggleterm.nvim",
  opts = function(_, opts)
    if vim.fn.has "win32" then
      opts.shell = "pwsh.exe"
    end
  end
}