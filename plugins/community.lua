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
}
