-- Plugins related to git
return {
  -- Good git plugin
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      -- "nvim-telescope/telescope.nvim", -- optional
      -- "sindrets/diffview.nvim",        -- optional
      -- "ibhagwan/fzf-lua",              -- optional
    },
    event = "User AstroGitFile",
    opts = function(_, opts)
      local utils = require "astronvim.utils"
      local fold_signs = { utils.get_icon "FoldClosed", utils.get_icon "FoldOpened" }
      return require("astronvim.utils").extend_tbl(opts, {
        disable_builtin_notifications = true,
        telescope_sorter = function()
          if utils.is_available "telescope-fzf-native.nvim" then
            return require("telescope").extensions.fzf.native_fzf_sorter()
          end
        end,
        integrations = { telescope = true, diffview = true },
        signs = { section = fold_signs, item = fold_signs },
      })
    end,
  },
  -- Diff page view
  {
    "sindrets/diffview.nvim",
    event = "User AstroGitFile",
    cmd = { "DiffviewOpen" },
  },
}
