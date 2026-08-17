return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      local parsers = {
        "bash", "css", "html", "javascript", "json", "luadoc", 
        "python", "regex",
      }
      require("nvim-treesitter").install(parsers)

      -- Enable treesitter-based highlighting and indentation per-buffer
      vim.api.nvim_create_autocmd('FileType', {
        pattern = { '<filetype>' },
        callback = function() vim.treesitter.start() end,
      })
    end,
  }
}
