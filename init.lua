return {
  -- Configure AstroNvim updates
  updater = require "user.updater",

  -- Set colorscheme to use
  colorscheme = "catppuccin-macchiato",

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = require "user.diagnostics",

  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- "lua_ls",
      },
      timeout_ms = 3200, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
    config = {
      clangd = require "user.lsp.config.clangd",
      ruff_lsp = {
        on_attach = require("user.lsp.on_attach").ruff_lsp,
      },
    },
  },

  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },

  polish = require "user.polish",
  -- modify variables used by heirline but not defined in the setup call directly
  heirline = {
    attributes = {
      mode = { bold = true },
    },
    -- add new colors that can be used by heirline
    -- colors = function(hl)
    -- local get_hlgroup = require("astronvim.utils").get_hlgroup
    -- use helper function to get highlight group properties
    -- hl.blank_bg = get_hlgroup("Folded").fg
    -- hl.file_info_bg = get_hlgroup("Visual").bg
    -- hl.nav_icon_bg = get_hlgroup("String").fg
    -- hl.nav_fg = hl.nav_icon_bg
    -- hl.folder_icon_bg = get_hlgroup("Error").fg
    -- return hl
    -- end,
  },
}
