return {
  "folke/noice.nvim",
  config = function()
    require("noice").setup {
      -- Disable "written" message
      routes = {
        {
          filter = {
            event = "msg_show",
            kind = "",
            find = "written",
          },
          opts = { skip = true },
        },
      },
    }
  end,
}
