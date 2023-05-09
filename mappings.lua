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
    
    ["<C-a>"] = { "ggVG", desc = "Select all lines" },

    -- Custom mappings for nvim-gomove
    ["<A-Up>"] = { "<Plug>GoNSMUp", desc = "Move line up" },
    ["<A-Down>"] = { "<Plug>GoNSMDown", desc = "Move line down" },
    ["<A-Left>"] = { "<Plug>GoNSMLeft", desc = "Move line left" },
    ["<A-Right>"] = { "<Plug>GoNSMRight", desc = "Move line right" },
    ["<S-Up>"] = { "<Plug>GoNSDUp", desc = "Duplicate line and paste it above" },
    ["<S-Down>"] = { "<Plug>GoNSDDown", desc = "Duplicate line and paste it below" },
    ["<S-Left>"] = { "<Plug>GoNSDLeft", desc = "Duplicate line and paste it left" },
    ["<S-Right>"] = { "<Plug>GoNSDRight", desc = "Duplicate line and paste it right" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  i = {
    -- Use <C-H> since <C-bs> sometimes fails (<C-H> also makes <C-bs> work)
    ["<C-H>"] = { "<C-w>", desc = { "Delete a word in front of cursor" } },
    
    -- Unindent in insert mode
    ["<S-Tab>"] = { "<C-d>", desc = "Unindent line" },
  },
  v = {
    -- Custom mappings for nvim-gomove
    ["<A-Up>"] = { "<Plug>GoVSMUp", desc = "Move line up" },
    ["<A-Down>"] = { "<Plug>GoVSMDown", desc = "Move line down" },
    ["<A-Left>"] = { "<Plug>GoVSMLeft", desc = "Move line left" },
    ["<A-Right>"] = { "<Plug>GoVSMRight", desc = "Move line right" },
    ["<S-Up>"] = { "<Plug>GoVSDUp", desc = "Duplicate line and paste it above" },
    ["<S-Down>"] = { "<Plug>GoVSDDown", desc = "Duplicate line and paste it below" },
    ["<S-Left>"] = { "<Plug>GoVSDLeft", desc = "Duplicate line and paste it left" },
    ["<S-Right>"] = { "<Plug>GoVSDRight", desc = "Duplicate line and paste it right" },
  }
}
