-- Plugins that enhance editor experience
return {
  -- TODO comment support
  {
    "folke/todo-comments.nvim",
    event = "User AstroFile",
    opts = {},
  },
  -- Bracket pair colorize
  {
    "HiPhish/rainbow-delimiters.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = "User AstroFile",
    config = function(_, opts) require "rainbow-delimiters.setup" (opts) end,
  },
  -- Transparent background
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    opts = {
      -- table: default groups
      groups = {
        "Normal",
        "NormalNC",
        "Comment",
        "Constant",
        "Special",
        "Identifier",
        "Statement",
        "PreProc",
        "Type",
        "Underlined",
        "Todo",
        "String",
        "Function",
        "Conditional",
        "Repeat",
        "Operator",
        "Structure",
        "LineNr",
        "NonText",
        "SignColumn",
        "CursorLineNr",
        "EndOfBuffer",
      },
      -- table: additional groups that should be cleared
      extra_groups = {
        "NormalFloat",
        "NvimTreeNormal",
        "NeoTreeNormal",
        "NeoTreeFloatBorder",
        "NeoTreeNormalNC",
      },
      -- table: groups you don't want to clear
      exclude_groups = {},
    },
    keys = {
      { "<leader>uT", "<cmd>TransparentToggle<CR>", desc = "Toggle transparency" },
    },
  },
  -- Diagnostics list
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    opts = {
      use_diagnostic_signs = true,
      action_keys = {
        close = { "q", "<esc>" },
        cancel = "<c-e>",
      },
    },
    keys = {
      { "<leader>x", desc = "󱍼 Trouble" },
      { "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
      { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
      { "<leader>xl", "<cmd>TroubleToggle loclist<cr>", desc = "Location List (Trouble)" },
      { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List (Trouble)" },
    },
  },
  -- AI copilot
  {
    "Exafunction/codeium.vim",
    event = "User AstroFile",
    config = function()
      vim.keymap.set("i", "<C-a>", function() return vim.fn["codeium#Accept"]() end, { expr = true })
      vim.keymap.set("i", "<C-Right>", function() return vim.fn["codeium#CycleCompletions"](1) end, { expr = true })
      vim.keymap.set("i", "<C-Left>", function() return vim.fn["codeium#CycleCompletions"](-1) end, { expr = true })
      vim.keymap.set("i", "<C-x>", function() return vim.fn["codeium#Clear"]() end, { expr = true })
      vim.keymap.set("n", "<leader>;", function()
        if vim.g.codeium_enabled == true then
          vim.cmd "CodeiumDisable"
        else
          vim.cmd "CodeiumEnable"
        end
      end, { noremap = true, desc = "Toggle Codeium active" })
    end,
  },
}
