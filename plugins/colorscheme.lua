-- Plugins related to colorscheme
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "macchiato", -- latte, frappe, macchiato, mocha
      background = { -- :h background
          light = "latte",
          dark = "mocha",
      },
      integrations = {
        alpha = true,
        aerial = false,
        dap = { enabled = true, enable_ui = true },
        mason = true,
        neotree = true,
        notify = true,
        nvimtree = false,
        semantic_tokens = true,
        symbols_outline = true,
        telescope = true,
        which_key = true,
        noice = true,
        rainbow_delimiters = true,
        cmp = true,
        gitsigns = true,
        treesitter = true,
        lsp_trouble = true,
        neogit = true,
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    optional = true,
    opts = {
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    },
  },
  {
    "rebelot/kanagawa.nvim",
    opts = function(_, opts)
      opts.overrides = function(colors)
        return {
          RainbowDelimiterRed = { fg = colors.palette.autumnRed },
          RainbowDelimiterYellow = { fg = colors.palette.carpYellow },
          RainbowDelimiterBlue = { fg = colors.palette.dragonBlue },
          RainbowDelimiterOrange = { fg = colors.palette.surimiOrange },
          RainbowDelimiterGreen = { fg = colors.palette.springGreen },
          RainbowDelimiterViolet = { fg = colors.palette.oniViolet },
          RainbowDelimiterCyan = { fg = colors.palette.waveAqua1 },
        }
      end
      return opts
    end,
  },
  {
    "navarasu/onedark.nvim",
    opts = function(_, opts)
      opts.style = "darker"
      return opts
    end,
  },
}