-- setting <Space> as leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- set new tab to Ctrl T
--
vim.keymap.set('n', '<C-t>', '<cmd>tabnew<cr>')
-- nerd font is set
vim.g.have_nerd_font = true

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
-- vim.opt.scrolloff = 10

-- Set general indentation settings
vim.opt.expandtab = true  -- Use spaces instead of tabs
vim.opt.shiftwidth = 2    -- Number of spaces to use for each step of (auto)indent
vim.opt.tabstop = 2       -- Number of spaces that a <Tab> counts for

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true


-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', {
    noremap = true
})

-- Show Diagnostic
vim.keymap.set('n', '<leader>ds', '<cmd>lua vim.diagnostic.open_float()<cr>', {})

vim.diagnostic.config({
  virtual_text = false,
})

-- Change semicolon to colon
vim.keymap.set('n', ';', ':', {})
-- Git shortcuts
vim.keymap.set('n', '<leader>gd', ':Gvdiff<CR>', {})
vim.keymap.set('n', '<leader>gg', ':Git<CR>', {})



-- Installing lazy.nvim plugin manager. 
-- Important for plugins lol
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
-- Auto-install lazy.nvim if not present
if not vim.uv.fs_stat(lazypath) then
  print('Installing lazy.nvim....')
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
  print('Done.')
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {'dart-lang/dart-vim-plugin'},
  {'tpope/vim-fugitive'},
  {'lewis6991/gitsigns.nvim'},
  {'folke/tokyonight.nvim'},
  {'neovim/nvim-lspconfig'},
  {'hrsh7th/nvim-cmp'},
  {'christoomey/vim-tmux-navigator', event = "VeryLazy"},
  {'wincent/terminus'},
  {'nvim-tree/nvim-tree.lua'},
  {'nvim-tree/nvim-web-devicons'},
  {'catppuccin/nvim'},
  {'vim-airline/vim-airline'},
  {'vim-airline/vim-airline-themes'},
  {'sindrets/winshift.nvim'},
  {
    "goolord/alpha-nvim",
    -- dependencies = { 'echasnovski/mini.icons' },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local startify = require("alpha.themes.startify")
      -- available: devicons, mini, default is mini
      -- if provider not loaded and enabled is true, it will try to use another provider
      startify.file_icons.provider = "devicons"
      require("alpha").setup(
        startify.config
      )
    end,
  },
  -- Telescope Tabs
  {
  	'LukasPietzschmann/telescope-tabs',
  	config = function()
  		require('telescope').load_extension 'telescope-tabs'
  		require('telescope-tabs').setup {
  			-- Your custom config :^)
  		}
  	end,
  	dependencies = { 'nvim-telescope/telescope.nvim' },
  },
  -- LSP Zero, for Language Server Protocol support
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
      { 'saadparwaiz1/cmp_luasnip' },
      { "rafamadriz/friendly-snippets" },

    }
  },

  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
      icons = {
        -- set icon mappings to true if you have a Nerd Font
        mappings = vim.g.have_nerd_font,
        -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
        -- default whick-key.nvim defined Nerd Font icons, otherwise define a string table
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },

      -- Document existing key chains
      spec = {
        { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>r', group = '[R]ename' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>w', group = '[W]inShift' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      },
    },
  },
  {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},

  {
    'nvim-flutter/flutter-tools.nvim',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = true,
},

})


-- empty setup using defaults
require("nvim-tree").setup()

require('catppuccin').setup({
  flavour = "mocha" -- or "latte", "macchiato", "frappe"
})

-- Set colorscheme
vim.cmd[[colorscheme catppuccin]]

-- Ensure vim-airline uses the Catppuccin theme
vim.cmd.AirlineTheme('catppuccin')

-- NOTE: to make any of this work you need a language server.
--
-- If you don't know what that is, watch this 5 min video:
-- https://www.youtube.com/watch?v=LaS32vctfOY

-- Reserve a space in the gutter
vim.opt.signcolumn = 'yes'

local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)


-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {       
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  end,
})
local cmp = require('cmp')
cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  },
  mapping = cmp.mapping.preset.insert({
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Scroll up and down in the completion documentation
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end,
  },
})


-- Lua
-- This is for window shifting. Just using a plugin 
require("winshift").setup({
  highlight_moving_win = true,  -- Highlight the window being moved
  focused_hl_group = "Visual",  -- The highlight group used for the moving window
  moving_win_options = {
    -- These are local options applied to the moving window while it's
    -- being moved. They are unset when you leave Win-Move mode.
    wrap = false,
    cursorline = false,
    cursorcolumn = false,
    colorcolumn = "",
  },
  keymaps = {
    disable_defaults = false, -- Disable the default keymaps
    win_move_mode = {
      ["h"] = "left",
      ["j"] = "down",
      ["k"] = "up",
      ["l"] = "right",
      ["H"] = "far_left",
      ["J"] = "far_down",
      ["K"] = "far_up",
      ["L"] = "far_right",
      ["<left>"] = "left",
      ["<down>"] = "down",
      ["<up>"] = "up",
      ["<right>"] = "right",
      ["<S-left>"] = "far_left",
      ["<S-down>"] = "far_down",
      ["<S-up>"] = "far_up",
      ["<S-right>"] = "far_right",
    },
  },
  ---A function that should prompt the user to select a window.
  ---
  ---The window picker is used to select a window while swapping windows with
  ---`:WinShift swap`.
  ---@return integer? winid # Either the selected window ID, or `nil` to
  ---   indicate that the user cancelled / gave an invalid selection.
  window_picker = function()
    return require("winshift.lib").pick_window({
      -- A string of chars used as identifiers by the window picker.
      picker_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
      filter_rules = {
        -- This table allows you to indicate to the window picker that a window
        -- should be ignored if its buffer matches any of the following criteria.
        cur_win = true, -- Filter out the current window
        floats = true,  -- Filter out floating windows
        filetype = {},  -- List of ignored file types
        buftype = {},   -- List of ignored buftypes
        bufname = {},   -- List of vim regex patterns matching ignored buffer names
      },
      ---A function used to filter the list of selectable windows.
      ---@param winids integer[] # The list of selectable window IDs.
      ---@return integer[] filtered # The filtered list of window IDs.
      filter_func = nil,
    })
  end,
})
-- Enter winshift mode
vim.keymap.set('n', '<leader>ws', '<cmd>WinShift<cr>', { desc = 'WinShift mode activate!' })


require('gitsigns').setup()
-- You'll find a list of language servers here:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
-- These are example language servers. 
require('lspconfig').gleam.setup({})
require('lspconfig').ocamllsp.setup({})

-- Manually configured by flutter-tools
-- require('lspconfig').dartls.setup({
-- })
require('lspconfig').lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})
require('lspconfig').clangd.setup({})
require("flutter-tools").setup {} -- use defaults
require("telescope").load_extension("flutter")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fr', '<cmd>Telescope flutter commands<cr>', { desc = 'Telescope flutter commands' })
vim.keymap.set('n', '<leader>ft', '<cmd>Telescope telescope-tabs list_tabs<cr>', { desc = 'Telescope tabs' })

require("luasnip.loaders.from_vscode").lazy_load()
lsp.setup()
