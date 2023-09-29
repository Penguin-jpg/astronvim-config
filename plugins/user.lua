return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },

  -- Kanagawa colorscheme
  {
    "rebelot/kanagawa.nvim",
  },
  -- Additional features for Clangd
  {
    "p00f/clangd_extensions.nvim",
    init = function()
      -- load clangd extensions when clangd attaches
      local augroup = vim.api.nvim_create_augroup("clangd_extensions", { clear = true })
      vim.api.nvim_create_autocmd("LspAttach", {
        group = augroup,
        desc = "Load clangd_extensions with clangd",
        callback = function(args)
          if assert(vim.lsp.get_client_by_id(args.data.client_id)).name == "clangd" then
            require "clangd_extensions"
            vim.api.nvim_del_augroup_by_id(augroup)
          end
        end,
      })
    end,
  },
  -- Add TODO comments support
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "User AstroFile",
    cmd = { "TodoQuickFix" },
  },
  -- Move/duplicate lines up/down/left/right
  {
    "booperlv/nvim-gomove",
    event = "User AstroFile",
    config = function()
      require("gomove").setup {
        -- whether or not to map default key bindings, (true/false)
        map_defaults = false,
        -- whether or not to reindent lines moved vertically (true/false)
        reindent = true,
        -- whether or not to undojoin same direction moves (true/false)
        undojoin = true,
        -- whether to not to move past end column when moving blocks horizontally, (true/false)
        move_past_end_col = false,
      }
    end,
  },
  -- Multi-cursors support
  {
    "Penguin-jpg/vim-visual-multi",
    event = "User AstroFile",
    branch = "custom",
  },
  -- Better move by word support
  {
    "chrisgrieser/nvim-spider",
    lazy = true,
    keys = {
      {
        "w",
        "<cmd>lua require('spider').motion('w')<cr>",
        mode = { "n", "x", "o" },
        desc = "Next word",
      },
      {
        "e",
        "<cmd>lua require('spider').motion('e')<cr>",
        mode = { "n", "x", "o" },
        desc = "Next end of word",
      },
      {
        "b",
        "<cmd>lua require('spider').motion('b')<cr>",
        mode = { "n", "x", "o" },
        desc = "Previous word",
      },
      {
        "ge",
        "<cmd>lua require('spider').motion('ge')<cr>",
        mode = { "n", "x", "o" },
        desc = "Previous end of word",
      },
    },
    opts = {},
  },
  -- Word/line substitution support
  {
    "gbprod/substitute.nvim",
    event = "Use AstroFile",
    opts = {},
  },
}
