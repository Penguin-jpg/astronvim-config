return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of importing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  -- Language pack
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.json" },

  -- Colorscheme
  { import = "astrocommunity.colorscheme.kanagawa-nvim" },
  { import = "astrocommunity.colorscheme.catppuccin" },

  -- Commandline completion
  { import = "astrocommunity.completion.cmp-cmdline" },
  -- TODO comment support
  { import = "astrocommunity.editing-support/todo-comments-nvim" },
  -- Prettier diagnostics, references, telescope results, quickfix and location list
  { import = "astrocommunity.diagnostics.trouble-nvim"},
  -- Faster navigation, character motions
  { import = "astrocommunity.motion.flash-nvim" },
  -- Bracket pair colorize
  { import = "astrocommunity.editing-support/rainbow-delimiters-nvim" },
  -- Smooth scrolling
  { import = "astrocommunity.scrolling.neoscroll-nvim" },
  -- Transparent background
  { import = "astrocommunity.color.transparent-nvim" },
}
