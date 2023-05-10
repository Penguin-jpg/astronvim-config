-- Use powershell for toggleterm
return {
  "akinsho/toggleterm.nvim",
  opts = function(_, opts)
    opts.shell = "pwsh.exe"
  end
}