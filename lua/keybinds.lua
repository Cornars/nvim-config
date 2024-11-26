local telescope_builtin = require('telescope.builtin')
-- set new tab to Ctrl T
vim.keymap.set('n', '<C-t>', '<cmd>tabnew<cr>')

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', {
    noremap = true
})

-- Show Diagnostic
vim.keymap.set('n', '<leader>ds', '<cmd>lua vim.diagnostic.open_float()<cr>', {})


-- Change semicolon to colon
vim.keymap.set('n', ';', ':', {})
-- Git shortcuts
vim.keymap.set('n', '<leader>gd', ':Gvdiff<CR>', {})
vim.keymap.set('n', '<leader>gg', ':Git<CR>', {})

vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, { desc = 'Telescope help tags' })

-- Telescope with Flutter
-- TODO: only allow this for flutter apps
vim.keymap.set('n', '<leader>fr', '<cmd>Telescope flutter commands<cr>', { desc = 'Telescope flutter commands' })
vim.keymap.set('n', '<leader>ft', '<cmd>Telescope telescope-tabs list_tabs<cr>', { desc = 'Telescope tabs' })

-- Enter winshift mode
vim.keymap.set('n', '<leader>ws', '<cmd>WinShift<cr>', { desc = 'WinShift mode activate!' })




