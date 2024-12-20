return {
  {
    'folke/tokyonight.nvim',
    config = function()
      require('tokyonight').setup {
        styles = { comments = { italic = false }, keywords = { italic = false } },
        lualine_bold = true,
      }
    end,
  },
  {
    'HoNamDuong/hybrid.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    'zenbones-theme/zenbones.nvim',
    dependencies = 'rktjmp/lush.nvim',
    lazy = false,
    priority = 1000,
  },
  {
    'blazkowolf/gruber-darker.nvim',
    opts = {
      italic = {
        comments = false,
      },
    },
    {
      'neanias/everforest-nvim',
      version = false,
      lazy = false,
      priority = 1000,
    },
  },
}
