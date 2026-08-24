vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-attach-keymaps", { clear = true }),
  callback = function(event)
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = event.buf, desc = desc })
    end

    map("n", "gd", vim.lsp.buf.definition, "LSP: Go to definition")
    map("n", "gD", vim.lsp.buf.declaration, "LSP: Go to declaration")
    map("n", "gi", vim.lsp.buf.implementation, "LSP: Go to implementation")
    map("n", "gr", require("telescope.builtin").lsp_references, "LSP: Go to references")
    map("n", "K", vim.lsp.buf.hover, "LSP: Hover documentation")
    map("n", "<leader>rn", vim.lsp.buf.rename, "LSP: Rename symbol")
    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "LSP: Code action")
    map("n", "<leader>D", require("telescope.builtin").diagnostics, "LSP: Diagnostics (telescope)")
    map("n", "[d", vim.diagnostic.goto_prev, "Diagnostic: Previous")
    map("n", "]d", vim.diagnostic.goto_next, "Diagnostic: Next")
    map("n", "<leader>d", vim.diagnostic.open_float, "Diagnostic: Show line diagnostics")
  end,
})
