return {
  "folke/snacks.nvim",
  lazy = false,
  opts = {
    explorer = { enabled = true },
    indent = {
      enabled = true,
      animate = {
        enabled = false
      },
    },
    lazygit = { enabled = true },
    notifier = { enabled = true },
    picker = {
      sources = {
        explorer = {
          --auto_close = true,
          layout = { preset = "default" }, -- Use default instead of sidebar
          jump = { close = true }, -- Close immediately on select
          hidden = true,
          --ignored = true
        },
        files = {
          hidden = true,
          --ignored = true
        }
      },
    },
  },
  keys = {
    { "<leader>e", function() Snacks.explorer() end, desc = "Open Snacks Explorer"},
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit @ root"},
    { "<leader>gl", function() Snacks.lazygit.log() end, desc = "Lazygit log"},
    { "<leader>nh", function() Snacks.notifier.show_history() end, desc = "Show notification history"},
  },
}
