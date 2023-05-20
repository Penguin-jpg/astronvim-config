-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr) require("astronvim.utils.buffer").close(bufnr) end)
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
    ["<C-Right>"] = { "w", desc = "Move cursor right to beginning of a word" },
    ["<C-Left>"] = { "b", desc = "Move curosr left to beginning of a word" },

    ["<leader>un"] = {
      function() require("notify").dismiss({ slient = true, pending = true }) end,
      desc = "Dismiss all notifications"
    },
    ["<leader>pwd"] = { "<cmd>Neotree ./<cr>", desc = "Navigate Neotree explorer to pwd" },

    -- Custom mappings for nvim-gomove
    ["<A-Up>"] = { "<Plug>GoNSMUp", desc = "Move line up" },
    ["<A-Down>"] = { "<Plug>GoNSMDown", desc = "Move line down" },
    ["<A-Left>"] = { "<Plug>GoNSMLeft", desc = "Move line left" },
    ["<A-Right>"] = { "<Plug>GoNSMRight", desc = "Move line right" },
    ["<S-A-Up>"] = { "<Plug>GoNSDUp", desc = "Duplicate line and paste it above" },
    ["<S-A-Down>"] = { "<Plug>GoNSDDown", desc = "Duplicate line and paste it below" },
    ["<S-A-Left>"] = { "<Plug>GoNSDLeft", desc = "Duplicate line and paste it left" },
    ["<S-A-Right>"] = { "<Plug>GoNSDRight", desc = "Duplicate line and paste it right" },

    -- Custom mappings for vim-visual-multi
    ["<A-LeftMouse>"] = { "<Plug>(VM-Mouse-Cursor)", desc = "Add a curosr at clicked position" },
    ["<A-RightMouse>"] = { "<Plug>(VM-Mouse-Word)", desc = "Select a word at clicked position" },
    ["<A-MiddleMouse>"] = { "<Plug>(VM-Mouse-Column)", desc = "Add cursors up to last clicked position" },
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
  },
  v = {
    ["<C-c>"] = { "y", desc = "Copy selected lines" },
    ["<C-_>"] = { "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", 
      desc = "Toggle comment line" 
    },

    -- Custom mappings for nvim-gomove
    ["<A-Up>"] = { "<Plug>GoVSMUp", desc = "Move line up" },
    ["<A-Down>"] = { "<Plug>GoVSMDown", desc = "Move line down" },
    ["<A-Left>"] = { "<Plug>GoVSMLeft", desc = "Move line left" },
    ["<A-Right>"] = { "<Plug>GoVSMRight", desc = "Move line right" },
    ["<S-A-Up>"] = { "<Plug>GoVSDUp", desc = "Duplicate line and paste it above" },
    ["<S-A-Down>"] = { "<Plug>GoVSDDown", desc = "Duplicate line and paste it below" },
    ["<S-A-Left>"] = { "<Plug>GoVSDLeft", desc = "Duplicate line and paste it left" },
    ["<S-A-Right>"] = { "<Plug>GoVSDRight", desc = "Duplicate line and paste it right" },
  }
}
