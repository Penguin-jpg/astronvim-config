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
  -- Better move by word support
  {"chaoren/vim-wordmotion",
    event = 'VeryLazy',
  },
  -- Split or join blocks of code
  {
    "Wansmer/treesj",
    event = "User AstroFile",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function() require("treesj").setup { use_default_keymaps = false } end,
    keys = {
      { "sj", mode = { "n", "x", "i" }, function() require("treesj").toggle() end, desc = "Split or join" },
    },
  },
  -- Word/line substitution support
  {
    "gbprod/substitute.nvim",
    event = "User AstroFile",
    opts = {},
  },
  -- Faster navigation, character motions
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function() require("flash").jump() end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function() require("flash").treesitter() end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function() require("flash").remote() end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function() require("flash").treesitter_search() end,
        desc = "Treesitter Search",
      },
    },
  },
  -- Project management support
  {
    "nvim-telescope/telescope-project.nvim",
    event = "VeryLazy",
    config = function() require("telescope").load_extension "project" end,
  },
}
