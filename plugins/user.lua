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
}
