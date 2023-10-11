return {
  "folke/noice.nvim",
  opts = function(_, opts)
    return require("astronvim.utils").extend_tbl(opts, {
      -- Disable lsp related notificaitons
      lsp = {
        progress = { enabled = false },
        hover = { enabled = false },
        signature = { enabled = false },
      },
      routes = {
        -- Disable "written" notification
        {
          filter = { event = "msg_show", kind = "", find = "written" },
          opts = { skip = true },
        },
        -- Disable paste notification
        {
          filter = { event = "msg_show", find = "^%d+ more lines$" },
          opts = { skip = true },
        },
        -- Disable delete notification
        {
          filter = { event = "msg_show", find = "^%d+ fewer lines$" },
          opts = { skip = true },
        },
        -- Disable yank notification
        {
          filter = { event = "msg_show", find = "^%d+ lines yanked$" },
          opts = { skip = true },
        },
      },
    })
  end,
}
