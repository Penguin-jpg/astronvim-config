return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  -- Language pack
  -- { import = "astrocommunity.pack.cpp" },

  -- Commandline completion
  { import = "astrocommunity.completion.cmp-cmdline" },
  -- TODO comment support
  { import = "astrocommunity.editing-support/todo-comments-nvim" },
  -- Prettier diagnostics, references, telescope results, quickfix and location list
  { import = "astrocommunity.diagnostics.trouble-nvim"},
  -- Faster navigation, character motions
  { import = "astrocommunity.motion.flash-nvim" },
  {
    "folke/flash.nvim",
    event = "verylazy",
    vscode = true,
    opts = {},
    keys = {
      {
        "<C-f>",
        mode = { "n", "x", "o" },
        function() require("flash").jump() end,
        desc = "flash",
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function() require("flash").treesitter() end,
        desc = "flash treesitter",
      },
      {
        "r",
        mode = "o",
        function() require("flash").remote() end,
        desc = "remote flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function() require("flash").treesitter_search() end,
        desc = "treesitter search",
      },
    },
  },
}
