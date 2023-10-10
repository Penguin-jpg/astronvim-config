-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
local utils = require "astronvim.utils"
local is_available = utils.is_available
local replace_icon = vim.g.icons_enabled and "⟺ " or ""
local surround_icon = vim.g.icons_enabled and "󰑤 " or ""

local sections = {
  r = { desc = replace_icon .. "Replace" },
  s = { desc = surround_icon .. "Surround" },
}

local maps = require("astronvim.utils").empty_map_table()

maps.n["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" }
maps.n["<leader>bD"] = {
  function()
    require("astronvim.utils.status").heirline.buffer_picker(
      function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
    )
  end,
  desc = "Pick to close",
}
-- tables with the `name` key will be registered with which-key if it's installed
-- this is useful for naming menus
maps.n["<leader>b"] = { name = "Buffers" }

-- Resize window
maps.n["<C-A-Up>"] = { function() require("smart-splits").resize_up() end, desc = "Resize split up" }
maps.n["<C-A-Down>"] = { function() require("smart-splits").resize_down() end, desc = "Resize split down" }
maps.n["<C-A-Left>"] = { function() require("smart-splits").resize_left() end, desc = "Resize split left" }
maps.n["<C-A-Right>"] = { function() require("smart-splits").resize_right() end, desc = "Resize split right" }

-- Utility functions
maps.n["<C-a>"] = { "ggVG", desc = "Select all lines" }
if is_available "Comment.nvim" then
  maps.n["<C-_>"] = {
    function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end,
    desc = "Comment line",
  }
  maps.v["<C-_>"] = {
    "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
    desc = "Comment block",
  }
  maps.i["<C-_>"] = {
    function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end,
    desc = "Comment line",
  }
end
maps.n["<C-z>"] = { "u", desc = "Undo" }
maps.n["<C-Right>"] = { "<Plug>WordMotion_w", desc = "Next word" }
maps.n["<C-Left>"] = { "<Plug>WordMotion_b", desc = "Previous word" }
-- Use <C-H> since <C-BS> sometimes fails (<C-H> also makes <C-BS> work)
maps.i["<C-H>"] = { "<C-w>", desc = { "Delete a word forward" } }
-- <C-o> will exit insert mode tempoarily and back to insert mode again
maps.i["<C-Del>"] = { "<C-o>dw", desc = "Delete a word backward" }
maps.i["<C-z>"] = { "<C-o>u", desc = "Undo" }
maps.i["<C-r>"] = { "<C-o><C-r>", desc = "Redo" }
maps.i["<C-s>"] = { "<cmd>w!<cr>", desc = "Save file" } 
maps.v["<C-c>"] = { "y", desc = "Copy selected block" }
maps.i["<S-Tab>"] = { "<C-d>", desc = "Unindent line" }
if is_available "nvim-notify" then
  maps.n["<leader>un"] = {
    function() require("notify").dismiss { silent = true, pending = true } end,
    desc = "Dismiss all notifications",
  }
end

-- Custom mappings for nvim-gomove
if is_available "nvim-gomove" then
  maps.n["<A-Up>"] = { "<Plug>GoNSMUp", desc = "Move line up" }
  maps.n["<A-Down>"] = { "<Plug>GoNSMDown", desc = "Move line down" }
  maps.n["<A-Left>"] = { "<Plug>GoNSMLeft", desc = "Move line left" }
  maps.n["<A-Right>"] = { "<Plug>GoNSMRight", desc = "Move line right" }
  maps.n["<S-Up>"] = { "<Plug>GoNSDUp", desc = "Duplicate line and paste it above" }
  maps.n["<S-Down>"] = { "<Plug>GoNSDDown", desc = "Duplicate line and paste it below" }
  maps.v["<A-Up>"] = { "<Plug>GoVSMUp", desc = "Move block up" }
  maps.v["<A-Down>"] = { "<Plug>GoVSMDown", desc = "Move block down" }
  maps.v["<A-Left>"] = { "<Plug>GoVSMLeft", desc = "Move block left" }
  maps.v["<A-Right>"] = { "<Plug>GoVSMRight", desc = "Move block right" }
  maps.v["<S-Up>"] = { "<Plug>GoVSDUp", desc = "Duplicate block and paste it above" }
  maps.v["<S-Down>"] = { "<Plug>GoVSDDown", desc = "Duplicate block and paste it below" }
end

-- Custom mappings for word/line substitution
if is_available "substitute.nvim" then
  maps.n["<leader>r"] = sections.r
  maps.n["<leader>rr"] = {
    function() require("substitute").line() end,
    desc = "Replace line with register value",
  }
  maps.n["<leader>re"] = {
    function() require("substitute").eol() end,
    desc = "Replace from cursor to eol with register value",
  }
  maps.n["<leader>rw"] = {
    function() require("substitute.range").operator { subject = { motion = "iw" }, range = { motion = "ap" } } end,
    desc = "Replace matched words with input value",
  }
  maps.n["<leader>ra"] = {
    function() require("substitute.range").operator { subject = { motion = "iw" }, range = "%" } end,
    desc = "Replace all matched words with input value",
  }
  maps.v["<leader>r"] = sections.r
  maps.v["<leader>rr"] = {
    function() require("substitute").visual() end,
    desc = "Replace selected block with register value",
  }
  maps.v["<leader>rw"] = {
    function() require("substitute.range").visual { subject = { motion = "iw" }, range = { motion = "ap" } } end,
    desc = "Replace matched words with input value",
  }
  maps.v["<leader>ra"] = {
    function() require("substitute.range").visual { subject = { motion = "iw" }, range = "%" } end,
    desc = "Replace all matched words with input value",
  }
end

-- Custom mappings for surround (mapping details defined in user.lua)
if is_available "mini.surround" then
  maps.n["<leader>s"] = sections.s
  maps.v["<leader>s"] = sections.s
end

-- setting a mapping to false will disable it
-- maps.t["<esc>"] = false

return maps
