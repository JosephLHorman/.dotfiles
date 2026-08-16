return {
  {
    "EdenEast/nightfox.nvim",
    priority = 1000, -- load before other plugins
    lazy = false, -- load at startup, not on-demand
    config = function()
      vim.cmd.colorscheme("carbonfox")
    end,
  },
}
