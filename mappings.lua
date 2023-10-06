-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
local replace_icon = vim.g.icons_enabled and "⟺ " or ""
local surround_icon = vim.g.icons_enabled and "󰑤 " or ""

local sections = {
  r = { desc = replace_icon .. "Replace" },
  s = { desc = surround_icon .. "Surround" },
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

    ["<C-Right>"] = { "<Plug>WordMotion_w", desc = "Next word" },
    ["<C-Left>"] = { "<Plug>WordMotion_b", desc = "Previous word" },

    -- NOTE: leave this part for now and change to vim-wordmotion
    -- ["<C-Right>"] = {
    --   function()
    --     -- Get line where cursor at
    --     local line = vim.fn.getline "."
    --     -- Get position of cursor
    --     local cursor_row, cursor_col = unpack(vim.api.nvim_win_get_cursor(0))
    --     -- Get length of current line
    --     local line_length = string.len(line)

    --     -- Nvim col is 0-based, need to +1
    --     cursor_col = cursor_col + 1

    --     -- Substring of current line (start from cursor position)
    --     local sub_line = string.sub(line, cursor_col)

    --     -- If curosr at the end of line or there are stil non-space character
    --     if cursor_col == line_length or string.match(sub_line, "%s") then
    --       require("spider").motion "w"
    --       -- If there exists punctuations
    --     elseif string.match(sub_line, "[%p]+") then
    --       -- Get relative positions of punctutations
    --       local punc_start, punc_end = string.find(sub_line, "[%p]+")
    --       -- Move to end of line
    --       if cursor_col + punc_end - 1 == line_length then
    --         vim.api.nvim_feedkeys("$", "n", false)
    --         -- If there is only one punctuation, skip it
    --       elseif punc_start == punc_end then
    --         require("spider").motion "w"
    --         -- Otherwise, move cursor to start of punctuation string
    --       else
    --         -- The amount that cursor need to move to deal with punctuations
    --         local move_amount = punc_start - 1
    --         -- Handle cases that make move_amount equals to 0
    --         if move_amount == 0 then
    --           vim.fn.cursor(cursor_row, cursor_col + punc_end)
    --           -- Move to punctuations
    --         else
    --           vim.fn.cursor(cursor_row, cursor_col + punc_start - 1)
    --         end
    --       end
    --     else
    --       require("spider").motion "e"
    --     end
    --   end,
    -- },
    -- ["<C-Left>"] = {
    --   function()
    --     -- Get line where cursor at
    --     local line = vim.fn.getline "."
    --     -- Get column position of cursor
    --     local cursor_pos = vim.fn.col "."
    --     -- Get current word under cursor
    --     local current_word = vim.fn.expand "<cword>"
    --     -- If curent word is special character (some punctuations)
    --     if string.match(current_word, "%p") then current_word = "\\" .. current_word end
    --     -- If there are spaces in front of current word
    --     local word_with_spaces = string.match(line, "^%s+" .. current_word)

    --     -- If current word is the only word in this line like "else" or "end"
    --     if word_with_spaces == line then
    --       require("spider").motion "b"
    --       -- If cursor at start of line or at the first word of line
    --     elseif cursor_pos == 1 or word_with_spaces then
    --       require("spider").motion "ge"
    --     else
    --       require("spider").motion "b"
    --     end
    --   end,
    -- },

    ["<leader>un"] = {
      function() require("notify").dismiss { silent = true, pending = true } end,
      desc = "Dismiss all notifications",
    },

    -- Custom mappings for nvim-gomove
    ["<A-Up>"] = { "<Plug>GoNSMUp", desc = "Move line up" },
    ["<A-Down>"] = { "<Plug>GoNSMDown", desc = "Move line down" },
    ["<A-Left>"] = { "<Plug>GoNSMLeft", desc = "Move line left" },
    ["<A-Right>"] = { "<Plug>GoNSMRight", desc = "Move line right" },
    ["<S-Up>"] = { "<Plug>GoNSDUp", desc = "Duplicate line and paste it above" },
    ["<S-Down>"] = { "<Plug>GoNSDDown", desc = "Duplicate line and paste it below" },

    -- Custom mappings for word/line substitution
    ["<leader>rr"] = {
      function() require("substitute").line() end,
      desc = "Replace line with register value",
    },
    ["<leader>re"] = {
      function() require("substitute").eol() end,
      desc = "Replace from cursor to eol with register value",
    },
    ["<leader>rw"] = {
      function() require("substitute.range").operator { subject = { motion = "iw" }, range = { motion = "ap" } } end,
      desc = "Replace matched words with input value",
    },
    ["<leader>ra"] = {
      function() require("substitute.range").operator { subject = { motion = "iw" }, range = "%" } end,
      desc = "Replace all matched words with input value",
    },

    -- Custom mappings for surround
    ["<leader>s"] = sections.s,
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

    -- Custom mappings for word/line substitution
    ["<leader>r"] = sections.r,
    ["<leader>rr"] = {
      function() require("substitute").visual() end,
      desc = "Replace selected block with register value",
    },
    ["<leader>rw"] = {
      function() require("substitute.range").visual { subject = { motion = "iw" }, range = { motion = "ap" } } end,
      desc = "Replace matched words with input value",
    },
    ["<leader>ra"] = {
      function() require("substitute.range").visual { subject = { motion = "iw" }, range = "%" } end,
      desc = "Replace all matched words with input value",
    },

    -- Custom mappings for surround
    ["<leader>s"] = sections.s,
  },
}
