return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    local status = require "astronvim.utils.status"

    -- My custom statusline
    opts.statusline = {
      hl = { fg = "fg", bg = "bg" },
      -- Show mode text
      status.component.mode { mode_text = { padding = { left = 1, right = 1 } } },
      status.component.git_branch(),
      status.component.file_info { filename = { fallback = "Empty" }, file_modified = false },
      status.component.git_diff {},
      status.component.diagnostics(),
      status.component.fill(),
      status.component.cmd_info(),
      status.component.fill(),
      -- Show file encoding
      status.component.builder {
        {
          provider = "file_encoding",
          opts = { padding = { left = 1, right = 1 } },
        },
      },
      status.component.lsp(),
      status.component.nav(),
    }

    -- Disable winbar
    opts.winbar = nil

    -- return the final options table
    return opts
  end,
}
