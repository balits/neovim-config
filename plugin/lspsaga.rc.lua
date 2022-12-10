local status, lspsaga = pcall(require, "lspsaga")
if (not status) then return end

lspsaga.init_lsp_saga {
  server_filetype_map = {}
}

local opts = {
  noremap = true,
  silent = true
}

local km = vim.keymap.set
km("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
km("n", "gh", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
km("n", "gc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
km("n", "gd", "<cmd>Lspsaga lsp_finder<cr>", opts)
km("n", "P", "<cmd>Lspsaga peek_definition<cr>", opts)
