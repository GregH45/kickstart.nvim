-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

local plugins = {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          theme = "catppuccin",
          icons_enabled = true
        },
      }
    end,
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    lazy = false,
    ---@module "neo-tree"
    ---@type neotree.Config?
    opts = {
      close_if_last_window = true,
    },
    config = function()
      vim.keymap.set('n', '\\', ':Neotree toggle<CR>', { desc = 'Toggle Neo-tree', silent = true })
    end,
  },
  {
    'stevearc/conform.nvim',
    opts = function()
      return require 'custom.configs.conform'
    end,
  },
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        bashls = {},
      },
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- make sure to load this before all other plugins
    lazy = false,
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato", -- or "latte", "frappe", "mocha"
        transparent_background = false,
        integrations = {
          treesitter = true,
          cmp = true,
          neotree = true,
          telescope = true,
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
return plugins
