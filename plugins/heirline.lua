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

    -- vscode-like winbar
    opts.winbar = {
      -- show the path to the file relative to the working directory
      status.component.separated_path { path_func = status.provider.filename { modify = ":.:h" } },
      -- add the file name and icon
      status.component.file_info { -- add file_info to breadcrumbs
        file_icon = { hl = status.hl.filetype_color, padding = { left = 0 } },
        file_modified = false,
        file_read_only = false,
        hl = status.hl.get_attributes("winbar", true),
        surround = false,
        update = "BufEnter",
      },
      -- show the breadcrumbs
      status.component.breadcrumbs {
        icon = { hl = true },
        hl = status.hl.get_attributes("winbar", true),
        prefix = true,
        padding = { left = 0 },
      },
    }

    -- return the final options table
    return opts
  end,
}