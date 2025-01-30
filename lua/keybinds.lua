
-- set new tab to Ctrl T
vim.keymap.set('n', '<C-t>', '<cmd>tabnew<cr>')

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Change how we ESC when inserting
vim.keymap.set('i', 'kj', '<Esc>')

vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', {
    noremap = true
})

-- Show Diagnostic
vim.keymap.set('n', '<leader>ds', '<cmd>lua vim.diagnostic.open_float()<cr>', {})

-- Change semicolon to colon
vim.keymap.set('n', ';', ':', {})

-------- Git Shortcuts -------- 
vim.keymap.set('n', '<leader>gd', ':Gvdiff<CR>', {})
vim.keymap.set('n', '<leader>gg', ':Git<CR>', {})

-------- Telescope Settings -------- 
local telescope_builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, { desc = 'Telescope help tags' })

-- TODO: only allow this for flutter apps
-------- Telescope with Flutter -------- 
vim.keymap.set('n', '<leader>fr', '<cmd>Telescope flutter commands<cr>', { desc = 'Telescope flutter commands' })
vim.keymap.set('n', '<leader>ft', '<cmd>Telescope telescope-tabs list_tabs<cr>', { desc = 'Telescope tabs' })

-------- Enter WinShift Mode -------- 
vim.keymap.set('n', '<leader>ws', '<cmd>WinShift<cr>', { desc = 'WinShift mode activate!' })

-- TODO: find a way to transfer keymap commands for LSP server thingies here. 

-- Resizing window
vim.keymap.set('n', '<S-h>', '<cmd>vertical resize -3<cr>', {})
vim.keymap.set('n', '<S-l>', '<cmd>vertical resize +3<cr>', {})
vim.keymap.set('n', '<S-k>', '<cmd>resize -3<cr>', {})
vim.keymap.set('n', '<S-j>', '<cmd>resize +3<cr>', {})

-------- Loads current file in Node.js
vim.keymap.set('n', '<leader>js', '<cmd>w !node<cr>', { desc = 'Run current file in Node' })


-------- Loads current file in Python3
vim.keymap.set('n', '<leader>jp', '<cmd>w !python3<cr>', { desc = 'Run current file in Node' })

