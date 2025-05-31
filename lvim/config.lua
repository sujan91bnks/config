-- ~/.config/lvim/lv-config.lua

-- Initialize lazy.nvim
require('lazy').setup({
  -- Your plugin configurations go here

  -- Example plugin
  {
    'stevearc/oil.nvim',
    config = function()
      require('oil').setup()
    end
  },

  -- Add more plugins here
})

-- Set text wrapping globally
vim.opt.wrap = true

