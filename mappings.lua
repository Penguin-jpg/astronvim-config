-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)

local sections = {
  s = { desc = "Substitute" },
}

return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

    -- Resize window
    ["<C-A-Up>"] = { function() require("smart-splits").resize_up() end, desc = "Resize split up" },
    ["<C-A-Down>"] = { function() require("smart-splits").resize_down() end, desc = "Resize split down" },
    ["<C-A-Left>"] = { function() require("smart-splits").resize_left() end, desc = "Resize split left" },
    ["<C-A-Right>"] = { function() require("smart-splits").resize_right() end, desc = "Resize split right" },

    ["<C-a>"] = { "ggVG", desc = "Select all lines" },
    ["<C-_>"] = {
      function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Comment line",
    },
    ["<C-z>"] = { "u", desc = "Undo" },

    ["<leader>un"] = {
      function() require("notify").dismiss { silent = true, pending = true } end,
      desc = "Dismiss all notifications",
    },
    ["<leader>fp"] = {
      "<cmd>lua require('telescope').extensions.project.project{}<cr>",
      desc = "Find projects",
    },

    -- Custom mappings for nvim-gomove
    ["<A-Up>"] = { "<Plug>GoNSMUp", desc = "Move line up" },
    ["<A-Down>"] = { "<Plug>GoNSMDown", desc = "Move line down" },
    ["<A-Left>"] = { "<Plug>GoNSMLeft", desc = "Move line left" },
    ["<A-Right>"] = { "<Plug>GoNSMRight", desc = "Move line right" },
    ["<S-Up>"] = { "<Plug>GoNSDUp", desc = "Duplicate line and paste it above" },
    ["<S-Down>"] = { "<Plug>GoNSDDown", desc = "Duplicate line and paste it below" },
    ["<S-Left>"] = { "<Plug>GoNSDLeft", desc = "Duplicate line and paste it left" },
    ["<S-Right>"] = { "<Plug>GoNSDRight", desc = "Duplicate line and paste it right" },

    -- Custom mappings for vim-visual-multi
    ["<A-LeftMouse>"] = { "<Plug>(VM-Mouse-Cursor)", desc = "Add a curosr at clicked position" },
    ["<A-RightMouse>"] = { "<Plug>(VM-Mouse-Word)", desc = "Select a word at clicked position" },
    ["<A-MiddleMouse>"] = { "<Plug>(VM-Mouse-Column)", desc = "Add cursors up to last clicked position" },

    -- Custom mappings for word/line substitution
    ["<leader>s"] = sections.s,
    ["<leader>se"] = {
      function() require("substitute").eol() end,
      desc = "Substitute from cursor to eol to value in register",
    },
    ["<leader>sl"] = {
      function() require("substitute").line() end,
      desc = "Substitute current line with value in register",
    },
    -- ["<leader>se"] = { function() require("substitute").eol() end }, not sure what this function do
    ["<leader>sr"] = {
      function() require("substitute.range").operator { subject = { motion = "iw" }, range = { motion = "ap" } } end,
      desc = "Substitue matched words within cursor range to input value",
    },
    ["<leader>sa"] = {
      function() require("substitute.range").operator { subject = { motion = "iw" }, range = "%" } end,
      desc = "Substitute all matched words to input value",
    },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  i = {
    -- Use <C-H> since <C-BS> sometimes fails (<C-H> also makes <C-BS> work)
    ["<C-H>"] = { "<C-w>", desc = { "Delete a word in front of cursor" } },
    ["<C-Del>"] = { "<C-o>dw", desc = "Delete a word behind curosor" },
    -- Use <C-o> to tempoarily exit insert mode and back to insert mode again
    ["<C-z>"] = { "<C-o>u", desc = "Undo in insert mode" },
    ["<C-r>"] = { "<C-o><C-r>", desc = "Redo in insert mode" },

    -- Unindent in insert mode
    ["<S-Tab>"] = { "<C-d>", desc = "Unindent line" },

    ["<C-_>"] = {
      function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Comment line in insert mode",
    },
    ["<C-s>"] = { "<cmd>w!<cr>", desc = "Save file" },
  },
  v = {
    ["<C-c>"] = { "y", desc = "Copy selected lines" },
    ["<C-_>"] = {
      "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
      desc = "Toggle comment line",
    },

    -- Custom mappings for nvim-gomove
    ["<A-Up>"] = { "<Plug>GoVSMUp", desc = "Move block up" },
    ["<A-Down>"] = { "<Plug>GoVSMDown", desc = "Move block down" },
    ["<A-Left>"] = { "<Plug>GoVSMLeft", desc = "Move block left" },
    ["<A-Right>"] = { "<Plug>GoVSMRight", desc = "Move block right" },
    ["<S-Up>"] = { "<Plug>GoVSDUp", desc = "Duplicate block and paste it above" },
    ["<S-Down>"] = { "<Plug>GoVSDDown", desc = "Duplicate block and paste it below" },
    ["<S-Left>"] = { "<Plug>GoVSDLeft", desc = "Duplicate block and paste it left" },
    ["<S-Right>"] = { "<Plug>GoVSDRight", desc = "Duplicate block and paste it right" },

    -- Custom mappings for word/line substitution
    ["<leader>s"] = sections.s,
    ["<leader>sv"] = {
      function() require("substitute").visual() end,
      desc = "Substitute selected block with value in register",
    },
  },
}
