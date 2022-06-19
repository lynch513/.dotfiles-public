local map = vim.api.nvim_set_keymap
local g = vim.g
local default_opts = {noremap = true, silent = true}

-- map('i', 'jj', '<Esc>', {noremap = true})

-- Tabs and buffets keymaps
map('n', '[b', ':bprevious', {noremap = true, silent = true})
map('n', ']b', ':bnext', {noremap = true, silent = true})
map('n', '[t', ':tabprevious', {noremap = true, silent = true})
map('n', ']t', ':tabnext', {noremap = true, silent = true})

-- Add empty lines
map('n', ']<Space>', 'm`o<Esc>`', {noremap = true, silent = true})
map('n', '[<Space>', 'm`O<Esc>`', {noremap = true, silent = true})

-- Remap Esc
map('i', '<C-l>', '<Esc>', {noremap = true, silent = true})

-- Set leader key
g.mapleader = "<Space>"

-- Set line numbers
map('n', '<leader>n', ':set invnumber', {noremap = false, silent = false})

-- Show invisible chars
map('n', '<leader>l', ':set list!', {noremap = false, silent = false})

-- Spell checking
map('n', '<F7>', ':set spell!<CR>', default_opts)
