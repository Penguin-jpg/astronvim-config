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
  -- Faster navigation, character motions
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    vscode = true,
    opts = {
      modes = {
        char = {
          enabled = true,
          jump_labels = true,
          keys = {},
        },
      },
    },
    keys = {
      {
        "f",
        mode = { "n", "o", "x" },
        function() require("flash").jump() end,
        desc = "Flash",
      },
      {
        "F",
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
  -- AI copilot
  {
    "Exafunction/codeium.vim",
    event = "User AstroFile",
    config = function()
      vim.keymap.set("i", "<Tab>", function() return vim.fn["codeium#Accept"]() end, { expr = true })
      vim.keymap.set("i", "<A-]>", function() return vim.fn["codeium#CycleCompletions"](1) end, { expr = true })
      vim.keymap.set("i", "<A-[>", function() return vim.fn["codeium#CycleCompletions"](-1) end, { expr = true })
      vim.keymap.set("i", "<C-x>", function() return vim.fn["codeium#Clear"]() end, { expr = true })
      vim.keymap.set("n", "<leader>;", function()
        if vim.g.codeium_enabled == true then
          vim.cmd "CodeiumDisable"
        else
          vim.cmd "CodeiumEnable"
        end
      end, { noremap = true, desc = "Toggle Codeium active" })
    end,
  },
}
