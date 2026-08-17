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

      -- Enable treesitter-based highlighting and indentation per-buffer.
      -- Wildcard pattern + pcall avoids keeping a second filetype list in
      -- sync with `parsers` above; it just no-ops where no parser exists.
      vim.api.nvim_create_autocmd('FileType', {
        pattern = '*',
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })
    end,
  }
}
