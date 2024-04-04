-- Author: Tarun (tarungovindk) nvim configs --
local nvim_tree_status_ok, cmp = pcall(require, "nvim-tree")
if not nvim_tree_status_ok then
  return
end

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
end


-- empty setup using defaults
require("nvim-tree").setup({
    view = {
        width = 35,
        relativenumber = true,
    },
    -- change folder arrow icons
    renderer = {
        indent_markers = {
            enable = true,
        },
        icons = {
            glyphs = {
                folder = {
                    arrow_closed = ">", -- arrow when folder is closed
                    arrow_open = "v", -- arrow when folder is open
                },
            },
        },
    },

    -- disable window_picker for
    -- explorer to work well with
    -- window splits
    actions = {
        open_file = {
            window_picker = {
                enable = false,
            },
        },
    },
    filters = {
        custom = { ".DS_Store" },
    },
    git = {
        ignore = false,
    },
})

    local keymap = vim.keymap -- for conciseness
    keymap.set("n", "<C-t>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
    --keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
    --keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
    --keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer
