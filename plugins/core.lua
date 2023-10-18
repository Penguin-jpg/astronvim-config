return {
  -- Additional setup or configuration of plugins
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- Customize the dashboard header
      opts.section.header.val = require("user.alpha_themes").UWU
      return opts
    end,
  },
  {
    "rcarriga/nvim-notify",
    opts = function(_, opts)
      -- Do this to prevent the warning
      opts.background_colour = "#000000"
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    opts = function(_, opts)
      -- Use powershell for toggleterm on windows
      if vim.fn.has "win32" then opts.shell = "pwsh.exe" end
    end,
  },
  {
    "max397574/better-escape.nvim",
    opts = {
      mapping = { "jj", "xx" },
    },
  },

  -- Enable/Disable plugins
  { "nvim-telescope/telescope-fzf-native.nvim", enabled = false },
  { "lukas-reineke/indent-blankline.nvim",      enabled = false },
  { "s1n7ax/nvim-window-picker",                enabled = false },
  { "stevearc/aerial.nvim",                     enabled = false },
  { "HiPhish/rainbow-delimiters.nvim",          enabled = false },
  { "folke/flash.nvim",                         enabled = false },
  { "mfussenegger/nvim-dap",                    enabled = true },
}