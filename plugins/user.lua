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
    event = "User AstroFile",
  },
  -- Split or join blocks of code
  {
    "Wansmer/treesj",
    event = "User AstroFile",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function() require("treesj").setup { use_default_keymaps = false } end,
    keys = {
      { "sj", mode = { "n", "x" }, function() require("treesj").toggle() end, desc = "Split or join" },
    },
  },
  -- Word/line substitution support
  {
    "gbprod/substitute.nvim",
    event = "User AstroFile",
    opts = {},
  },
  -- Faster change/delete/replace delimiter pairs
  {
    "echasnovski/mini.surround",
    event = "User AstroFile",
    opts = {
      mappings = {
        add = "<leader>sa", -- Add surrounding in Normal and Visual modes
        delete = "<leader>sd", -- Delete surrounding
        find = "<leader>sf", -- Find surrounding (to the right)
        find_left = "<leader>sF", -- Find surrounding (to the left)
        highlight = "<leader>sh", -- Highlight surrounding
        replace = "<leader>sr", -- Replace surrounding
        update_n_lines = "<leader>sn", -- Update `n_lines`
      },
    },
    keys = function(plugin, keys)
      -- Populate the keys based on the user's options
      local mappings = {
        { plugin.opts.mappings.add, desc = "Add surrounding", mode = { "n", "v" } },
        { plugin.opts.mappings.delete, desc = "Delete surrounding" },
        { plugin.opts.mappings.find, desc = "Find right surrounding" },
        { plugin.opts.mappings.find_left, desc = "Find left surrounding" },
        { plugin.opts.mappings.highlight, desc = "Highlight surrounding" },
        { plugin.opts.mappings.replace, desc = "Replace surrounding" },
        { plugin.opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
      }
      mappings = vim.tbl_filter(function(m) return m[1] and #m[1] > 0 end, mappings)
      return vim.list_extend(mappings, keys)
    end,
  },
  -- Refactoring support
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
    cmd = { "Refactor" },
    event = "User AstroFile",
    opts = {},
    keys = function(plugin, keys)
      local mappings = {
        {
          "<leader>rf",
          function() require("refactoring").refactor("Extract Function") end,
          mode = { "x" },
          desc = "Extract Function",
        },
        {
          "<leader>rF",
          function() require("refactoring").refactor("Extract Function To File") end,
          mode = { "x" },
          desc = "Extract Function To File",
        },
        {
          "<leader>rv",
          function() require("refactoring").refactor("Extract Variable") end,
          mode = { "x" },
          desc = "Extract Variable",
        },
        {
          "<leader>ri",
          function() require("refactoring").refactor("Inline Variable") end,
          mode = { "n", "x" },
          desc = "Inline Variable",
        },
        {
          "<leader>rb",
          function() require("refactoring").refactor "Extract Block" end,
          mode = { "n" },
          desc = "Extract Block",
        },
        {
          "<leader>rB",
          function() require("refactoring").refactor "Extract Block To File" end,
          mode = { "n" },
          desc = "Extract Block To File",
        },
      }
      return vim.list_extend(mappings, keys)
    end,
    config = function()
      require("refactoring").setup({
        -- prompt for return type
        prompt_func_return_type = {
          cpp = true,
          c = true,
        },
        -- prompt for function parameters
        prompt_func_param_type = {
          cpp = true,
          c = true,
        },
      })
    end,
  },
  -- Project management support
  {
    "nvim-telescope/telescope-project.nvim",
    event = "VeryLazy",
    config = function() require("telescope").load_extension "project" end,
  },
}
