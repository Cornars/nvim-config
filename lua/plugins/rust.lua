return {
  {
    'neovim/nvim-lspconfig',
    event = "BufReadPre",  -- Load when a buffer is about to be read
    config = function()
      -- Your lspconfig setup here
    end
  },
  {
    'simrat39/rust-tools.nvim',
    ft = "rust",  -- Only load for Rust files
    dependencies = { 'neovim/nvim-lspconfig' },
    config = function()
      -- Your rust-tools setup here
    end
  },
  {
    'nvim-lua/plenary.nvim',
    lazy = true  -- Will be loaded when required by other plugins
  },
  {
    'mfussenegger/nvim-dap',
    cmd = { "DapContinue", "DapToggleBreakpoint" },  -- Load when these commands are called
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      -- Your dap setup here
    end
  }
}
