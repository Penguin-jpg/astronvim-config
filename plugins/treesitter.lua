return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it

    -- use zig as compiler for windows to work :P
    if vim.fn.has "win32" then
      require("nvim-treesitter.install").compilers = { "zig" }
    end

    opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
      "lua",
      "c",
      "cpp",
      "python"
    })
  end,
}
