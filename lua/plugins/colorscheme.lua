return {
  {
    "rose-pine/neovim",
    lazy = true,
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        variant = "moon",
      })
    end,
  },
  -- set colorscheme whole use colorscheme and tab
  {
    "gbprod/nord.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require("nord").setup({})
    end,
  },
}
