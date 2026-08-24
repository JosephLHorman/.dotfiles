return {
  {
    "nvim-mini/mini.nvim",
    version = false,
    config = function()
      require("mini.ai").setup({})
      require("mini.clue").setup({
        triggers = {
        { mode = { 'n', 'x' }, keys = '<Leader>' }, -- Leader triggers
        { mode = 'n', keys = '[' }, -- `[` and `]` keys
        { mode = 'n', keys = ']' },
        { mode = 'i', keys = '<C-x>' }, -- Built-in completion
        { mode = { 'n', 'x' }, keys = 'g' }, -- `g` key
        { mode = { 'n', 'x' }, keys = "'" }, -- Marks
        { mode = { 'n', 'x' }, keys = '`' },
        { mode = { 'n', 'x' }, keys = '"' }, -- Registers
        { mode = { 'i', 'c' }, keys = '<C-r>' },
        { mode = 'n', keys = '<C-w>' }, -- Window commands
        { mode = { 'n', 'x' }, keys = 'z' }, -- `z` key
      },

      clues = {
        -- TODO Add <leader> descriptions as needed
        -- TODO Potentially move to `opts` to remove `require` requirement
        require('mini.clue').gen_clues.square_brackets(),
        require('mini.clue').gen_clues.builtin_completion(),
        require('mini.clue').gen_clues.g(),
        require('mini.clue').gen_clues.marks(),
        require('mini.clue').gen_clues.registers(),
        require('mini.clue').gen_clues.windows(),
        require('mini.clue').gen_clues.z(),
      }
      })
      require("mini.comment").setup({})
      require("mini.pairs").setup({})
      require("mini.surround").setup({})
    end,
  },
}
